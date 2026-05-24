import 'package:flutter/foundation.dart' show kIsWeb;

abstract final class Env {
  /// Dynamcly determined API base URL depending on the platform
  static String get apiBaseUrl {
    const envUrl = String.fromEnvironment('API_BASE_URL');
    if (envUrl.isNotEmpty) return envUrl;

    // For web, API must be served from localhost to allow Chrome to save HttpOnly cookies.
    if (kIsWeb) {
      return 'http://localhost:5247';
    }

    // For Android Emulator (if needed) uncomment:
    // if (Platform.isAndroid) return androidEmulatorApiBaseUrl;

    return defaultApiBaseUrl;
  }

  /// Local API when using USB + `adb reverse tcp:5247 tcp:5247`.
  static const defaultApiBaseUrl = 'http://127.0.0.1:5247';

  /// Android Emulator alias to the host loopback.
  static const androidEmulatorApiBaseUrl = 'http://10.0.2.2:5247';
}