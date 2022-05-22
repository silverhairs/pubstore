import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

Future<void> main() async {
  final router = Router();
  final ip = InternetAddress.anyIPv4;
  final logger = const Pipeline().addMiddleware(logRequests()).addHandler(
        router,
      );
  final port = int.parse(Platform.environment['PORT'] ?? '8000');

  await serve(logger, ip, port);
}
