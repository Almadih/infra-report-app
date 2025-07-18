// lib/providers/database_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:infra_report/database/database.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(ref) {
  final db = AppDatabase();
  ref.onDispose(() {
    db.close();
  });
  return db;
}
