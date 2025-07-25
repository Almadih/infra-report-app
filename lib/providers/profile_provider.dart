import 'dart:convert';

import 'package:infra_report/models/user_model.dart';
import 'package:infra_report/services/secure_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
Future<User> profile(ref) async {
  final storageService = ref.watch(secureStorageServiceProvider);
  final userJson = await storageService.read(SecureStorageService.userKey);
  if (userJson == null) {
    throw Exception("User not found");
  }

  final user = User.fromJson(jsonDecode(userJson));

  return user;
}
