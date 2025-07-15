// lib/providers/report_provider.dart
import 'package:flutter_application_1/models/report_model.dart';
import 'package:flutter_application_1/providers/dio_provider.dart';
import 'package:flutter_application_1/repositories/report_repository.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_provider.g.dart';

// Provider to fetch reports
@riverpod
Stream<List<Report>> reports(ref) {
  final repository = ref.watch(reportRepositoryProvider);
  // This is now a pure "read" operation. It just returns the DB stream.
  return repository.watchReports();
}
