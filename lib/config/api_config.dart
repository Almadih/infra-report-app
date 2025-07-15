// lib/config/api_config.dart
class ApiConfig {
  static const String baseUrl =
      "http://192.168.1.30:8000"; // Placeholder API URL
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
