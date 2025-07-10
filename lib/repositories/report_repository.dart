// lib/repositories/report_repository.dart
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/providers/api_service_provider.dart';
import 'package:flutter_application_1/providers/home_map_data_provider.dart';
import 'package:flutter_application_1/providers/my_reports_provider.dart';
import 'package:flutter_application_1/providers/report_provider.dart';
import 'package:flutter_application_1/providers/sync_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_application_1/models/report_model.dart' as app_models;
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/providers/database_provider.dart';
import 'package:flutter_application_1/providers/connectivity_provider.dart';
import 'package:uuid/uuid.dart';

part 'report_repository.g.dart';

class ReportRepository {
  final ApiService _apiService;
  final AppDatabase _db;
  final bool _isOnline;

  ReportRepository(this._apiService, this._db, this._isOnline);

  Stream<List<app_models.Report>> watchReports() {
    return _db.watchAllReports();
  }

  Future<void> syncReportsWithApi(Position? userPosition) async {
    if (!_isOnline) {
      print("Sync skipped: offline.");
      return; // Do nothing if offline
    }
    if (userPosition == null) {
      print("Sync skipped: no user position.");
      return;
    }

    try {
      final apiReports = await _apiService.fetchReports(location: userPosition);
      await _db.cacheApiReports(apiReports);
      print("Successfully synced reports with API.");
    } catch (e) {
      print("Failed to sync reports with API: $e");
      // Don't rethrow, as we don't want to crash the app if a background sync fails.
      // The UI will just show the old cached data.
    }
  }

  Future<void> forceRefreshReports(Position location) async {
    if (_isOnline) {
      final apiReports = await _apiService.fetchReports(location: location);
      await _db.cacheApiReports(apiReports);
    } else {
      throw Exception("Cannot refresh while offline.");
    }
  }

  Future<app_models.Report> getReportById({required String id}) async {
    if (_isOnline) {
      final report = await _apiService.fetchReportById(id: id);
      return report;
    } else {
      throw Exception("Cannot refresh while offline.");
    }
  }

  Stream<List<app_models.Report>> watchMyReports() {
    print("isonline $_isOnline");
    if (_isOnline) {
      // Fetch from network and update DB in the background.
      // The UI will react to DB changes automatically.
      _apiService
          .fetchMyReports()
          .then((apiReports) {
            _db.cacheApiMyReports(apiReports);
          })
          .catchError((e, s) {
            print("Failed to sync reports: $e");
          });
    }
    // Always return the stream from the local DB as the source of truth.
    return _db.watchMyReports();
  }

  Future<void> forceRefreshMyReports() async {
    if (_isOnline) {
      final apiReports = await _apiService.fetchMyReports();
      await _db.cacheApiMyReports(apiReports);
    } else {
      throw Exception("Cannot refresh while offline.");
    }
  }

  // Repeat pattern for Damage Types and Severities
  Stream<List<app_models.DamageType>> watchDamageTypes() {
    if (_isOnline) {
      _apiService.fetchDamageTypes().then(
        (items) => _db.cacheDamageTypes(items),
      );
    }
    return _db.watchAllDamageTypes();
  }

  Stream<List<app_models.Severity>> watchSeverities() {
    if (_isOnline) {
      _apiService.fetchSeverities().then((items) => _db.cacheSeverities(items));
    }
    return _db.watchAllSeverities();
  }

  Future<void> submitReport({
    required List<File> images,
    required double latitude,
    required double longitude,
    required int damageTypeId,
    required int severityId,
    String? description,
    String? city,
    required String address,
  }) async {
    // Construct the multipart form data
    final Map<String, dynamic> data = {
      'location[lat]': latitude,
      'location[lng]': longitude,
      'damage_type_id': damageTypeId,
      'severity_id': severityId,
      'city': city,
      'address': address,
      if (description != null) 'description': description,
    };

    // Add images to the form data
    for (int i = 0; i < images.length; i++) {
      final file = images[i];
      data['images[$i]'] = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last, // Use the original filename
      );
    }

    final formData = FormData.fromMap(data);

