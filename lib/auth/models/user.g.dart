// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      name: json['name'] as String,
      accessKey: json['access-key'] == null
          ? null
          : AccessKey.fromJson(json['access-key'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'access-key': instance.accessKey,
    };

AccessKey _$AccessKeyFromJson(Map<String, dynamic> json) => AccessKey(
      id: json['id'] as String,
      authorizations: (json['authorizations'] as List<dynamic>)
          .map((e) => $enumDecode(_$AuthorizationEnumMap, e))
          .toSet(),
      createdAt: DateTime.parse(json['created-at'] as String),
      email: json['email'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$AccessKeyToJson(AccessKey instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'email': instance.email,
      'created-at': instance.createdAt.toIso8601String(),
      'authorizations': instance.authorizations
          .map((e) => _$AuthorizationEnumMap[e])
          .toList(),
    };

const _$AuthorizationEnumMap = {
  Authorization.admin: 'admin',
  Authorization.read: 'read',
  Authorization.write: 'write',
};
