// lib/providers/damage_type_provider.dart
import 'package:infra_report/models/report_model.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'damage_type_provider.g.dart';

@riverpod
Stream<List<DamageType>> damageTypes(ref) {
  final repository = ref.watch(reportRepositoryProvider);
  return repository.watchDamageTypes();
}
