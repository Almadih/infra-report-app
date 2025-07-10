// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncStatus {

 SyncState get state; int get totalToSync; int get syncedCount;
/// Create a copy of SyncStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncStatusCopyWith<SyncStatus> get copyWith => _$SyncStatusCopyWithImpl<SyncStatus>(this as SyncStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.totalToSync, totalToSync) || other.totalToSync == totalToSync)&&(identical(other.syncedCount, syncedCount) || other.syncedCount == syncedCount));
}


@override
int get hashCode => Object.hash(runtimeType,state,totalToSync,syncedCount);

@override
String toString() {
  return 'SyncStatus(state: $state, totalToSync: $totalToSync, syncedCount: $syncedCount)';
}


}

/// @nodoc
abstract mixin class $SyncStatusCopyWith<$Res>  {
  factory $SyncStatusCopyWith(SyncStatus value, $Res Function(SyncStatus) _then) = _$SyncStatusCopyWithImpl;
@useResult
$Res call({
 SyncState state, int totalToSync, int syncedCount
});




}
/// @nodoc
class _$SyncStatusCopyWithImpl<$Res>
    implements $SyncStatusCopyWith<$Res> {
  _$SyncStatusCopyWithImpl(this._self, this._then);

  final SyncStatus _self;
  final $Res Function(SyncStatus) _then;

/// Create a copy of SyncStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? totalToSync = null,Object? syncedCount = null,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SyncState,totalToSync: null == totalToSync ? _self.totalToSync : totalToSync // ignore: cast_nullable_to_non_nullable
as int,syncedCount: null == syncedCount ? _self.syncedCount : syncedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _SyncStatus implements SyncStatus {
  const _SyncStatus({this.state = SyncState.idle, this.totalToSync = 0, this.syncedCount = 0});
  

@override@JsonKey() final  SyncState state;
@override@JsonKey() final  int totalToSync;
@override@JsonKey() final  int syncedCount;

/// Create a copy of SyncStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncStatusCopyWith<_SyncStatus> get copyWith => __$SyncStatusCopyWithImpl<_SyncStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.totalToSync, totalToSync) || other.totalToSync == totalToSync)&&(identical(other.syncedCount, syncedCount) || other.syncedCount == syncedCount));
}


@override
int get hashCode => Object.hash(runtimeType,state,totalToSync,syncedCount);

@override
String toString() {
  return 'SyncStatus(state: $state, totalToSync: $totalToSync, syncedCount: $syncedCount)';
}


}

/// @nodoc
abstract mixin class _$SyncStatusCopyWith<$Res> implements $SyncStatusCopyWith<$Res> {
  factory _$SyncStatusCopyWith(_SyncStatus value, $Res Function(_SyncStatus) _then) = __$SyncStatusCopyWithImpl;
@override @useResult
$Res call({
 SyncState state, int totalToSync, int syncedCount
});




}
/// @nodoc
class __$SyncStatusCopyWithImpl<$Res>
    implements _$SyncStatusCopyWith<$Res> {
  __$SyncStatusCopyWithImpl(this._self, this._then);

  final _SyncStatus _self;
  final $Res Function(_SyncStatus) _then;

/// Create a copy of SyncStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? totalToSync = null,Object? syncedCount = null,}) {
  return _then(_SyncStatus(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SyncState,totalToSync: null == totalToSync ? _self.totalToSync : totalToSync // ignore: cast_nullable_to_non_nullable
as int,syncedCount: null == syncedCount ? _self.syncedCount : syncedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
