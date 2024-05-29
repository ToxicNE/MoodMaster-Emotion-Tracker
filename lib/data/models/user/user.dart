import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    this.avatarUrl,
    required this.id,
    required this.login,
    this.name,
    this.surname,
  });
  String id;
  String? name;
  String? surname;
  String login;
  String? avatarUrl;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
