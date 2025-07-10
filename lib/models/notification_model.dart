// lib/models/notification_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

// Model for the innermost `data` object
@freezed
sealed class NotificationPayload with _$NotificationPayload {
  const factory NotificationPayload({
    @JsonKey(name: 'report_id') String? reportId,
    // Add other potential keys here if they become known
    // e.g., String? announcementUrl,
  }) = _NotificationPayload;

  factory NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadFromJson(json);
}

// Model for the main `data` object
@freezed
sealed class NotificationData with _$NotificationData {
  const factory NotificationData({
    required String title,
    required String body,
    // The nested data object, which can be nullable
    NotificationPayload? data,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

// --- Main AppNotification Model with Custom Converter ---

@freezed
sealed class AppNotification with _$AppNotification {
  // Our internal app model will be flat and clean.
  const factory AppNotification({
    required String id,
    required String type,
    // We will flatten the data from the nested objects here
    required String title,
    required String body,
    String? reportId, // Extracted from the nested data
    @JsonKey(name: 'read_at') DateTime? readAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _AppNotification;

  // Custom fromJson factory to handle the nested structure
  factory AppNotification.fromJson(Map<String, dynamic> json) {
    // 1. First, parse the nested `data` object.
    final notificationData = NotificationData.fromJson(
      json['data'] as Map<String, dynamic>,
    );

    // 2. Then, build our flat AppNotification object.
    return AppNotification(
      id: json['id'] as String,
      type: json['type'] as String,
      // Extract title and body from the parsed notificationData
      title: notificationData.title,
      body: notificationData.body,
      // Extract reportId from the innermost data object, if it exists
      reportId: notificationData.data?.reportId,
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
