// lib/services/secure_storage_service.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_service.g.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const tokenKey = 'auth_token';
  static const fcmTokenKey = 'fcm_token';
  static const userKey = 'user';

  Future<void> write(String key, dynamic value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}

@riverpod
SecureStorageService secureStorageService(ref) {
  return SecureStorageService();
}
