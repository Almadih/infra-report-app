import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required int reputation,
    @JsonKey(name: 'reputation_title') required String reputationTitle,
    @JsonKey(name: 'show_info_to_public') required bool isPublic,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