    // Use the ApiService to send the request
    await _apiService.submitNewReport(formData);
  }

  // --- NEW: METHOD TO QUEUE AN OFFLINE REPORT ---
  Future<void> queueOfflineReport({
    required List<String> imagePaths,
    required double latitude,
    required double longitude,
    required int damageTypeId,
    required int severityId,
    String? description,
    String? city,
    required String address,
  }) async {
    //insert into pending_reports
    await _db
        .into(_db.pendingReports)
        .insert(
          PendingReportsCompanion.insert(
            uuid: const Uuid().v4(),
            imagePaths: jsonEncode(imagePaths), // Store list as a JSON string
            latitude: latitude,
            longitude: longitude,
            damageTypeId: damageTypeId,
            severityId: severityId,
            description: Value(description),
            city: Value(city),
            address: address,
          ),
        );
  }

  // --- NEW: METHOD TO PROCESS THE OFFLINE QUEUE ---
  // Future<void> processPendingQueue() async {
  //   if (!_isOnline) return;

  //   final pending = await _db.pendingReports.select().get();
  //   if (pending.isEmpty) return;

  //   print("Processing ${pending.length} pending reports...");

  //   for (final report in pending) {
  //     // Prevent re-syncing if already in progress
  //     if (report.isSyncing) continue;

  //     try {
  //       // Mark as syncing in the DB
  //       await (_db.pendingReports.update()
  //             ..where((t) => t.id.equals(report.id)))
  //           .write(const PendingReportsCompanion(isSyncing: Value(true)));

  //       // Reconstruct the submission data
  //       final imagePaths = (jsonDecode(report.imagePaths) as List)
  //           .cast<String>();
  //       final imageFiles = imagePaths.map((path) => File(path)).toList();

  //       // Use the same submission method
  //       await submitReport(
  //         images: imageFiles,
  //         latitude: report.latitude,
  //         longitude: report.longitude,
  //         damageTypeId: report.damageTypeId,
  //         severityId: report.severityId,
  //         description: report.description,
  //         city: report.city,
  //         address: report.address,
  //       );

  //       // If successful, delete from the queue
  //       await (_db.pendingReports.delete()
  //             ..where((t) => t.id.equals(report.id)))
  //           .go();
  //       print("Successfully synced report with UUID: ${report.uuid}");
  //       _ref.invalidate(reportsProvider);
  //       _ref.invalidate(homeMapDataProvider);
  //     } catch (e) {
  //       print(
  //         "Failed to sync report with UUID ${report.uuid}. Will retry later. Error: $e",
  //       );
  //       // If failed, unmark as syncing so it can be picked up again
  //       await (_db.pendingReports.update()
  //             ..where((t) => t.id.equals(report.id)))
  //           .write(const PendingReportsCompanion(isSyncing: Value(false)));
  //     }
  //   }
  // }

  Future<void> processPendingQueue(WidgetRef ref) async {
    if (!_isOnline) return;

    final pendingReports = await _db.getQueuedReports();
    print("pending queue ${pendingReports.length} reports");
    if (pendingReports.isEmpty) return;

    // Get the sync notifier
    final syncNotifier = ref.read(syncProvider.notifier);

    // Start the sync process
    syncNotifier.startSync(pendingReports.length);

    for (final report in pendingReports) {
      try {
        await _db.updatePendingReport(
          report.id,
          const PendingReportsCompanion(isSyncing: Value(true)),
        );

        print("pending queue processing ${report.id}");

        // ... reconstruct form data ...
        final imagePaths = (jsonDecode(report.imagePaths) as List)
            .cast<String>();
        final imageFiles = imagePaths.map((path) => File(path)).toList();
        await submitReport(
          images: imageFiles,
          latitude: report.latitude,
          longitude: report.longitude,
          damageTypeId: report.damageTypeId,
          severityId: report.severityId,
          description: report.description,
          city: report.city,
          address: report.address,
        );

        await _db.deletePendingReport(report.id);
        print(
          "pending queue Successfully synced report with UUID: ${report.uuid}",
        );

        ref.invalidate(myReportsProvider);
        ref.invalidate(reportsProvider);
        ref.invalidate(homeMapDataProvider);

        // Report a successful sync for one item
        syncNotifier.reportSuccess();
      } catch (e) {
        print(
          "pending queue Failed to sync report with UUID ${report.uuid}. Error: $e",
        );
        await _db.updatePendingReport(
          report.id,
          const PendingReportsCompanion(isSyncing: Value(false)),
        );

        // Report an error and stop the process for now
        syncNotifier.reportError();
        return; // Exit the loop on first error
      }
    }
    // If the loop completes without error, finishSync() will have been called by the last reportSuccess()
  }

  Future<int> getPendingReportsCount() async {
    final pending = await _db.pendingReports.select().get();
    print(pending);
    return pending.length;
  }
}

@riverpod
ReportRepository reportRepository(ref) {
  return ReportRepository(
    ref.watch(apiServiceProvider), // Your existing ApiService provider
    ref.watch(appDatabaseProvider),
    ref.watch(appConnectivityProvider).value ?? false, // Check if online
  );
}
