import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../env/env.dart';

/// Shared Dio defaults for all HTTP clients (auth + app).
BaseOptions createDioBaseOptions({
  String? baseUrl,
  Duration sendTimeout = const Duration(seconds: 10),
  Duration receiveTimeout = const Duration(seconds: 10),
}) {
  final options = BaseOptions(
    baseUrl: baseUrl ?? Env.apiBaseUrl,
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: sendTimeout,
    receiveTimeout: receiveTimeout,
    headers: {
      'Content-Type': 'application/json',
      'X-Client-Platform': kIsWeb ? 'web' : 'mobile',
    },
  );

  // On web, Dio must be allowed to send/receive HttpOnly cookies
  // that the .NET backend sets via Set-Cookie.
  if (kIsWeb) {
    options.extra['withCredentials'] = true;
  }

  return options;
}

/// Longer timeouts for sync / large payloads on the main [Dio] client.
BaseOptions createAppDioBaseOptions({String? baseUrl}) {
  return createDioBaseOptions(
    baseUrl: baseUrl,
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
}
