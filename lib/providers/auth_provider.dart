// lib/providers/damage_type_provider.dart

import 'dart:convert';

import 'package:infra_report/models/auth_state.dart';
import 'package:infra_report/models/user_model.dart';
import 'package:infra_report/providers/api_service_provider.dart';
import 'package:infra_report/providers/connectivity_provider.dart';
import 'package:infra_report/providers/database_provider.dart';
import 'package:infra_report/providers/image_cache_provider.dart';
import 'package:infra_report/services/api_service.dart';
import 'package:infra_report/services/secure_storage_service.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:crypto/crypto.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  late final SecureStorageService _storageService;
  late final ApiService _apiService;

  @override
  Future<AuthState> build() async {
    _storageService = ref.watch(secureStorageServiceProvider);
    _apiService = ref.watch(apiServiceProvider);

    // Check storage for existing token and user data
    final token = await _storageService.read(SecureStorageService.tokenKey);
    // final user = await _storageService.read(SecureStorageService.userKey);
    final isOnline = await ref.read(appConnectivityProvider.future);
    if (token != null) {
      if (isOnline) {
        final user = await _apiService.fetchProfile();
        await _storageService.write(
          SecureStorageService.userKey,
          jsonEncode(user.toJson()),
        );
      }

      final user = User.fromJson(
        jsonDecode(
          await _storageService.read(SecureStorageService.userKey) ?? "{}",
        ),
      );
      return AuthState.authenticated(user: user, token: token);
    }

    return const AuthState.unauthenticated();
  }

  Future<String?> _getDeviceId() async {
    final mobileDeviceIdentifierPlugin = MobileDeviceIdentifier();
    String? deviceId = await mobileDeviceIdentifierPlugin.getDeviceId();
    if (deviceId == null) {
      return null;
    }
    return md5.convert(utf8.encode(deviceId)).toString();
  }

  Future<void> login() async {
    // Set state to loading
    state = const AsyncLoading();

    try {
      final deviceId = await _getDeviceId();
      if (deviceId == null) {
        throw Exception("Could not retrieve device ID.");
      }

      final authResponse = await _apiService.authenticateWithDeviceId(deviceId);
      final token = authResponse.token;
      final user = authResponse.user;
      await _storageService.write(SecureStorageService.tokenKey, token);
      await _storageService.write(
        SecureStorageService.userKey,
        jsonEncode(user.toJson()),
      );

      // Update state with the new token
      state = AsyncData(
        AuthState.authenticated(
          user: authResponse.user,
          token: authResponse.token,
        ),
      );
    } catch (e, s) {
      // Update state with the error
      state = AsyncError(e, s);
      // Re-throw if you want the UI to catch it as well
      rethrow;
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    // Delete both token and user data
    await _storageService.delete(SecureStorageService.userKey);
    await _storageService.delete(SecureStorageService.tokenKey);
    await _storageService.delete(SecureStorageService.fcmTokenKey);
    await ref.read(appDatabaseProvider).deleteEverything();
    state = const AsyncData(AuthState.unauthenticated());
    // Also clear image cache on logout for privacy
    ref.read(imageCacheManagerProvider).emptyCache();
  }

  Future<void> updateProfile({
    required String name,
    required bool isPublic,
  }) async {
    // Call the repository to update the profile on the server
    final updatedUser = await _apiService.updateUserProfile(
      name: name,
      isPublic: isPublic,
    );

    // Update local storage with the new user object
    await _storageService.write(
      SecureStorageService.userKey,
      jsonEncode(updatedUser.toJson()),
    );
  }

  Future<User> fetchProfile() async {
    final user = await _apiService.fetchProfile();
    await _storageService.write(
      SecureStorageService.userKey,
      jsonEncode(user.toJson()),
    );
    return user;
  }
}
