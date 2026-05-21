import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_service.g.dart';

// ── Storage key constants ─────────────────────────────────────────────────────

abstract final class _Keys {
  static const accessToken = 'vl_access_token';
  static const refreshToken = 'vl_refresh_token';
  static const userId = 'vl_user_id';
  static const email = 'vl_email';
}

// ── Provider ──────────────────────────────────────────────────────────────────

/// Thin facade over [FlutterSecureStorage].
///
/// Android: defaults to `EncryptedSharedPreferences` (requires `minSdkVersion
/// = 23` in `android/app/build.gradle`).
/// iOS: Keychain with `accessibility = first_unlock_this_device`.
@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(Ref ref) {
  return SecureStorageService(
    const FlutterSecureStorage(
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    ),
  );
}

// ── Service ───────────────────────────────────────────────────────────────────

/// Typed wrapper around [FlutterSecureStorage] for JWT token management.
final class SecureStorageService {
  SecureStorageService(this._storage);

  final FlutterSecureStorage _storage;

  // ── Read ──────────────────────────────────────────────────────────────────

  Future<String?> getAccessToken() => _storage.read(key: _Keys.accessToken);
  Future<String?> getRefreshToken() => _storage.read(key: _Keys.refreshToken);
  Future<String?> getUserId() => _storage.read(key: _Keys.userId);
  Future<String?> getEmail() => _storage.read(key: _Keys.email);

  /// Returns all four stored values in one async operation.
  Future<({String accessToken, String refreshToken, String userId, String email})?> loadSession() async {
    final at = await _storage.read(key: _Keys.accessToken);
    final rt = await _storage.read(key: _Keys.refreshToken);
    final uid = await _storage.read(key: _Keys.userId);
    final em = await _storage.read(key: _Keys.email);
    if (at == null || rt == null || uid == null || em == null) return null;
    return (accessToken: at, refreshToken: rt, userId: uid, email: em);
  }

  // ── Write ─────────────────────────────────────────────────────────────────

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String email,
  }) async {
    await Future.wait([
      _storage.write(key: _Keys.accessToken, value: accessToken),
      _storage.write(key: _Keys.refreshToken, value: refreshToken),
      _storage.write(key: _Keys.userId, value: userId),
      _storage.write(key: _Keys.email, value: email),
    ]);
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _Keys.accessToken, value: accessToken),
      _storage.write(key: _Keys.refreshToken, value: refreshToken),
    ]);
  }

  // ── Delete ────────────────────────────────────────────────────────────────

  Future<void> clearSession() async {
    await Future.wait([
      _storage.delete(key: _Keys.accessToken),
      _storage.delete(key: _Keys.refreshToken),
      _storage.delete(key: _Keys.userId),
      _storage.delete(key: _Keys.email),
    ]);
  }
}
