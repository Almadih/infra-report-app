import 'package:flutter_application_1/providers/dio_provider.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service_provider.g.dart';

@riverpod
ApiService apiService(ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
}
