// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the global authentication session.
///
/// Architectural contract:
/// - NEVER blocks navigation — Guest mode gives full access to local features.
/// - Protects only `/settings/sync` (requires [Authenticated]).
/// - [dioProvider] injects an [AuthInterceptor] that calls
///   `ref.invalidate(authControllerProvider)` on 401/expired, which causes
///   this notifier to rebuild and re-evaluate the stored session.

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

/// Manages the global authentication session.
///
/// Architectural contract:
/// - NEVER blocks navigation — Guest mode gives full access to local features.
/// - Protects only `/settings/sync` (requires [Authenticated]).
/// - [dioProvider] injects an [AuthInterceptor] that calls
///   `ref.invalidate(authControllerProvider)` on 401/expired, which causes
///   this notifier to rebuild and re-evaluate the stored session.
final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, AuthState> {
  /// Manages the global authentication session.
  ///
  /// Architectural contract:
  /// - NEVER blocks navigation — Guest mode gives full access to local features.
  /// - Protects only `/settings/sync` (requires [Authenticated]).
  /// - [dioProvider] injects an [AuthInterceptor] that calls
  ///   `ref.invalidate(authControllerProvider)` on 401/expired, which causes
  ///   this notifier to rebuild and re-evaluate the stored session.
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'3c7dc683ab1046df48c4ad4c4575d610779b79db';

/// Manages the global authentication session.
///
/// Architectural contract:
/// - NEVER blocks navigation — Guest mode gives full access to local features.
/// - Protects only `/settings/sync` (requires [Authenticated]).
/// - [dioProvider] injects an [AuthInterceptor] that calls
///   `ref.invalidate(authControllerProvider)` on 401/expired, which causes
///   this notifier to rebuild and re-evaluate the stored session.

abstract class _$AuthController extends $AsyncNotifier<AuthState> {
  FutureOr<AuthState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthState>, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthState>, AuthState>,
              AsyncValue<AuthState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
