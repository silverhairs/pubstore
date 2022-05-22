import 'package:logging/logging.dart';
import 'package:pubstore/auth/models/user.dart';
import 'package:shelf/shelf.dart';

/// An repository that handles authorization operations.
///
/// This repository requires a [authorizer] with [Authorization.admin] in their
/// authorizations.
abstract class AuthorizationRepository {
  /// Initializes a new [AuthorizationRepository].
  AuthorizationRepository({required this.authorizer})
      : assert(
          authorizer.accessKey?.authorizations != null &&
              authorizer.accessKey!.authorizations
                  .contains(Authorization.admin),
          'the passed authorizer does not have admin permission.',
        );

  /// The [User] who handles authorization operation on this
  /// [AuthorizationRepository].
  final User authorizer;

  /// Creates a new [AccessKey] for the user whose [email] is passed.
  Future<AccessKey> createAccessKey({
    required String email,
    required List<Authorization> authorizations,
  });

  /// Revoke the access key whose [id] is passed.
  Future<void> revokeAccessKey(String id);

  /// Gets the access key of the user whose [email] is passed.
  Future<AccessKey> getAccessKey(String email);

  /// Gets all the access keys.
  Future<List<AccessKey>> getAllAcccessKeys();

  /// Authorization middleware.
  Handler middleware(Handler innerHandler) => (request) async {
        Logger.root.info('[Authorization]');
        final header = request.headers['authorization'];
        if (header != null && header.toLowerCase().startsWith('bearer ')) {
          // remove the `bearer ` prefix from header to have only token.
          final token = header.substring(7);
          Logger.root.info(' header found');
          if (token == authorizer.accessKey!.key) {
            return innerHandler(
              request.change(
                context: {
                  ...request.context,
                  ...authorizer.toJson(),
                },
              ),
            );
          }
        }
        return Response.forbidden('Not authorized');
      };
}
