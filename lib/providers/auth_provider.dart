// lib/providers/damage_type_provider.dart

import 'dart:convert';

import 'package:flutter_application_1/models/auth_state.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/providers/api_service_provider.dart';
import 'package:flutter_application_1/providers/image_cache_provider.dart';
import 'package:flutter_application_1/providers/report_provider.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/services/secure_storage_service.dart';
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
    final user = await _storageService.read(SecureStorageService.userKey);

    if (token != null && user != null) {
      return AuthState.authenticated(
        user: User.fromJson(jsonDecode(user)),
        token: token,
      );
    }

    return const AuthState.unauthenticated();
  }

  Future<String?> _getDeviceId() async {
    final mobileDeviceIdentifierPlugin = MobileDeviceIdentifier();
    String? deviceId = await mobileDeviceIdentifierPlugin.getDeviceId();

    print("device id $deviceId");
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

      print("device id $deviceId");

      final authResponse = await _apiService.authenticateWithDeviceId(deviceId);
      final token = authResponse.token;
      final user = authResponse.user;

      print("token $token");
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
    state = const AsyncData(AuthState.unauthenticated());
    // Also clear image cache on logout for privacy
    ref.read(imageCacheManagerProvider).emptyCache();
  }

  Future<void> updateProfile({
    required String name,
    required bool isPublic,
  }) async {
    // Get the current authenticated state
    final currentState = state.value;
    if (currentState is! Authenticated) {
      throw Exception("User is not authenticated.");
    }

    try {
      // Get the repository (assuming you've added a provider for it)
      final api = ref.read(apiServiceProvider);

      // Call the repository to update the profile on the server
      final updatedUser = await api.updateUserProfile(
        name: name,
        isPublic: isPublic,
      );

      // Update local storage with the new user object
      await _storageService.write(
        SecureStorageService.userKey,
        jsonEncode(updatedUser.toJson()),
      );

      // Update the provider's state with the new user object, keeping the same token.
      state = AsyncData(
        AuthState.authenticated(user: updatedUser, token: currentState.token),
      );
    } catch (e) {
      // Don't update the state on failure, just re-throw the error
      // so the UI can display it.
      rethrow;
    }
  }
}
