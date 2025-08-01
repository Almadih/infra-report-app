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

 String get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'severity_id') int get severityId;@JsonKey(name: 'status_id') int get statusId;@JsonKey(name: 'damage_type_id') int get damageTypeId; ReportLocation get location; String? get description; String get address;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; String? get city;@JsonKey(name: 'damage_type') DamageType get damageType; Severity get severity; Status get status; ReportUser? get user; List<ReportUpdate> get updates; List<ReportImage> get images; List<ReportFlag> get flags;
/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportCopyWith<Report> get copyWith => _$ReportCopyWithImpl<Report>(this as Report, _$identity);

  /// Serializes this Report to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Report&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.severityId, severityId) || other.severityId == severityId)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.damageTypeId, damageTypeId) || other.damageTypeId == damageTypeId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.city, city) || other.city == city)&&(identical(other.damageType, damageType) || other.damageType == damageType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.updates, updates)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.flags, flags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,severityId,statusId,damageTypeId,location,description,address,createdAt,updatedAt,city,damageType,severity,status,user,const DeepCollectionEquality().hash(updates),const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(flags));

@override
String toString() {
  return 'Report(id: $id, userId: $userId, severityId: $severityId, statusId: $statusId, damageTypeId: $damageTypeId, location: $location, description: $description, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, city: $city, damageType: $damageType, severity: $severity, status: $status, user: $user, updates: $updates, images: $images, flags: $flags)';
}


}

/// @nodoc
abstract mixin class $ReportCopyWith<$Res>  {
  factory $ReportCopyWith(Report value, $Res Function(Report) _then) = _$ReportCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'severity_id') int severityId,@JsonKey(name: 'status_id') int statusId,@JsonKey(name: 'damage_type_id') int damageTypeId, ReportLocation location, String? description, String address,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String? city,@JsonKey(name: 'damage_type') DamageType damageType, Severity severity, Status status, ReportUser? user, List<ReportUpdate> updates, List<ReportImage> images, List<ReportFlag> flags
});


$ReportLocationCopyWith<$Res> get location;$DamageTypeCopyWith<$Res> get damageType;$SeverityCopyWith<$Res> get severity;$StatusCopyWith<$Res> get status;$ReportUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ReportCopyWithImpl<$Res>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._self, this._then);

  final Report _self;
  final $Res Function(Report) _then;

/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? severityId = null,Object? statusId = null,Object? damageTypeId = null,Object? location = null,Object? description = freezed,Object? address = null,Object? createdAt = null,Object? updatedAt = null,Object? city = freezed,Object? damageType = null,Object? severity = null,Object? status = null,Object? user = freezed,Object? updates = null,Object? images = null,Object? flags = null,}) {
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
as Status,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ReportUser?,updates: null == updates ? _self.updates : updates // ignore: cast_nullable_to_non_nullable
as List<ReportUpdate>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ReportImage>,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as List<ReportFlag>,
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
}/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ReportUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Report implements Report {
  const _Report({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'severity_id') required this.severityId, @JsonKey(name: 'status_id') required this.statusId, @JsonKey(name: 'damage_type_id') required this.damageTypeId, required this.location, this.description, required this.address, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, this.city, @JsonKey(name: 'damage_type') required this.damageType, required this.severity, required this.status, this.user, final  List<ReportUpdate> updates = const [], final  List<ReportImage> images = const [], final  List<ReportFlag> flags = const []}): _updates = updates,_images = images,_flags = flags;
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
@override final  ReportUser? user;
 final  List<ReportUpdate> _updates;
@override@JsonKey() List<ReportUpdate> get updates {
  if (_updates is EqualUnmodifiableListView) return _updates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_updates);
}

 final  List<ReportImage> _images;
@override@JsonKey() List<ReportImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<ReportFlag> _flags;
@override@JsonKey() List<ReportFlag> get flags {
  if (_flags is EqualUnmodifiableListView) return _flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flags);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Report&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.severityId, severityId) || other.severityId == severityId)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.damageTypeId, damageTypeId) || other.damageTypeId == damageTypeId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.city, city) || other.city == city)&&(identical(other.damageType, damageType) || other.damageType == damageType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._updates, _updates)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._flags, _flags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,severityId,statusId,damageTypeId,location,description,address,createdAt,updatedAt,city,damageType,severity,status,user,const DeepCollectionEquality().hash(_updates),const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_flags));

@override
String toString() {
  return 'Report(id: $id, userId: $userId, severityId: $severityId, statusId: $statusId, damageTypeId: $damageTypeId, location: $location, description: $description, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, city: $city, damageType: $damageType, severity: $severity, status: $status, user: $user, updates: $updates, images: $images, flags: $flags)';
}


}

/// @nodoc
abstract mixin class _$ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) _then) = __$ReportCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'severity_id') int severityId,@JsonKey(name: 'status_id') int statusId,@JsonKey(name: 'damage_type_id') int damageTypeId, ReportLocation location, String? description, String address,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String? city,@JsonKey(name: 'damage_type') DamageType damageType, Severity severity, Status status, ReportUser? user, List<ReportUpdate> updates, List<ReportImage> images, List<ReportFlag> flags
});


