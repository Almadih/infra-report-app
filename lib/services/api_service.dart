// lib/services/api_service.dart
import 'dart:convert';
import 'dart:developer'; // For logging
import 'package:dio/dio.dart';
import 'package:flutter_application_1/config/api_config.dart';
import 'package:flutter_application_1/models/auth_response.dart';
import 'package:flutter_application_1/models/notification_model.dart';
import 'package:flutter_application_1/models/report_model.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:geolocator/geolocator.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<void> saveFcmToken(String fcmToken) async {
    try {
      // Typically, this would be a POST or PUT request.
      final response = await _dio.post(
        ApiConfig.fcmTokenEndpoint,
        data: {"fcm_token": fcmToken},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to save fcm token.');
      } else {
        print("fcm token saved successfully");
      }
    } on DioException catch (e) {
      throw Exception('Failed to save fcm token: ${e.message}');
    }
  }

  Future<void> markAllNotificationsAsRead() async {
    try {
      // Typically, this would be a POST or PUT request.
      final response = await _dio.get(
        '${ApiConfig.notificationEndpoint}/read-all',
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to mark notifications as read.');
      }
    } on DioException catch (e) {
      throw Exception('Failed to mark notifications as read: ${e.message}');
    }
  }

  Future<List<AppNotification>> fetchNotifications() async {
    try {
      final response = await _dio.get(ApiConfig.notificationEndpoint);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => AppNotification.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } on DioException catch (e, s) {
      print(s);
      throw Exception('Failed to load notifications: ${e.message}');
    }
  }

  // Helper for mock data

  Future<void> submitNewReport(FormData formData) async {
    try {
      final response = await _dio.post(
        ApiConfig.reportsEndpoint,
        data: formData,
        onSendProgress: (int sent, int total) {
          // Optional: You can use this to update a progress indicator
          print('Upload progress: ${(sent / total * 100).toStringAsFixed(2)}%');
        },
      );

      if (response.statusCode != 200) {
        // 201 Created is typical for POST
        throw Exception('Server returned an error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Provide more specific error info if available
      print(e.response?.data);
      throw Exception('Failed to submit report: ${e.message}');
    }
  }

  Future<List<Report>> fetchReports({
    int radius = 20000,
    required Position location,
  }) async {
    print("location $location");

    try {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.reportsEndpoint}',
        queryParameters: {
          'lat': location.latitude,
          'lng': location.longitude,
          'radius': radius,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data is List
            ? response.data
            : response.data['data'];
        print("usr ${data.first['user']}");
        return data.map((json) => Report.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reports api : ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load reports (Dio): ${e}');
    }
  }

  Future<List<Report>> fetchMyReports() async {
    // ... (existing code)
    if (ApiConfig.useMockData) {
      return _getMockReports();
    }
    try {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.myReportsEndpoint}',
      );
      print(jsonEncode(response.data));
      if (response.statusCode == 200) {
        List<dynamic> data = response.data is List
            ? response.data
            : response.data['data']; // Adjust based on your API
        return data.map((json) => Report.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reports api : ${response.statusCode}');
      }
    } catch (e, s) {
      print(s);
      throw Exception('Failed to load reports (Dio): ${e}');
    }
  }

  Future<Report> fetchReportById({required String id}) async {
    try {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.reportsEndpoint}/$id',
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        return Report.fromJson(data);
      } else {
        throw Exception('Failed to load reports api : ${response.statusCode}');
      }
    } catch (e, s) {
      print(s);
      throw Exception('Failed to load reports (Dio): ${e}');
    }
  }

  Future<List<DamageType>> fetchDamageTypes() async {
    if (ApiConfig.useMockData) {
      return _getMockDamageTypes();
    }
    try {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.damageTypesEndpoint}',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data is List
            ? response.data
            : response.data['data'];
        return data.map((json) => DamageType.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load damage types: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching damage types: $e');
      throw Exception('Failed to load damage types: $e');
    }
  }

  Future<AuthResponse> authenticateWithDeviceId(String deviceId) async {
    // In a real app, use the actual endpoint

    try {
      final response = await _dio.post(
        '${ApiConfig.baseUrl}${ApiConfig.authEndpoint}',
        data: {'device_id': deviceId},
      );
      if (response.statusCode == 200 &&
          response.data['access_token'] != null &&
          response.data['user'] != null) {
        print(response.data);
        return AuthResponse(
          token: response.data['access_token'],
          user: User.fromJson(response.data['user']),
        );
      } else {
        throw Exception(
          'Failed to authenticate: Invalid response from server.',
        );
      }
    } on DioException catch (e) {
      // Handle specific Dio errors (network, timeout, etc.)
      throw Exception('Authentication failed: ${e.message}');
    } catch (e) {
      throw Exception(
        'An unexpected error occurred during authentication. :${e.toString()}',
      );
    }
  }

  Future<List<Severity>> fetchSeverities() async {
    if (ApiConfig.useMockData) {
      return _getMockSeverities();
    }
    try {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.severitiesEndpoint}',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data is List
            ? response.data
            : response.data['data'];
        return data.map((json) => Severity.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load severities: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching severities: $e');
      throw Exception('Failed to load severities: $e');
    }
  }

  Future<List<Report>> _getMockReports() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Report.fromJson({
        "id": "01975a66-1410-7017-b81c-b9956b98c613",
        "user_id": 1,
        "severity_id": 4,
        "status_id": 3,
        "damage_type_id": 3,
        "location": {
          "type": "Point",
          "coordinates": [29.923168623040166, 30.94144551831464],
        },
        "description":
            "Asperiores est ad aut. Voluptatem omnis cum pariatur sed accusamus.",
        "address": "12362 Loyal Forge\nPort Alexysville, AK 26672",
        "created_at": "2025-06-07T22:17:23.000000Z",
        "updated_at": "2025-06-10T15:12:08.000000Z",
        "city": "Lake Jevon",
        "damage_type": {"id": 3, "name": "Power Line"},
        "severity": {"id": 4, "name": "critical"},
        "status": {"id": 3, "name": "verified"},
        "images": [
          // Add mock images
          {"id": 1, "url": "https://picsum.photos/seed/report1img1/600/400"},
          {"id": 2, "url": "https://picsum.photos/seed/report1img2/600/400"},
        ],
      }),
      Report.fromJson({
        "id": "01975a66-1410-7017-b81c-b9956b98c614",
        "user_id": 2,
        "severity_id": 2,
        "status_id": 1,
        "damage_type_id": 1,
        "location": {
          "type": "Point",
          "coordinates": [29.925000, 30.940000],
        },
        "description":
            "Another report description here. This one is less severe.",
        "address": "456 Main St\nAnytown, USA 12345",
        "created_at": "2025-06-08T10:00:00.000000Z",
        "updated_at": "2025-06-09T11:00:00.000000Z",
        "city": "Anytown",
        "damage_type": {"id": 1, "name": "Pothole"},
        "severity": {
          "id": 2,
          "name": "medium",
        }, // Changed from moderate to medium for consistency
        "status": {"id": 1, "name": "pending"},
        "images": [
          {"id": 3, "url": "https://picsum.photos/seed/report2img1/600/400"},
        ],
      }),
      Report.fromJson({
        // Report with no image for testing
        "id": "01975a66-1410-7017-b81c-b9956b98c615",
        "user_id": 3,
        "severity_id": 1,
        "status_id": 2,
        "damage_type_id": 2,
        "location": {
          "type": "Point",
          "coordinates": [29.920000, 30.930000],
        },
        "description": "A minor issue with no image provided.",
        "address": "789 Side Street\nSomeville, CA 90210",
        "created_at": "2025-06-09T14:30:00.000000Z",
        "updated_at": "2025-06-09T14:30:00.000000Z",
        "city": "Someville",
        "damage_type": {"id": 2, "name": "Road Damage"},
        "severity": {"id": 1, "name": "low"},
        "status": {"id": 2, "name": "in progress"},
        "images": [], // No images
      }),
    ];
  }

  // Mock data for Damage Types
  Future<List<DamageType>> _getMockDamageTypes() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const DamageType(id: 1, name: "School Building"),
      const DamageType(id: 2, name: "Road Damage"),
      const DamageType(id: 3, name: "Public Building"),
      const DamageType(id: 4, name: "Hospital Infrastructure"),
      const DamageType(id: 5, name: "Power Line"), // From original example
    ];
  }

  // Mock data for Severities
  Future<List<Severity>> _getMockSeverities() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const Severity(id: 1, name: "Low"),
      const Severity(id: 2, name: "Medium"),
      const Severity(id: 3, name: "High"),
      const Severity(id: 4, name: "Critical"),
    ];
  }
}
