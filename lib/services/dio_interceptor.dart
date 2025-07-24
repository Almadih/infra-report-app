// lib/services/dio_interceptor.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infra_report/models/auth_state.dart';
import 'package:infra_report/providers/database_provider.dart';
import 'package:infra_report/providers/image_cache_provider.dart';
import 'package:infra_report/services/secure_storage_service.dart';
import 'package:infra_report/utils/logger.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _storageService;

  AuthInterceptor(this._storageService);

  /// This method is called before the request is sent.
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 1. Read the token from secure storage.
    final token = await _storageService.read(SecureStorageService.tokenKey);

    // 2. If a token exists, add it to the Authorization header.
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Add other common headers if needed
    options.headers['Accept'] = 'application/json';

    // 3. Continue with the request.
    super.onRequest(options, handler);
  }

  /// This method can be used to intercept responses.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // You could do something with the response here, like logging.
    super.onResponse(response, handler);
  }

  /// This method can be used to handle errors globally.
  /// For example, if a 401 Unauthorized error occurs, you could
  /// trigger a logout.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // If we get a 401, it means our token is invalid or expired.
      // Here you would typically trigger a global logout event.
      // For now, we can just print a message.
      log.warning(
        'AUTH ERROR: Received 401 Unauthorized. Token might be invalid.',
      );
      // You could call a logout method from your Auth provider here.
      // final ref =

      logout(_storageService);
    }
    super.onError(err, handler);
  }
}

Future<void> logout(SecureStorageService storageService) async {
  final ref = ProviderContainer();

  // Delete both token and user data
  await storageService.delete(SecureStorageService.userKey);
  await storageService.delete(SecureStorageService.tokenKey);
  await storageService.delete(SecureStorageService.fcmTokenKey);
  await ref.read(appDatabaseProvider).deleteEverything();
  final state = const AsyncData(AuthState.unauthenticated());
  // Also clear image cache on logout for privacy
  ref.read(imageCacheManagerProvider).emptyCache();
}
