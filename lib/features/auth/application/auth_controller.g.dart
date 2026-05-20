// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the global authentication session.
///
/// Kept alive for the lifetime of the app. Starts as [Guest] and can
/// transition to [Authenticated] after login (Phase 5).
///
/// Architectural contract:
/// - NEVER blocks navigation — Guest mode gives full access to local features.
/// - Protects only `/settings/sync` (requires [Authenticated]).

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

/// Manages the global authentication session.
///
/// Kept alive for the lifetime of the app. Starts as [Guest] and can
/// transition to [Authenticated] after login (Phase 5).
///
/// Architectural contract:
/// - NEVER blocks navigation — Guest mode gives full access to local features.
/// - Protects only `/settings/sync` (requires [Authenticated]).
final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, AuthState> {
  /// Manages the global authentication session.
  ///
  /// Kept alive for the lifetime of the app. Starts as [Guest] and can
  /// transition to [Authenticated] after login (Phase 5).
  ///
  /// Architectural contract:
  /// - NEVER blocks navigation — Guest mode gives full access to local features.
  /// - Protects only `/settings/sync` (requires [Authenticated]).
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

String _$authControllerHash() => r'82d170e43a04bdcac2f613f9e32ca10e28076acc';

/// Manages the global authentication session.
///
/// Kept alive for the lifetime of the app. Starts as [Guest] and can
/// transition to [Authenticated] after login (Phase 5).
///
/// Architectural contract:
/// - NEVER blocks navigation — Guest mode gives full access to local features.
/// - Protects only `/settings/sync` (requires [Authenticated]).

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
