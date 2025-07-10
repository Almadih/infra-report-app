// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Report _$ReportFromJson(Map<String, dynamic> json) => _Report(
  id: json['id'] as String,
  userId: (json['user_id'] as num).toInt(),
  severityId: (json['severity_id'] as num).toInt(),
  statusId: (json['status_id'] as num).toInt(),
  damageTypeId: (json['damage_type_id'] as num).toInt(),
  location: ReportLocation.fromJson(json['location'] as Map<String, dynamic>),
  description: json['description'] as String?,
  address: json['address'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  city: json['city'] as String?,
  damageType: DamageType.fromJson(json['damage_type'] as Map<String, dynamic>),
  severity: Severity.fromJson(json['severity'] as Map<String, dynamic>),
  status: Status.fromJson(json['status'] as Map<String, dynamic>),
  updates:
      (json['updates'] as List<dynamic>?)
          ?.map((e) => ReportUpdate.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ReportImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  flags:
      (json['flags'] as List<dynamic>?)
          ?.map((e) => ReportFlag.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ReportToJson(_Report instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'severity_id': instance.severityId,
  'status_id': instance.statusId,
  'damage_type_id': instance.damageTypeId,
  'location': instance.location,
  'description': instance.description,
  'address': instance.address,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'city': instance.city,
  'damage_type': instance.damageType,
  'severity': instance.severity,
  'status': instance.status,
  'updates': instance.updates,
  'images': instance.images,
  'flags': instance.flags,
};

_ReportLocation _$ReportLocationFromJson(Map<String, dynamic> json) =>
    _ReportLocation(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$ReportLocationToJson(_ReportLocation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_ReportFlag _$ReportFlagFromJson(Map<String, dynamic> json) => _ReportFlag(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  reason: json['reason'] as String,
  duplicatedReportId: json['duplicated_report_id'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ReportFlagToJson(_ReportFlag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'reason': instance.reason,
      'duplicated_report_id': instance.duplicatedReportId,
      'created_at': instance.createdAt.toIso8601String(),
    };

_ReportUpdate _$ReportUpdateFromJson(Map<String, dynamic> json) =>
    _ReportUpdate(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ReportUpdateToJson(_ReportUpdate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_DamageType _$DamageTypeFromJson(Map<String, dynamic> json) => _DamageType(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$DamageTypeToJson(_DamageType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_Severity _$SeverityFromJson(Map<String, dynamic> json) => _Severity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$SeverityToJson(_Severity instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

_Status _$StatusFromJson(Map<String, dynamic> json) => _Status(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$StatusToJson(_Status instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

_ReportImage _$ReportImageFromJson(Map<String, dynamic> json) => _ReportImage(
  id: (json['id'] as num).toInt(),
  path: json['path'] as String,
  report_id: json['report_id'] as String,
);

Map<String, dynamic> _$ReportImageToJson(_ReportImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'report_id': instance.report_id,
    };