@override $ReportLocationCopyWith<$Res> get location;@override $DamageTypeCopyWith<$Res> get damageType;@override $SeverityCopyWith<$Res> get severity;@override $StatusCopyWith<$Res> get status;@override $ReportUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ReportCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(this._self, this._then);

  final _Report _self;
  final $Res Function(_Report) _then;

/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? severityId = null,Object? statusId = null,Object? damageTypeId = null,Object? location = null,Object? description = freezed,Object? address = null,Object? createdAt = null,Object? updatedAt = null,Object? city = freezed,Object? damageType = null,Object? severity = null,Object? status = null,Object? user = freezed,Object? updates = null,Object? images = null,Object? flags = null,}) {
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
as Status,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ReportUser?,updates: null == updates ? _self._updates : updates // ignore: cast_nullable_to_non_nullable
as List<ReportUpdate>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ReportImage>,flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as List<ReportFlag>,
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
}/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ReportUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$ReportUser {

 int get id; String get name; int get reputation;@JsonKey(name: 'reputation_title') String get reputationTitle;
/// Create a copy of ReportUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportUserCopyWith<ReportUser> get copyWith => _$ReportUserCopyWithImpl<ReportUser>(this as ReportUser, _$identity);

  /// Serializes this ReportUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.reputation, reputation) || other.reputation == reputation)&&(identical(other.reputationTitle, reputationTitle) || other.reputationTitle == reputationTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,reputation,reputationTitle);

@override
String toString() {
  return 'ReportUser(id: $id, name: $name, reputation: $reputation, reputationTitle: $reputationTitle)';
}


}

