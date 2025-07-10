// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Report {

 String get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'severity_id') int get severityId;@JsonKey(name: 'status_id') int get statusId;@JsonKey(name: 'damage_type_id') int get damageTypeId; ReportLocation get location; String? get description; String get address;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; String? get city;@JsonKey(name: 'damage_type') DamageType get damageType; Severity get severity; Status get status; List<ReportImage> get images;
/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportCopyWith<Report> get copyWith => _$ReportCopyWithImpl<Report>(this as Report, _$identity);

  /// Serializes this Report to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Report&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.severityId, severityId) || other.severityId == severityId)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.damageTypeId, damageTypeId) || other.damageTypeId == damageTypeId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.city, city) || other.city == city)&&(identical(other.damageType, damageType) || other.damageType == damageType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,severityId,statusId,damageTypeId,location,description,address,createdAt,updatedAt,city,damageType,severity,status,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'Report(id: $id, userId: $userId, severityId: $severityId, statusId: $statusId, damageTypeId: $damageTypeId, location: $location, description: $description, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, city: $city, damageType: $damageType, severity: $severity, status: $status, images: $images)';
}


}

/// @nodoc
abstract mixin class $ReportCopyWith<$Res>  {
  factory $ReportCopyWith(Report value, $Res Function(Report) _then) = _$ReportCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'severity_id') int severityId,@JsonKey(name: 'status_id') int statusId,@JsonKey(name: 'damage_type_id') int damageTypeId, ReportLocation location, String? description, String address,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String? city,@JsonKey(name: 'damage_type') DamageType damageType, Severity severity, Status status, List<ReportImage> images
});


$ReportLocationCopyWith<$Res> get location;$DamageTypeCopyWith<$Res> get damageType;$SeverityCopyWith<$Res> get severity;$StatusCopyWith<$Res> get status;

}
/// @nodoc
class _$ReportCopyWithImpl<$Res>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._self, this._then);

  final Report _self;
  final $Res Function(Report) _then;

/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? severityId = null,Object? statusId = null,Object? damageTypeId = null,Object? location = null,Object? description = freezed,Object? address = null,Object? createdAt = null,Object? updatedAt = null,Object? city = freezed,Object? damageType = null,Object? severity = null,Object? status = null,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,severityId: null == severityId ? _self.severityId : severityId // ignore: cast_nullable_to_non_nullable
as int,statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,damageTypeId: null == damageTypeId ? _self.damageTypeId : damageTypeId // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ReportLocation,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,damageType: null == damageType ? _self.damageType : damageType // ignore: cast_nullable_to_non_nullable
as DamageType,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as Severity,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ReportImage>,
  ));
}
/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportLocationCopyWith<$Res> get location {
  
  return $ReportLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DamageTypeCopyWith<$Res> get damageType {
  
  return $DamageTypeCopyWith<$Res>(_self.damageType, (value) {
    return _then(_self.copyWith(damageType: value));
  });
}/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeverityCopyWith<$Res> get severity {
  
  return $SeverityCopyWith<$Res>(_self.severity, (value) {
    return _then(_self.copyWith(severity: value));
  });
}/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusCopyWith<$Res> get status {
  
  return $StatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Report implements Report {
  const _Report({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'severity_id') required this.severityId, @JsonKey(name: 'status_id') required this.statusId, @JsonKey(name: 'damage_type_id') required this.damageTypeId, required this.location, this.description, required this.address, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, this.city, @JsonKey(name: 'damage_type') required this.damageType, required this.severity, required this.status, final  List<ReportImage> images = const []}): _images = images;
  factory _Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'severity_id') final  int severityId;
@override@JsonKey(name: 'status_id') final  int statusId;
@override@JsonKey(name: 'damage_type_id') final  int damageTypeId;
@override final  ReportLocation location;
@override final  String? description;
@override final  String address;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  String? city;
@override@JsonKey(name: 'damage_type') final  DamageType damageType;
@override final  Severity severity;
@override final  Status status;
 final  List<ReportImage> _images;
@override@JsonKey() List<ReportImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportCopyWith<_Report> get copyWith => __$ReportCopyWithImpl<_Report>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Report&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.severityId, severityId) || other.severityId == severityId)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.damageTypeId, damageTypeId) || other.damageTypeId == damageTypeId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.city, city) || other.city == city)&&(identical(other.damageType, damageType) || other.damageType == damageType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,severityId,statusId,damageTypeId,location,description,address,createdAt,updatedAt,city,damageType,severity,status,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'Report(id: $id, userId: $userId, severityId: $severityId, statusId: $statusId, damageTypeId: $damageTypeId, location: $location, description: $description, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, city: $city, damageType: $damageType, severity: $severity, status: $status, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) _then) = __$ReportCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'severity_id') int severityId,@JsonKey(name: 'status_id') int statusId,@JsonKey(name: 'damage_type_id') int damageTypeId, ReportLocation location, String? description, String address,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String? city,@JsonKey(name: 'damage_type') DamageType damageType, Severity severity, Status status, List<ReportImage> images
});


