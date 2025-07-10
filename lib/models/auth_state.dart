// lib/models/auth_state.dart
import 'package:flutter_application_1/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  // Represents the state when the user is authenticated
  const factory AuthState.authenticated({
    required User user,
    required String token,
  }) = Authenticated;

  // Represents the state when the user is not authenticated
  const factory AuthState.unauthenticated() = Unauthenticated;
}
