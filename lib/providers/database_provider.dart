// lib/providers/database_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_application_1/database/database.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(ref) {
  final db = AppDatabase();
  ref.onDispose(() {
    db.close();
  });
  return db;
}
