// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
      authors: (json['authors'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      createdAt: DateTime.parse(json['created-at'] as String),
      releases: (json['releases'] as List<dynamic>)
          .map((e) => Release.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: DateTime.parse(json['updated-at'] as String),
    );

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'releases': instance.releases,
      'authors': instance.authors,
      'created-at': instance.createdAt.toIso8601String(),
      'updated-at': instance.updatedAt.toIso8601String(),
    };

Release _$ReleaseFromJson(Map<String, dynamic> json) => Release(
      version: json['version'] as String,
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      changelog: json['changelog'] as String,
      pubspec: json['pubspec'] as Map<String, dynamic>,
      releaseDate: DateTime.parse(json['release-date'] as String),
    );

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
      'version': instance.version,
      'pubspec': instance.pubspec,
      'release-date': instance.releaseDate.toIso8601String(),
      'author': instance.author,
      'changelog': instance.changelog,
    };