/// @nodoc
abstract mixin class $ReportUserCopyWith<$Res>  {
  factory $ReportUserCopyWith(ReportUser value, $Res Function(ReportUser) _then) = _$ReportUserCopyWithImpl;
@useResult
$Res call({
 int id, String name, int reputation,@JsonKey(name: 'reputation_title') String reputationTitle
});




}
/// @nodoc
class _$ReportUserCopyWithImpl<$Res>
    implements $ReportUserCopyWith<$Res> {
  _$ReportUserCopyWithImpl(this._self, this._then);

  final ReportUser _self;
  final $Res Function(ReportUser) _then;

/// Create a copy of ReportUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? reputation = null,Object? reputationTitle = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,reputation: null == reputation ? _self.reputation : reputation // ignore: cast_nullable_to_non_nullable
as int,reputationTitle: null == reputationTitle ? _self.reputationTitle : reputationTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReportUser implements ReportUser {
  const _ReportUser({required this.id, required this.name, required this.reputation, @JsonKey(name: 'reputation_title') required this.reputationTitle});
  factory _ReportUser.fromJson(Map<String, dynamic> json) => _$ReportUserFromJson(json);

@override final  int id;
@override final  String name;
@override final  int reputation;
@override@JsonKey(name: 'reputation_title') final  String reputationTitle;

/// Create a copy of ReportUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportUserCopyWith<_ReportUser> get copyWith => __$ReportUserCopyWithImpl<_ReportUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.reputation, reputation) || other.reputation == reputation)&&(identical(other.reputationTitle, reputationTitle) || other.reputationTitle == reputationTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,reputation,reputationTitle);

@override
String toString() {
  return 'ReportUser(id: $id, name: $name, reputation: $reputation, reputationTitle: $reputationTitle)';
}


}

/// @nodoc
abstract mixin class _$ReportUserCopyWith<$Res> implements $ReportUserCopyWith<$Res> {
  factory _$ReportUserCopyWith(_ReportUser value, $Res Function(_ReportUser) _then) = __$ReportUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int reputation,@JsonKey(name: 'reputation_title') String reputationTitle
});




}
/// @nodoc
class __$ReportUserCopyWithImpl<$Res>
    implements _$ReportUserCopyWith<$Res> {
  __$ReportUserCopyWithImpl(this._self, this._then);

  final _ReportUser _self;
  final $Res Function(_ReportUser) _then;

/// Create a copy of ReportUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? reputation = null,Object? reputationTitle = null,}) {
  return _then(_ReportUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,reputation: null == reputation ? _self.reputation : reputation // ignore: cast_nullable_to_non_nullable
as int,reputationTitle: null == reputationTitle ? _self.reputationTitle : reputationTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
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
mixin _$ReportFlag {

 int get id; String get type;// e.g., 'duplicate', 'low_quality', 'inappropriate'
 String get reason;// The optional reason provided by the admin
@JsonKey(name: 'duplicated_report_id') String? get duplicatedReportId;// The ID of the duplicated report
@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of ReportFlag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportFlagCopyWith<ReportFlag> get copyWith => _$ReportFlagCopyWithImpl<ReportFlag>(this as ReportFlag, _$identity);

  /// Serializes this ReportFlag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportFlag&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.duplicatedReportId, duplicatedReportId) || other.duplicatedReportId == duplicatedReportId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,reason,duplicatedReportId,createdAt);

@override
String toString() {
  return 'ReportFlag(id: $id, type: $type, reason: $reason, duplicatedReportId: $duplicatedReportId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReportFlagCopyWith<$Res>  {
  factory $ReportFlagCopyWith(ReportFlag value, $Res Function(ReportFlag) _then) = _$ReportFlagCopyWithImpl;
@useResult
$Res call({
 int id, String type, String reason,@JsonKey(name: 'duplicated_report_id') String? duplicatedReportId,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$ReportFlagCopyWithImpl<$Res>
    implements $ReportFlagCopyWith<$Res> {
  _$ReportFlagCopyWithImpl(this._self, this._then);

  final ReportFlag _self;
  final $Res Function(ReportFlag) _then;

/// Create a copy of ReportFlag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? reason = null,Object? duplicatedReportId = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,duplicatedReportId: freezed == duplicatedReportId ? _self.duplicatedReportId : duplicatedReportId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReportFlag implements ReportFlag {
  const _ReportFlag({required this.id, required this.type, required this.reason, @JsonKey(name: 'duplicated_report_id') this.duplicatedReportId, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ReportFlag.fromJson(Map<String, dynamic> json) => _$ReportFlagFromJson(json);

@override final  int id;
@override final  String type;
// e.g., 'duplicate', 'low_quality', 'inappropriate'
@override final  String reason;
// The optional reason provided by the admin
@override@JsonKey(name: 'duplicated_report_id') final  String? duplicatedReportId;
// The ID of the duplicated report
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of ReportFlag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportFlagCopyWith<_ReportFlag> get copyWith => __$ReportFlagCopyWithImpl<_ReportFlag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportFlagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportFlag&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.duplicatedReportId, duplicatedReportId) || other.duplicatedReportId == duplicatedReportId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,reason,duplicatedReportId,createdAt);

@override
String toString() {
  return 'ReportFlag(id: $id, type: $type, reason: $reason, duplicatedReportId: $duplicatedReportId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReportFlagCopyWith<$Res> implements $ReportFlagCopyWith<$Res> {
  factory _$ReportFlagCopyWith(_ReportFlag value, $Res Function(_ReportFlag) _then) = __$ReportFlagCopyWithImpl;
@override @useResult
$Res call({
 int id, String type, String reason,@JsonKey(name: 'duplicated_report_id') String? duplicatedReportId,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$ReportFlagCopyWithImpl<$Res>
    implements _$ReportFlagCopyWith<$Res> {
  __$ReportFlagCopyWithImpl(this._self, this._then);

  final _ReportFlag _self;
  final $Res Function(_ReportFlag) _then;

/// Create a copy of ReportFlag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? reason = null,Object? duplicatedReportId = freezed,Object? createdAt = null,}) {
  return _then(_ReportFlag(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,duplicatedReportId: freezed == duplicatedReportId ? _self.duplicatedReportId : duplicatedReportId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ReportUpdate {

 int get id; String get text;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ReportUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportUpdateCopyWith<ReportUpdate> get copyWith => _$ReportUpdateCopyWithImpl<ReportUpdate>(this as ReportUpdate, _$identity);

  /// Serializes this ReportUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,createdAt,updatedAt);

@override
String toString() {
  return 'ReportUpdate(id: $id, text: $text, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReportUpdateCopyWith<$Res>  {
  factory $ReportUpdateCopyWith(ReportUpdate value, $Res Function(ReportUpdate) _then) = _$ReportUpdateCopyWithImpl;
@useResult
$Res call({
 int id, String text,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ReportUpdateCopyWithImpl<$Res>
    implements $ReportUpdateCopyWith<$Res> {
  _$ReportUpdateCopyWithImpl(this._self, this._then);

  final ReportUpdate _self;
  final $Res Function(ReportUpdate) _then;

/// Create a copy of ReportUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReportUpdate implements ReportUpdate {
  const _ReportUpdate({required this.id, required this.text, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ReportUpdate.fromJson(Map<String, dynamic> json) => _$ReportUpdateFromJson(json);

@override final  int id;
@override final  String text;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ReportUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportUpdateCopyWith<_ReportUpdate> get copyWith => __$ReportUpdateCopyWithImpl<_ReportUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,createdAt,updatedAt);

@override
String toString() {
  return 'ReportUpdate(id: $id, text: $text, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReportUpdateCopyWith<$Res> implements $ReportUpdateCopyWith<$Res> {
  factory _$ReportUpdateCopyWith(_ReportUpdate value, $Res Function(_ReportUpdate) _then) = __$ReportUpdateCopyWithImpl;
@override @useResult
$Res call({
 int id, String text,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ReportUpdateCopyWithImpl<$Res>
    implements _$ReportUpdateCopyWith<$Res> {
  __$ReportUpdateCopyWithImpl(this._self, this._then);

  final _ReportUpdate _self;
  final $Res Function(_ReportUpdate) _then;

/// Create a copy of ReportUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ReportUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
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
