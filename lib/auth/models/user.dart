import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// A model that holds the data of a user.
@JsonSerializable(fieldRename: FieldRename.kebab)
class User with EquatableMixin {
  /// Initializes a new [User].
  const User({
    required this.email,
    required this.name,
    this.accessKey,
  });

  /// Instantiates a new [User] from the passed [map].
  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  /// Parses this [User] into a [Map].
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Uses this [User] object as a prototype to create a new [User] object.
  User copyWith({AccessKey? accessKey, String? email, String? name}) => User(
        email: email ?? this.email,
        name: name ?? this.name,
        accessKey: accessKey ?? this.accessKey,
      );

  /// User's email address.
  final String email;

  /// User's name.
  final String name;

  /// The [AccessKey] of this [User].
  final AccessKey? accessKey;

  @override
  List<Object?> get props => [email, name];
}

/// The authorization levels of a [User].
enum Authorization {
  /// A [User] with this level of [Authorization] can create/delete access keys for
  /// other users.
  admin,

  /// A [User] with this level of [Authorization] can read packages from the
  /// server.
  read,

  /// A [User] with this level of [Authorization] can deploy new releases of
  /// packages.
  write,
}

/// A model that holds the data of an access key.
@JsonSerializable(fieldRename: FieldRename.kebab)
class AccessKey with EquatableMixin {
  /// Initializes a new [AccessKey].
  const AccessKey({
    required this.id,
    required this.authorizations,
    required this.createdAt,
    required this.email,
    required this.key,
  });

  /// Initializes a new [AccessKey] from a json Map.
  factory AccessKey.fromJson(Map<String, dynamic> map) =>
      _$AccessKeyFromJson(map);

  /// The key's id.
  final String id;

  /// The key.
  final String key;

  /// The email of the [User] this [AccessKey] is assigned to.
  final String email;

  /// The date when this [AccessKey] was created.
  final DateTime createdAt;

  /// The [Authorization] levels of this access key.
  final Set<Authorization> authorizations;

  @override
  List<Object> get props => [id, key, email, createdAt, authorizations];

  /// Parses this [AccessKey] object to a json Map.
  Map<String, dynamic> toJson() => _$AccessKeyToJson(this);

  /// Uses this [AccessKey] object as a prototype to create another one.
  AccessKey copyWith({
    String? id,
    Set<Authorization>? authorizations,
    DateTime? createdAt,
    String? email,
    String? key,
  }) =>
      AccessKey(
        id: id ?? this.id,
        authorizations: authorizations ?? this.authorizations,
        createdAt: createdAt ?? this.createdAt,
        email: email ?? this.email,
        key: key ?? this.key,
      );
}
