import 'package:dio/dio.dart';

import '../env/env.dart';

/// Shared Dio defaults for all HTTP clients (auth + app).
BaseOptions createDioBaseOptions({
  String baseUrl = Env.apiBaseUrl,
  Duration sendTimeout = const Duration(seconds: 10),
  Duration receiveTimeout = const Duration(seconds: 10),
}) {
  return BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: sendTimeout,
    receiveTimeout: receiveTimeout,
    headers: const {
      'Content-Type': 'application/json',
      'X-Client-Platform': 'mobile',
    },
  );
}

/// Longer timeouts for sync / large payloads on the main [Dio] client.
BaseOptions createAppDioBaseOptions({String baseUrl = Env.apiBaseUrl}) {
  return createDioBaseOptions(
    baseUrl: baseUrl,
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
}
