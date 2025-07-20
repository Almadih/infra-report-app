// lib/providers/report_provider.dart
import 'package:infra_report/models/report_model.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_provider.g.dart';

// Provider to fetch reports
@riverpod
Stream<List<Report>> reports(ref) {
  final repository = ref.watch(reportRepositoryProvider);
  // This is now a pure "read" operation. It just returns the DB stream.
  return repository.watchReports();
}
