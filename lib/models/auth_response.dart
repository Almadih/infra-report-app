// lib/models/auth_response.dart

import 'package:flutter_application_1/models/user_model.dart';

class AuthResponse {
  final String token;
  final User user;

  AuthResponse({required this.token, required this.user});
}
