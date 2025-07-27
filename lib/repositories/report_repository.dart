// lib/repositories/report_repository.dart
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:geocoding/geocoding.dart';
import 'package:infra_report/database/database.dart';
import 'package:infra_report/providers/api_service_provider.dart';
import 'package:infra_report/providers/home_map_data_provider.dart';
import 'package:infra_report/providers/my_reports_provider.dart';
import 'package:infra_report/providers/report_provider.dart';
import 'package:infra_report/providers/sync_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:infra_report/services/secure_storage_service.dart';
import 'package:infra_report/utils/index.dart';
import 'package:infra_report/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:infra_report/models/report_model.dart' as app_models;
import 'package:infra_report/services/api_service.dart';
import 'package:infra_report/providers/database_provider.dart';
import 'package:infra_report/providers/connectivity_provider.dart';
import 'package:uuid/uuid.dart';

part 'report_repository.g.dart';

class ReportRepository {
  final ApiService _apiService;
  final AppDatabase _db;
  final bool _isOnline;
  final SecureStorageService _secureStorageService;

  ReportRepository(
    this._apiService,
    this._db,
    this._isOnline,
    this._secureStorageService,
  );

  Stream<List<app_models.Report>> watchReports() {
    return _db.watchAllReports();
  }

  Future<void> syncReportsWithApi(Position? userPosition) async {
    if (!_isOnline) {
      log.info("Sync skipped: offline.");
      return; // Do nothing if offline
    }
    if (userPosition == null) {
      log.info("Sync skipped: no user position.");
      return;
    }

    try {
      final apiReports = await _apiService.fetchReports(location: userPosition);
      if (apiReports.$2 != null) {
        await _secureStorageService.write(
          SecureStorageService.centerKey,
          jsonEncode(apiReports.$2),
        );
      } else {
        await _secureStorageService.delete(SecureStorageService.centerKey);
      }
      await _db.cacheApiReports(apiReports.$1);
      log.info("Successfully synced reports with API.");
    } catch (e) {
      log.warning("Failed to sync reports with API: $e");
      // Don't rethrow, as we don't want to crash the app if a background sync fails.
      // The UI will just show the old cached data.
    }
  }

  Future<void> forceRefreshReports(Position location) async {
    if (_isOnline) {
      final apiReports = await _apiService.fetchReports(location: location);
      await _db.cacheApiReports(apiReports.$1);
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
    if (_isOnline) {
      // Fetch from network and update DB in the background.
      // The UI will react to DB changes automatically.
      _apiService
          .fetchMyReports()
          .then((apiReports) {
            _db.cacheApiMyReports(apiReports);
          })
          .catchError((e, s) {
            log.warning("Failed to sync reports: $e");
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

  Future<void> processPendingQueue(WidgetRef ref) async {
    if (!_isOnline) return;

    final pendingReports = await _db.getQueuedReports();
    log.info("pending queue ${pendingReports.length} reports");
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

        log.info("pending queue processing ${report.id}");

        // ... reconstruct form data ...
        final imagePaths = (jsonDecode(report.imagePaths) as List)
            .cast<String>();
        final imageFiles = imagePaths.map((path) => File(path)).toList();
        String address = "not available";
        String? city = "";
        List<Placemark> placeMarks = await placemarkFromCoordinates(
          report.latitude,
          report.longitude,
        );

        if (placeMarks.isNotEmpty) {
          final placeMark = placeMarks.first;
          //street, city, region, postalCode, country
          city = placeMark.administrativeArea;

          address = formatAddress(placeMark);
        }
        await submitReport(
          images: imageFiles,
          latitude: report.latitude,
          longitude: report.longitude,
          damageTypeId: report.damageTypeId,
          severityId: report.severityId,
          description: report.description,
          city: city,
          address: address,
        );

        await _db.deletePendingReport(report.id);
        log.info(
          "pending queue Successfully synced report with UUID: ${report.uuid}",
        );

        ref.invalidate(myReportsProvider);
        ref.invalidate(reportsProvider);
        ref.invalidate(homeMapDataProvider);

        // Report a successful sync for one item
        syncNotifier.reportSuccess();
      } catch (e) {
        log.info(
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
    return pending.length;
  }
}

@riverpod
ReportRepository reportRepository(ref) {
  return ReportRepository(
    ref.watch(apiServiceProvider), // Your existing ApiService provider
    ref.watch(appDatabaseProvider),
    ref.watch(appConnectivityProvider).value ?? false, // Check if online
    ref.watch(secureStorageServiceProvider),
  );
}