@override $ReportLocationCopyWith<$Res> get location;@override $DamageTypeCopyWith<$Res> get damageType;@override $SeverityCopyWith<$Res> get severity;@override $StatusCopyWith<$Res> get status;

}
/// @nodoc
class __$ReportCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(this._self, this._then);

  final _Report _self;
  final $Res Function(_Report) _then;

/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? severityId = null,Object? statusId = null,Object? damageTypeId = null,Object? location = null,Object? description = freezed,Object? address = null,Object? createdAt = null,Object? updatedAt = null,Object? city = freezed,Object? damageType = null,Object? severity = null,Object? status = null,Object? images = null,}) {
  return _then(_Report(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,severityId: null == severityId ? _self.severityId : severityId // ignore: cast_nullable_to_non_nullable
as int,statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,damageTypeId: null == damageTypeId ? _self.damageTypeId : damageTypeId // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ReportLocation,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,damageType: null == damageType ? _self.damageType : damageType // ignore: cast_nullable_to_non_nullable
as DamageType,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as Severity,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ReportImage>,
  ));
}

/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportLocationCopyWith<$Res> get location {
  
  return $ReportLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DamageTypeCopyWith<$Res> get damageType {
  
  return $DamageTypeCopyWith<$Res>(_self.damageType, (value) {
    return _then(_self.copyWith(damageType: value));
  });
}/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeverityCopyWith<$Res> get severity {
  
  return $SeverityCopyWith<$Res>(_self.severity, (value) {
    return _then(_self.copyWith(severity: value));
  });
}/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusCopyWith<$Res> get status {
  
  return $StatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc
mixin _$ReportLocation {

 String get type; List<double> get coordinates;
/// Create a copy of ReportLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportLocationCopyWith<ReportLocation> get copyWith => _$ReportLocationCopyWithImpl<ReportLocation>(this as ReportLocation, _$identity);

  /// Serializes this ReportLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportLocation&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.coordinates, coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(coordinates));

@override
String toString() {
  return 'ReportLocation(type: $type, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $ReportLocationCopyWith<$Res>  {
  factory $ReportLocationCopyWith(ReportLocation value, $Res Function(ReportLocation) _then) = _$ReportLocationCopyWithImpl;
@useResult
$Res call({
 String type, List<double> coordinates
});




}
/// @nodoc
class _$ReportLocationCopyWithImpl<$Res>
    implements $ReportLocationCopyWith<$Res> {
  _$ReportLocationCopyWithImpl(this._self, this._then);

  final ReportLocation _self;
  final $Res Function(ReportLocation) _then;

/// Create a copy of ReportLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? coordinates = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReportLocation implements ReportLocation {
  const _ReportLocation({required this.type, required final  List<double> coordinates}): _coordinates = coordinates;
  factory _ReportLocation.fromJson(Map<String, dynamic> json) => _$ReportLocationFromJson(json);

@override final  String type;
 final  List<double> _coordinates;
@override List<double> get coordinates {
  if (_coordinates is EqualUnmodifiableListView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coordinates);
}


/// Create a copy of ReportLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportLocationCopyWith<_ReportLocation> get copyWith => __$ReportLocationCopyWithImpl<_ReportLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportLocation&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_coordinates));

@override
String toString() {
  return 'ReportLocation(type: $type, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$ReportLocationCopyWith<$Res> implements $ReportLocationCopyWith<$Res> {
  factory _$ReportLocationCopyWith(_ReportLocation value, $Res Function(_ReportLocation) _then) = __$ReportLocationCopyWithImpl;
@override @useResult
$Res call({
 String type, List<double> coordinates
});




}
/// @nodoc
class __$ReportLocationCopyWithImpl<$Res>
    implements _$ReportLocationCopyWith<$Res> {
  __$ReportLocationCopyWithImpl(this._self, this._then);

  final _ReportLocation _self;
  final $Res Function(_ReportLocation) _then;

/// Create a copy of ReportLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? coordinates = null,}) {
  return _then(_ReportLocation(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}


/// @nodoc
mixin _$DamageType {

 int get id; String get name;@JsonKey(name: 'created_at') DateTime? get createdAt;// Making these optional as they might not always be needed
@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of DamageType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DamageTypeCopyWith<DamageType> get copyWith => _$DamageTypeCopyWithImpl<DamageType>(this as DamageType, _$identity);

  /// Serializes this DamageType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DamageType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,updatedAt);

@override
String toString() {
  return 'DamageType(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DamageTypeCopyWith<$Res>  {
  factory $DamageTypeCopyWith(DamageType value, $Res Function(DamageType) _then) = _$DamageTypeCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$DamageTypeCopyWithImpl<$Res>
    implements $DamageTypeCopyWith<$Res> {
  _$DamageTypeCopyWithImpl(this._self, this._then);

  final DamageType _self;
  final $Res Function(DamageType) _then;

/// Create a copy of DamageType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DamageType implements DamageType {
  const _DamageType({required this.id, required this.name, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _DamageType.fromJson(Map<String, dynamic> json) => _$DamageTypeFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
// Making these optional as they might not always be needed
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of DamageType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DamageTypeCopyWith<_DamageType> get copyWith => __$DamageTypeCopyWithImpl<_DamageType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DamageTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DamageType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,updatedAt);

@override
String toString() {
  return 'DamageType(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DamageTypeCopyWith<$Res> implements $DamageTypeCopyWith<$Res> {
  factory _$DamageTypeCopyWith(_DamageType value, $Res Function(_DamageType) _then) = __$DamageTypeCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$DamageTypeCopyWithImpl<$Res>
    implements _$DamageTypeCopyWith<$Res> {
  __$DamageTypeCopyWithImpl(this._self, this._then);

  final _DamageType _self;
  final $Res Function(_DamageType) _then;

/// Create a copy of DamageType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DamageType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Severity {

 int get id; String get name;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Severity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeverityCopyWith<Severity> get copyWith => _$SeverityCopyWithImpl<Severity>(this as Severity, _$identity);

  /// Serializes this Severity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Severity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,updatedAt);

@override
String toString() {
  return 'Severity(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SeverityCopyWith<$Res>  {
  factory $SeverityCopyWith(Severity value, $Res Function(Severity) _then) = _$SeverityCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$SeverityCopyWithImpl<$Res>
    implements $SeverityCopyWith<$Res> {
  _$SeverityCopyWithImpl(this._self, this._then);

  final Severity _self;
  final $Res Function(Severity) _then;

/// Create a copy of Severity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Severity implements Severity {
  const _Severity({required this.id, required this.name, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Severity.fromJson(Map<String, dynamic> json) => _$SeverityFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Severity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeverityCopyWith<_Severity> get copyWith => __$SeverityCopyWithImpl<_Severity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeverityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Severity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,updatedAt);

@override
String toString() {
  return 'Severity(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SeverityCopyWith<$Res> implements $SeverityCopyWith<$Res> {
  factory _$SeverityCopyWith(_Severity value, $Res Function(_Severity) _then) = __$SeverityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$SeverityCopyWithImpl<$Res>
    implements _$SeverityCopyWith<$Res> {
  __$SeverityCopyWithImpl(this._self, this._then);

  final _Severity _self;
  final $Res Function(_Severity) _then;

/// Create a copy of Severity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Severity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Status {

 int get id; String get name;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Status
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusCopyWith<Status> get copyWith => _$StatusCopyWithImpl<Status>(this as Status, _$identity);

  /// Serializes this Status to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Status&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,updatedAt);

@override
String toString() {
  return 'Status(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $StatusCopyWith<$Res>  {
  factory $StatusCopyWith(Status value, $Res Function(Status) _then) = _$StatusCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$StatusCopyWithImpl<$Res>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._self, this._then);

  final Status _self;
  final $Res Function(Status) _then;

/// Create a copy of Status
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Status implements Status {
  const _Status({required this.id, required this.name, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Status
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusCopyWith<_Status> get copyWith => __$StatusCopyWithImpl<_Status>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Status&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt,updatedAt);

@override
String toString() {
  return 'Status(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) _then) = __$StatusCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$StatusCopyWithImpl<$Res>
    implements _$StatusCopyWith<$Res> {
  __$StatusCopyWithImpl(this._self, this._then);

  final _Status _self;
  final $Res Function(_Status) _then;

/// Create a copy of Status
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Status(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ReportImage {

 int get id; String get path; String get report_id;
/// Create a copy of ReportImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportImageCopyWith<ReportImage> get copyWith => _$ReportImageCopyWithImpl<ReportImage>(this as ReportImage, _$identity);

  /// Serializes this ReportImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportImage&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.report_id, report_id) || other.report_id == report_id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,path,report_id);

@override
String toString() {
  return 'ReportImage(id: $id, path: $path, report_id: $report_id)';
}


}

/// @nodoc
abstract mixin class $ReportImageCopyWith<$Res>  {
  factory $ReportImageCopyWith(ReportImage value, $Res Function(ReportImage) _then) = _$ReportImageCopyWithImpl;
@useResult
$Res call({
 int id, String path, String report_id
});




}
/// @nodoc
class _$ReportImageCopyWithImpl<$Res>
    implements $ReportImageCopyWith<$Res> {
  _$ReportImageCopyWithImpl(this._self, this._then);

  final ReportImage _self;
  final $Res Function(ReportImage) _then;

/// Create a copy of ReportImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? path = null,Object? report_id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,report_id: null == report_id ? _self.report_id : report_id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReportImage implements ReportImage {
  const _ReportImage({required this.id, required this.path, required this.report_id});
  factory _ReportImage.fromJson(Map<String, dynamic> json) => _$ReportImageFromJson(json);

@override final  int id;
@override final  String path;
@override final  String report_id;

/// Create a copy of ReportImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportImageCopyWith<_ReportImage> get copyWith => __$ReportImageCopyWithImpl<_ReportImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportImage&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.report_id, report_id) || other.report_id == report_id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,path,report_id);

@override
String toString() {
  return 'ReportImage(id: $id, path: $path, report_id: $report_id)';
}


}

/// @nodoc
abstract mixin class _$ReportImageCopyWith<$Res> implements $ReportImageCopyWith<$Res> {
  factory _$ReportImageCopyWith(_ReportImage value, $Res Function(_ReportImage) _then) = __$ReportImageCopyWithImpl;
@override @useResult
$Res call({
 int id, String path, String report_id
});




}
/// @nodoc
class __$ReportImageCopyWithImpl<$Res>
    implements _$ReportImageCopyWith<$Res> {
  __$ReportImageCopyWithImpl(this._self, this._then);

  final _ReportImage _self;
  final $Res Function(_ReportImage) _then;

/// Create a copy of ReportImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? path = null,Object? report_id = null,}) {
  return _then(_ReportImage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,report_id: null == report_id ? _self.report_id : report_id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
