abstract final class Env {
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: defaultApiBaseUrl,
  );

  /// Local API when using USB + `adb reverse tcp:5247 tcp:5247`.
  static const defaultApiBaseUrl = 'http://127.0.0.1:5247';

  /// Android Emulator alias to the host loopback.
  static const androidEmulatorApiBaseUrl = 'http://10.0.2.2:5247';
}
