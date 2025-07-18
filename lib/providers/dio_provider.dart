// lib/providers/dio_provider.dart
import 'package:dio/dio.dart';
import 'package:infra_report/config/api_config.dart';
import 'package:infra_report/services/dio_interceptor.dart';
import 'package:infra_report/services/secure_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(ref) {
  final storageService = ref.watch(secureStorageServiceProvider);
  final dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl));
  dio.interceptors.add(AuthInterceptor(storageService));
  return dio;
}
