// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(dio)
final dioProvider = DioProvider._();

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

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
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
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'8d9a35f28e77d310dba264f12ad74b0a2757f63b';
