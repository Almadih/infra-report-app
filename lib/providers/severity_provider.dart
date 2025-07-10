// lib/providers/severity_provider.dart
import 'package:flutter_application_1/models/report_model.dart';
import 'package:flutter_application_1/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'severity_provider.g.dart';

@riverpod
Stream<List<Severity>> severities(ref) {
  final repository = ref.watch(reportRepositoryProvider);

  return repository.watchSeverities();
}
