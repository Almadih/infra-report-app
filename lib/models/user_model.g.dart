// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  reputation: (json['reputation'] as num).toInt(),
  reputationTitle: json['reputation_title'] as String,
  isPublic: json['show_info_to_public'] as bool,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'reputation': instance.reputation,
  'reputation_title': instance.reputationTitle,
  'show_info_to_public': instance.isPublic,
};
