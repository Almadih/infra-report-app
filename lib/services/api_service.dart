import 'package:dio/dio.dart';
import 'package:infra_report/config/api_config.dart';
import 'package:infra_report/models/auth_response.dart';
import 'package:infra_report/models/notification_model.dart';
import 'package:infra_report/models/report_model.dart';
import 'package:infra_report/models/user_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:infra_report/utils/logger.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<User> updateUserProfile({
    required String name,
    required bool isPublic,
  }) async {
    log.info("API CALL: Updating user profile...");
    try {
      // This would typically be a PUT or PATCH request.
      final response = await _dio.put(
        ApiConfig.profileEndpoint,
        data: {'name': name, 'show_info_to_public': isPublic},
      );

      log.info("name $name, isPublic $isPublic");

      if (response.statusCode == 200) {
        log.info("API CALL: Profile updated successfully.");
        // Return the updated user object from the response
        return User.fromJson(response.data);
      } else {
        throw Exception('Server returned an error while updating profile.');
      }
    } catch (e) {
      log.warning('Failed to update profile: ${e.toString()}');
      throw Exception('Failed to update profile: ${e.toString()}');
    }
  }

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
        log.info("fcm token saved successfully");
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

  Future<void> markNotificationAsRead(String id) async {
    try {
      final response = await _dio.post(
        '${ApiConfig.notificationEndpoint}/read-one/$id',
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to mark notification as read.');
      }
    } on DioException catch (e) {
      throw Exception('Failed to mark notification as read: ${e.message}');
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
    } on DioException catch (e) {
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
          log.info(
            'Upload progress: ${(sent / total * 100).toStringAsFixed(2)}%',
          );
        },
      );

      if (response.statusCode != 200) {
        // 201 Created is typical for POST
        throw Exception('Server returned an error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to submit report: ${e.message}');
    }
  }

  Future<(List<Report>, ReportLocation?)> fetchReports({
    int radius = 10000,
    required Position location,
  }) async {
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
        List<dynamic> reportsJson = response.data['reports'];
        ReportLocation? center = response.data['center'] != null
            ? ReportLocation.fromJson(response.data['center'])
            : null;
        final reports = reportsJson
            .map((json) => Report.fromJson(json))
            .toList();

        return (reports, center);
      } else {
        throw Exception('Failed to load reports api : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load reports (Dio): $e');
    }
  }

  Future<List<Report>> fetchMyReports() async {
    try {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.myReportsEndpoint}',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data is List
            ? response.data
            : response.data['data']; // Adjust based on your API
        return data.map((json) => Report.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reports api : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load reports (Dio): $e');
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
    } catch (e) {
      throw Exception('Failed to load reports (Dio): $e');
    }
  }

  Future<List<DamageType>> fetchDamageTypes() async {
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
      log.warning('Error fetching damage types: $e');
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
      log.warning('Error fetching severities: $e');
      throw Exception('Failed to load severities: $e');
    }
  }

  Future<User> fetchProfile() async {
    try {
      log.info("fetching profile");
      final response = await _dio.get(ApiConfig.profileEndpoint);
      if (response.statusCode == 200) {
        dynamic data = response.data;
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load profile api : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load profile (Dio): $e');
    }
  }
}
