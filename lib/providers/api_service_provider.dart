import 'package:infra_report/providers/dio_provider.dart';
import 'package:infra_report/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service_provider.g.dart';

@riverpod
ApiService apiService(ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
}
