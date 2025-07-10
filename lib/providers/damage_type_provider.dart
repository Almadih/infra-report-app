// lib/providers/damage_type_provider.dart
import 'package:flutter_application_1/models/report_model.dart';
import 'package:flutter_application_1/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'damage_type_provider.g.dart';

@riverpod
Stream<List<DamageType>> damageTypes(ref) {
  final repository = ref.watch(reportRepositoryProvider);
  return repository.watchDamageTypes();
}
