// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      avatarUrl: json['avatarUrl'] as String?,
      id: json['id'] as String,
      login: json['login'] as String,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
    };
