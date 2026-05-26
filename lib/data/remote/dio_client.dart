import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../core/logger/talker.dart';
import '../../core/network/dio_base_options.dart';
import '../../features/auth/application/auth_controller.dart';
import 'auth_interceptor.dart';
import 'auth_service.dart';
import 'secure_storage_service.dart';

part 'dio_client.g.dart';

/// The single application-wide [Dio] instance.
///
/// Interceptors (in order):
/// 1. [AuthInterceptor] — attaches Bearer token; handles 401 with mutex-locked
///    token refresh and request replay.
/// 2. [TalkerDioLogger] — logs requests/responses through the shared
///    [talker] instance (response bodies omitted to keep logs lean).
///
/// All timeouts are conservative defaults suitable for a mobile client on a
/// cellular connection. The sync endpoint uses chunked payloads (≤ 2000 rows)
/// so `sendTimeout` is generous.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final storage = ref.watch(secureStorageServiceProvider);
  final auth = ref.watch(authServiceProvider);

  final instance = Dio(createAppDioBaseOptions());

  instance.interceptors.addAll([
    AuthInterceptor(
      dio: instance,
      storage: storage,
      authService: auth,
      // Invalidate the auth provider so the app transitions to Guest state.
      onSessionExpired: () => ref.invalidate(authControllerProvider),
    ),
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: false,
        printResponseHeaders: false,
        printResponseData: false,
      ),
    ),
  ]);

  return instance;
}
