// lib/providers/report_provider.dart
import 'package:infra_report/models/report_model.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_reports_provider.g.dart';

// Provider to fetch reports
@Riverpod(keepAlive: true)
Stream<List<Report>> myReports(ref) {
  // 1. Watch the repository provider.
  final repository = ref.watch(reportRepositoryProvider);

  return repository.watchMyReports();
}
