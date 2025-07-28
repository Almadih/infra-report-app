// lib/config/api_config.dart
import 'package:flutter/foundation.dart';

class ApiConfig {
  static const String baseUrl = kDebugMode
      ? "http://10.234.132.176:8000"
      : "https://infra-report.almadih.dev"; // Placeholder API URL
  static const String reportsEndpoint = "/api/reports";
  static const String myReportsEndpoint = "/api/my-reports";
  static const String damageTypesEndpoint = "/api/damage-types"; // New
  static const String severitiesEndpoint = "/api/severities"; // New
  static const String authEndpoint = "/api/auth";
  static const String notificationEndpoint = "/api/notifications";
  static const String fcmTokenEndpoint = "/api/fcm-token";
  static const String profileEndpoint = "/api/profile";
  static const bool useMockData = false;
}
