// lib/database/database.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:infra_report/models/notification_model.dart';
import 'package:infra_report/utils/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:infra_report/models/report_model.dart' as app_models;
import 'tables.dart';

part 'database.g.dart'; // Drift will generate this file

@DriftDatabase(
  tables: [
    LocalReports,
    LocalReportImages,
    LocalDamageTypes,
    LocalSeverities,
    MyLocalReports,
    PendingReports,
    Notifications,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3; // Increment this when you change tables

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        /// Create all tables
        m.createAll();
      },
      onUpgrade: (m, from, to) async {
        /// Run migration steps without foreign keys and re-enable them later
        /// (https://drift.simonbinder.eu/docs/advanced-features/migrations/#tips)
        await customStatement('PRAGMA foreign_keys = OFF');
        if (kDebugMode) {
          for (final table in allTables) {
            await m.deleteTable(table.actualTableName);
            await m.createTable(table);
          }
        }
      },
      beforeOpen: (details) async {
        /// Enable foreign_keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> addPendingReport(PendingReportsCompanion entry) async {
    await into(pendingReports).insert(entry);
  }

  /// Gets all reports from the offline queue that are not currently being synced.
  Future<List<PendingReport>> getQueuedReports() async {
    return (select(
      pendingReports,
    )..where((tbl) => tbl.isSyncing.equals(false))).get();
  }

  /// Updates a pending report, usually to mark it as syncing.
  Future<void> updatePendingReport(
    int id,
    PendingReportsCompanion entry,
  ) async {
    await (update(
      pendingReports,
    )..where((tbl) => tbl.id.equals(id))).write(entry);
  }

  /// Deletes a report from the queue after it has been successfully synced.
  Future<void> deletePendingReport(int id) async {
    await (delete(pendingReports)..where((tbl) => tbl.id.equals(id))).go();
  }

  // --- Data Access Methods ---
  // These methods handle converting between your Freezed models and Drift's data classes.

  // --- Reports ---
  Stream<List<app_models.Report>> watchAllReports() {
    // This is a simplified reactive query. For full reactivity on joined data,
    // it can get more complex. This re-fetches images when the reports table changes.
    return (select(localReports)..orderBy([
          (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
        ]))
        .watch()
        .asyncMap((dbReports) => _mapDbReportsToAppModels(dbReports));
  }

  Stream<List<AppNotification>> watchNotifications() {
    return (select(notifications)..orderBy([
          (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
        ]))
        .watch()
        .asyncMap(
          (dbNotifications) => _mapDbNotificationsToAppModels(dbNotifications),
        );
  }

  Stream<List<app_models.Report>> watchMyReports() {
    // This is a simplified reactive query. For full reactivity on joined data,
    // it can get more complex. This re-fetches images when the reports table changes.
    return (select(myLocalReports)..orderBy([
          (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
        ]))
        .watch()
        .asyncMap((dbReports) => _mapMyDbReportsToAppModels(dbReports));
  }

  Future<List<app_models.Report>> getAllReports() async {
    final dbReports = await select(localReports).get();
    return _mapDbReportsToAppModels(dbReports);
  }

  Future<List<app_models.Report>> _mapMyDbReportsToAppModels(
    List<MyLocalReport> dbReports,
  ) async {
    // The parameter `dbReports` is of type List<database.g.dart -> Report>, which is correct.
    // We just need to ensure the implementation correctly maps it.

    final List<app_models.Report> appReports = [];
    for (final dbReport in dbReports) {
      // `dbReport` is of type `database.g.dart -> Report`
      final dbImages = await (select(
        localReportImages,
      )..where((tbl) => tbl.reportId.equals(dbReport.id))).get();

      appReports.add(
        // We are creating an instance of your Freezed model here
        app_models.Report(
          id: dbReport.id,
          userId: dbReport.userId,
          severityId: dbReport.severityId,
          statusId: dbReport.statusId,
          damageTypeId: dbReport.damageTypeId,
          location: app_models.ReportLocation(
            type: "Point",
            coordinates: [dbReport.longitude, dbReport.latitude],
          ),
          description: dbReport.description,
          address: dbReport.address,
          createdAt: dbReport.createdAt,
          updatedAt: dbReport.updatedAt,
          city: dbReport.city,
          damageType: app_models.DamageType(
            id: dbReport.damageTypeId,
            name: dbReport.damageTypeName,
          ),
          severity: app_models.Severity(
            id: dbReport.severityId,
            name: dbReport.severityName,
          ),
          status: app_models.Status(
            id: dbReport.statusId,
            name: dbReport.statusName,
          ),
          updates: _reportUpdatesFromJson(dbReport.updates),
          flags: _reportFlagsFromJson(dbReport.flags),
          images: dbImages
              .map(
                (img) => app_models.ReportImage(
                  id: img.id,
                  path: img.url,
                  report_id: dbReport.id,
                ),
              )
              .toList(),
        ),
      );
    }
    return appReports;
  }

  Future<List<app_models.Report>> _mapDbReportsToAppModels(
    List<LocalReport> dbReports,
  ) async {
    // The parameter `dbReports` is of type List<database.g.dart -> Report>, which is correct.
    // We just need to ensure the implementation correctly maps it.

    final List<app_models.Report> appReports = [];
    for (final dbReport in dbReports) {
      // `dbReport` is of type `database.g.dart -> Report`
      final dbImages = await (select(
        localReportImages,
      )..where((tbl) => tbl.reportId.equals(dbReport.id))).get();

      appReports.add(
        // We are creating an instance of your Freezed model here
        app_models.Report(
          id: dbReport.id,
          userId: dbReport.userId,
          severityId: dbReport.severityId,
          statusId: dbReport.statusId,
          damageTypeId: dbReport.damageTypeId,
          location: app_models.ReportLocation(
            type: "Point",
            coordinates: [dbReport.longitude, dbReport.latitude],
          ),
          description: dbReport.description,
          address: dbReport.address,
          createdAt: dbReport.createdAt,
          updatedAt: dbReport.updatedAt,
          city: dbReport.city,
          damageType: app_models.DamageType(
            id: dbReport.damageTypeId,
            name: dbReport.damageTypeName,
          ),
          severity: app_models.Severity(
            id: dbReport.severityId,
            name: dbReport.severityName,
          ),
          status: app_models.Status(
            id: dbReport.statusId,
            name: dbReport.statusName,
          ),
          updates: _reportUpdatesFromJson(dbReport.updates),
          flags: _reportFlagsFromJson(dbReport.flags),
          user: dbReport.user != null
              ? app_models.ReportUser.fromJson(jsonDecode(dbReport.user!))
              : null,
          images: dbImages
              .map(
                (img) => app_models.ReportImage(
                  id: img.id,
                  path: img.url,
                  report_id: dbReport.id,
                ),
              )
              .toList(),
        ),
      );
    }
    return appReports;
  }

  List<app_models.ReportUpdate> _reportUpdatesFromJson(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList
        .map((json) => app_models.ReportUpdate.fromJson(json))
        .toList();
  }

  List<app_models.ReportFlag> _reportFlagsFromJson(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList
        .map((json) => app_models.ReportFlag.fromJson(json))
        .toList();
  }

  Future<void> cacheApiReports(List<app_models.Report> apiReports) async {
    try {
      await batch((batch) {
        // Clear old data for a full refresh
        batch.deleteAll(localReportImages);
        batch.deleteAll(localReports);

        for (final apiReport in apiReports) {
          batch.insert(
            localReports,
            LocalReportsCompanion.insert(
              id: apiReport.id,
              userId: apiReport.userId,
              severityId: apiReport.severityId,
              statusId: apiReport.statusId,
              damageTypeId: apiReport.damageTypeId,
              latitude: apiReport.location.coordinates[1], // lat
              longitude: apiReport.location.coordinates[0], // lng
              description: Value(apiReport.description),
              address: apiReport.address,
              createdAt: apiReport.createdAt,
              updatedAt: apiReport.updatedAt,
              city: Value(apiReport.city),
              damageTypeName: apiReport.damageType.name,
              severityName: apiReport.severity.name,
              statusName: apiReport.status.name,
              updates: Value(jsonEncode(apiReport.updates)),
              flags: Value(jsonEncode(apiReport.flags)),
              user: Value(
                apiReport.user != null ? jsonEncode(apiReport.user) : null,
              ),
            ),
            mode: InsertMode.insertOrReplace,
          );

          for (final img in apiReport.images) {
            batch.insert(
              localReportImages,
              LocalReportImagesCompanion.insert(
                id: Value(img.id),
                reportId: apiReport.id,
                url: img.path,
              ),
            );
          }
        }
      });
    } catch (e) {
      log.warning("sync error $e");
    }
  }

  Future<void> cacheApiMyReports(List<app_models.Report> apiReports) async {
    await batch((batch) {
      // Clear old data for a full refresh
      batch.deleteAll(localReportImages);
      batch.deleteAll(myLocalReports);

      for (final apiReport in apiReports) {
        batch.insert(
          myLocalReports,
          MyLocalReportsCompanion.insert(
            id: apiReport.id,
            userId: apiReport.userId,
            severityId: apiReport.severityId,
            statusId: apiReport.statusId,
            damageTypeId: apiReport.damageTypeId,
            latitude: apiReport.location.coordinates[1], // lat
            longitude: apiReport.location.coordinates[0], // lng
            description: Value(apiReport.description),
            address: apiReport.address,
            createdAt: apiReport.createdAt,
            updatedAt: apiReport.updatedAt,
            city: Value(apiReport.city),
            damageTypeName: apiReport.damageType.name,
            severityName: apiReport.severity.name,
            statusName: apiReport.status.name,
            updates: Value(jsonEncode(apiReport.updates)),
            flags: Value(jsonEncode(apiReport.flags)),
          ),
          mode: InsertMode.insertOrReplace,
        );

        for (final img in apiReport.images) {
          batch.insert(
            localReportImages,
            LocalReportImagesCompanion.insert(
              id: Value(img.id),
              reportId: apiReport.id,
              url: img.path,
            ),
          );
        }
      }
    });
  }

  // --- DamageTypes ---
  Stream<List<app_models.DamageType>> watchAllDamageTypes() =>
      select(localDamageTypes).watch().map(
        (rows) => rows
            .map((row) => app_models.DamageType(id: row.id, name: row.name))
            .toList(),
      );

  Future<void> cacheDamageTypes(List<app_models.DamageType> items) async {
    await batch((batch) {
      batch.deleteAll(localDamageTypes);
      batch.insertAll(
        localDamageTypes,
        items.map(
          (item) => LocalDamageTypesCompanion.insert(
            id: Value(item.id),
            name: item.name,
          ),
        ),
      );
    });
  }

  // --- Severities ---
  Stream<List<app_models.Severity>> watchAllSeverities() =>
      select(localSeverities).watch().map(
        (rows) => rows
            .map((row) => app_models.Severity(id: row.id, name: row.name))
            .toList(),
      );

  Future<void> cacheSeverities(List<app_models.Severity> items) async {
    await batch((batch) {
      batch.deleteAll(localSeverities);
      batch.insertAll(
        localSeverities,
        items.map(
          (item) => LocalSeveritiesCompanion.insert(
            id: Value(item.id),
            name: item.name,
          ),
        ),
      );
    });
  }

  FutureOr<List<AppNotification>> _mapDbNotificationsToAppModels(
    List<Notification> dbNotifications,
  ) {
    final List<AppNotification> appNotifications = [];
    for (final dbNotification in dbNotifications) {
      appNotifications.add(
        AppNotification(
          id: dbNotification.id,
          type: dbNotification.type,
          title: dbNotification.title,
          body: dbNotification.body,
          reportId: dbNotification.reportId,
          createdAt: dbNotification.createdAt,
          readAt: dbNotification.readAt,
        ),
      );
    }

    return appNotifications;
  }

  Future<void> cacheApiNotifications(
    List<AppNotification> apiNotifications,
  ) async {
    await batch((batch) {
      batch.deleteAll(notifications);
      batch.insertAll(
        notifications,
        apiNotifications.map(
          (item) => NotificationsCompanion.insert(
            id: item.id,
            type: item.type,
            title: item.title,
            body: item.body,
            reportId: Value(item.reportId),
            createdAt: item.createdAt,
            readAt: Value(item.readAt),
          ),
        ),
      );
    });
  }

  Future<void> deleteEverything() {
    return transaction(() async {
      // you only need this if you've manually enabled foreign keys
      // await customStatement('PRAGMA foreign_keys = OFF');
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
