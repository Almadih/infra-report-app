// lib/database/tables.dart
import 'package:drift/drift.dart';

// This table will cache the reports fetched from the API.
// Note: Drift tables are simpler with flat data. We'll store nested object data directly.
class LocalReports extends Table {
  TextColumn get id => text()(); // The API's report ID (UUID)
  IntColumn get userId => integer().named('user_id')();
  IntColumn get severityId => integer().named('severity_id')();
  IntColumn get statusId => integer().named('status_id')();
  IntColumn get damageTypeId => integer().named('damage_type_id')();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get description => text().nullable()();
  TextColumn get address => text()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  TextColumn get city => text().nullable()();
  TextColumn get updates => text().withDefault(const Constant('[]'))();
  TextColumn get flags => text().withDefault(const Constant('[]'))();

  // Denormalized data for easier display from cache
  TextColumn get damageTypeName => text().named('damage_type_name')();
  TextColumn get severityName => text().named('severity_name')();
  TextColumn get statusName => text().named('status_name')();

  @override
  Set<Column> get primaryKey => {id};
}

class MyLocalReports extends Table {
  TextColumn get id => text()(); // The API's report ID (UUID)
  IntColumn get userId => integer().named('user_id')();
  IntColumn get severityId => integer().named('severity_id')();
  IntColumn get statusId => integer().named('status_id')();
  IntColumn get damageTypeId => integer().named('damage_type_id')();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get description => text().nullable()();
  TextColumn get address => text()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  TextColumn get city => text().nullable()();

  // Denormalized data for easier display from cache
  TextColumn get damageTypeName => text().named('damage_type_name')();
  TextColumn get severityName => text().named('severity_name')();
  TextColumn get statusName => text().named('status_name')();

  @override
  Set<Column> get primaryKey => {id};
}

// A separate table for images, linked by the report's ID
class LocalReportImages extends Table {
  IntColumn get id => integer()(); // Local DB key
  TextColumn get reportId =>
      text().references(LocalReports, #id)(); // Foreign key
  TextColumn get url => text()();
  @override
  Set<Column> get primaryKey => {id};
}

// Tables for caching selection lists (Damage Types, Severities)
class LocalDamageTypes extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

class LocalSeverities extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override
  Set<Column> get primaryKey => {id};
}

class PendingReports extends Table {
  // Use an auto-incrementing integer as the local primary key.
  IntColumn get id => integer().autoIncrement()();
  // A unique UUID for this pending report, to be sent to the server.
  TextColumn get uuid => text().unique()();

  // Use TEXT to store a JSON-encoded list of local image file paths.
  TextColumn get imagePaths => text()();

  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  IntColumn get damageTypeId => integer().named('damage_type_id')();
  IntColumn get severityId => integer().named('severity_id')();
  TextColumn get description => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get address => text()();

  // For UI feedback during sync
  BoolColumn get isSyncing => boolean().withDefault(const Constant(false))();
}

class Notifications extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  TextColumn get type => text()();
  TextColumn get reportId => text().nullable().named('report_id')();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get readAt => dateTime().nullable().named('read_at')();
}
