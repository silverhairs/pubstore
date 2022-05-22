import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pubstore/auth/models/user.dart';

part 'package.g.dart';

/// Model that holds data of a package.
@JsonSerializable(fieldRename: FieldRename.kebab)
class Package with EquatableMixin {
  /// Initializes a new [Package].
  const Package({
    required this.authors,
    required this.name,
    required this.uuid,
    required this.createdAt,
    required this.releases,
    required this.updatedAt,
  });

  /// Initializes a new [Package] from a [map].
  factory Package.fromMap(Map<String, dynamic> map) => _$PackageFromJson(map);

  /// The package's unique ID.
  final String uuid;

  /// The package's name.
  final String name;

  /// The package's releases.
  final List<Release> releases;

  /// The users who have deployed releases of this package.
  final List<User> authors;

  /// The package's creation date.
  final DateTime createdAt;

  /// The date of the package's latest update.
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        uuid,
        name,
        releases,
        authors,
        createdAt,
        updatedAt,
      ];

  /// Parses this [Package] object into a [Map].
  Map<String, dynamic> toMap() => _$PackageToJson(this);

  /// Uses this [Package] as a prototype to create a new one.
  Package copyWith({
    String? uuid,
    String? name,
    List<Release>? releases,
    List<User>? authors,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Package(
        authors: authors ?? this.authors,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
        createdAt: createdAt ?? this.createdAt,
        releases: releases ?? this.releases,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}

/// Model that holds the data of a package release.
@JsonSerializable(fieldRename: FieldRename.kebab)
class Release with EquatableMixin {
  /// Initializes a new [Release].
  const Release({
    required this.version,
    required this.author,
    required this.changelog,
    required this.pubspec,
    required this.releaseDate,
  });

  /// Initializes a new [Release] from a [map].
  factory Release.fromJson(Map<String, dynamic> map) => _$ReleaseFromJson(map);

  /// The version number.
  final String version;

  /// The pubspec of this release.
  final Map<String, dynamic> pubspec;

  /// When this release is being done.
  final DateTime releaseDate;

  /// The [User] deployed this release.
  final User author;

  /// The changelog of this release.
  final String changelog;

  /// Parses this [Release] object into a [Map]
  Map<String, dynamic> toJson() => _$ReleaseToJson(this);

  /// Uses this [Release] as a prototype to create a new [Release].
  Release copyWith({
    String? version,
    Map<String, dynamic>? pubspec,
    DateTime? releaseDate,
    User? author,
    String? changelog,
  }) =>
      Release(
        version: version ?? this.version,
        author: author ?? this.author,
        changelog: changelog ?? this.changelog,
        pubspec: pubspec ?? this.pubspec,
        releaseDate: releaseDate ?? this.releaseDate,
      );

  @override
  List<Object?> get props => [
        version,
        author,
        changelog,
        pubspec,
        releaseDate,
      ];
}
