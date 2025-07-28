import 'package:dio/dio.dart';
import 'package:infra_report/config/api_config.dart';
import 'package:infra_report/models/auth_response.dart';
import 'package:infra_report/models/notification_model.dart';
import 'package:infra_report/models/report_model.dart';
import 'package:infra_report/models/user_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:infra_report/utils/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Error types for API
enum ApiErrorType { network, server, parsing, offline, unknown }

class ApiError implements Exception {
  final ApiErrorType type;
  final String message;
  final dynamic originalException;

  ApiError(this.type, this.message, [this.originalException]);

  @override
  String toString() => 'ApiError($type): $message';
}

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<User> updateUserProfile({
    required String name,
    required bool isPublic,
  }) async {
    return _safeApiCall(() async {
      log.info("API CALL: Updating user profile...");
      final response = await _dio.put(
        ApiConfig.profileEndpoint,
        data: {'name': name, 'show_info_to_public': isPublic},
      );
      log.info("name $name, isPublic $isPublic");
      if (response.statusCode == 200) {
        log.info("API CALL: Profile updated successfully.");
        return User.fromJson(response.data);
      } else {
        throw ApiError(
          ApiErrorType.server,
          'Server returned an error while updating profile.',
        );
      }
    });
  }

  Future<void> saveFcmToken(String fcmToken) async {
    return _safeApiCall(() async {
      final response = await _dio.post(
        ApiConfig.fcmTokenEndpoint,
        data: {"fcm_token": fcmToken},
      );
      log.info("response.statusCode $response");
      if (response.statusCode != 200) {
        throw ApiError(ApiErrorType.server, 'Failed to save fcm token.');
      } else {
        log.info("fcm token saved successfully");
      }
    });
  }

  Future<void> markAllNotificationsAsRead() async {
    return _safeApiCall(() async {
      final response = await _dio.get(
        '${ApiConfig.notificationEndpoint}/read-all',
      );
      if (response.statusCode != 200) {
        throw ApiError(
          ApiErrorType.server,
          'Failed to mark notifications as read.',
        );
      }
    });
  }

  Future<void> markNotificationAsRead(String id) async {
    return _safeApiCall(() async {
      final response = await _dio.post(
        '${ApiConfig.notificationEndpoint}/read-one/$id',
      );
      if (response.statusCode != 200) {
        throw ApiError(
          ApiErrorType.server,
          'Failed to mark notification as read.',
        );
      }
    });
  }

  Future<List<AppNotification>> fetchNotifications() async {
    return _safeApiCall(() async {
      final response = await _dio.get(ApiConfig.notificationEndpoint);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => AppNotification.fromJson(json)).toList();
      } else {
        throw ApiError(ApiErrorType.server, 'Failed to load notifications');
      }
    });
  }

  // Helper for mock data

  Future<void> submitNewReport(FormData formData) async {
    return _safeApiCall(() async {
      final response = await _dio.post(
        ApiConfig.reportsEndpoint,
        data: formData,
        onSendProgress: (int sent, int total) {
          log.info(
            'Upload progress:  [32m${(sent / total * 100).toStringAsFixed(2)}%\u001b[0m',
          );
        },
      );
      if (response.statusCode != 200) {
        throw ApiError(
          ApiErrorType.server,
          'Server returned an error: ${response.statusCode}',
        );
      }
    });
  }

  // Helper to check connectivity
  Future<bool> _isOnline() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Helper to wrap API calls with error handling and connectivity check
  Future<T> _safeApiCall<T>(Future<T> Function() apiCall) async {
    if (!await _isOnline()) {
      throw ApiError(
        ApiErrorType.offline,
        "No internet connection. Please check your connection and try again.",
      );
    }
    try {
      return await apiCall();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw ApiError(
          ApiErrorType.network,
          "Network timeout. Please try again.",
          e,
        );
      } else if (e.type == DioExceptionType.badResponse) {
        throw ApiError(
          ApiErrorType.server,
          "Server error:  ${e.response?.statusCode}",
          e,
        );
      } else {
        throw ApiError(
          ApiErrorType.network,
          "Network error. Please check your connection.",
          e,
        );
      }
    } catch (e) {
      throw ApiError(ApiErrorType.unknown, "Unexpected error occurred.", e);
    }
  }

  // Refactored fetchReports with improved error handling
  Future<(List<Report>, ReportLocation?)> fetchReports({
    int radius = 10000,
    required Position location,
  }) async {
    return _safeApiCall(() async {
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
        throw ApiError(
          ApiErrorType.server,
          'Failed to load reports api :  ${response.statusCode}',
        );
      }
    });
  }

  Future<List<Report>> fetchMyReports() async {
    return _safeApiCall(() async {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.myReportsEndpoint}',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data is List
            ? response.data
            : response.data['data']; // Adjust based on your API
        return data.map((json) => Report.fromJson(json)).toList();
      } else {
        throw ApiError(
          ApiErrorType.server,
          'Failed to load reports api : ${response.statusCode}',
        );
      }
    });
  }

  Future<Report> fetchReportById({required String id}) async {
    return _safeApiCall(() async {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.reportsEndpoint}/$id',
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        return Report.fromJson(data);
      } else {
        throw ApiError(
          ApiErrorType.server,
          'Failed to load reports api : ${response.statusCode}',
        );
      }
    });
  }

  Future<List<DamageType>> fetchDamageTypes() async {
    return _safeApiCall(() async {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.damageTypesEndpoint}',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data is List
            ? response.data
            : response.data['data'];
        return data.map((json) => DamageType.fromJson(json)).toList();
      } else {
        throw ApiError(
          ApiErrorType.server,
          'Failed to load damage types: ${response.statusCode}',
        );
      }
    });
  }

  Future<AuthResponse> authenticateWithDeviceId(String deviceId) async {
    // In a real app, use the actual endpoint

    return _safeApiCall(() async {
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
        throw ApiError(
          ApiErrorType.server,
          'Failed to authenticate: Invalid response from server.',
        );
      }
    });
  }

  Future<List<Severity>> fetchSeverities() async {
    return _safeApiCall(() async {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}${ApiConfig.severitiesEndpoint}',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data is List
            ? response.data
            : response.data['data'];
        return data.map((json) => Severity.fromJson(json)).toList();
      } else {
        throw ApiError(
          ApiErrorType.server,
          'Failed to load severities: ${response.statusCode}',
        );
      }
    });
  }

  // Refactored fetchProfile with improved error handling
  Future<User> fetchProfile() async {
    return _safeApiCall(() async {
      log.info("fetching profile");
      final response = await _dio.get(ApiConfig.profileEndpoint);
      if (response.statusCode == 200) {
        dynamic data = response.data;
        return User.fromJson(data);
      } else {
        throw ApiError(
          ApiErrorType.server,
          'Failed to load profile api :  ${response.statusCode}',
        );
      }
    });
  }
}
