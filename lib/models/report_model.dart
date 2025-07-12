// lib/models/report_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
sealed class Report with _$Report {
  const factory Report({
    required String id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'severity_id') required int severityId,
    @JsonKey(name: 'status_id') required int statusId,
    @JsonKey(name: 'damage_type_id') required int damageTypeId,
    required ReportLocation location,
    String? description,
    required String address,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    String? city,
    @JsonKey(name: 'damage_type') required DamageType damageType,
    required Severity severity,
    required Status status,
    ReportUser? user,

    @Default([]) List<ReportUpdate> updates,
    @Default([]) List<ReportImage> images,
    @Default([]) List<ReportFlag> flags,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

@freezed
sealed class ReportUser with _$ReportUser {
  const factory ReportUser({
    required int id,
    required String name,
    required int reputation,
  }) = _ReportUser;

  factory ReportUser.fromJson(Map<String, dynamic> json) =>
      _$ReportUserFromJson(json);
}

@freezed
sealed class ReportLocation with _$ReportLocation {
  const factory ReportLocation({
    required String type,
    required List<double> coordinates, // [longitude, latitude]
  }) = _ReportLocation;

  factory ReportLocation.fromJson(Map<String, dynamic> json) =>
      _$ReportLocationFromJson(json);
}

@freezed
sealed class ReportFlag with _$ReportFlag {
  const factory ReportFlag({
    required int id,
    required String type, // e.g., 'duplicate', 'low_quality', 'inappropriate'
    required String reason, // The optional reason provided by the admin
    @JsonKey(name: 'duplicated_report_id')
    String? duplicatedReportId, // The ID of the duplicated report
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ReportFlag;

  factory ReportFlag.fromJson(Map<String, dynamic> json) =>
      _$ReportFlagFromJson(json);
}

@freezed
sealed class ReportUpdate with _$ReportUpdate {
  const factory ReportUpdate({
    required int id,
    required String text,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ReportUpdate;

  factory ReportUpdate.fromJson(Map<String, dynamic> json) =>
      _$ReportUpdateFromJson(json);
}

@freezed
sealed class DamageType with _$DamageType {
  const factory DamageType({
    required int id,
    required String name,
    @JsonKey(name: 'created_at')
    DateTime?
    createdAt, // Making these optional as they might not always be needed
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _DamageType;

  factory DamageType.fromJson(Map<String, dynamic> json) =>
      _$DamageTypeFromJson(json);
}

@freezed
sealed class Severity with _$Severity {
  const factory Severity({
    required int id,
    required String name,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Severity;

  factory Severity.fromJson(Map<String, dynamic> json) =>
      _$SeverityFromJson(json);
}

@freezed
sealed class Status with _$Status {
  const factory Status({
    required int id,
    required String name,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@freezed
sealed class ReportImage with _$ReportImage {
  const factory ReportImage({
    required int id,
    required String path,
    required String report_id,
  }) = _ReportImage;

  factory ReportImage.fromJson(Map<String, dynamic> json) =>
      _$ReportImageFromJson(json);
}
