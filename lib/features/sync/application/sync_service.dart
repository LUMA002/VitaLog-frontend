import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../core/failure/app_failure.dart';
import '../../../core/logger/talker.dart';
import '../../../core/network/sync_connectivity.dart';
import '../../settings/application/settings_controller.dart';
import '../../../data/local/daos/courses_dao.dart';
import '../../../data/local/daos/global_ingredients_dao.dart';
import '../../../data/local/daos/products_dao.dart';
import '../../../data/remote/dio_client.dart';
import '../../../data/remote/dtos/sync_request_dto.dart';
import '../../../data/remote/dtos/sync_response_dto.dart';
import '../../../data/repositories/mappers/dto_mappers.dart';
import '../../auth/application/auth_controller.dart';

part 'sync_service.g.dart';

// ── Max batch sizes (mirror SyncLimits on the backend) ────────────────────────
const _kMaxItemsPerEntity = 2000;

// ── Provider ──────────────────────────────────────────────────────────────────

/// Singleton sync orchestrator.
///
/// State:
///  - [AsyncData(null)]    → idle / last sync succeeded
///  - [AsyncLoading]       → sync in progress
///  - [AsyncError]         → last sync failed (error = [AppFailure])
///
/// Call [runOnce] to trigger a push-pull cycle.  Only one cycle runs at a time;
/// concurrent calls are silently dropped if a cycle is already in-flight.
@Riverpod(keepAlive: true)
class SyncService extends _$SyncService {
  bool _syncing = false;

  @override
  AsyncValue<void> build() => const AsyncData(null);

  // ── Public API ─────────────────────────────────────────────────────────────

  /// Runs a full push→pull→ack sync cycle.
  ///
  /// Silently no-ops if:
  /// - The user is not authenticated (Guest mode).
  /// - A sync cycle is already in-flight.
  ///
  /// Network errors and SocketExceptions are caught and surfaced as
  /// [AsyncError] with a typed [AppFailure] — the app never crashes.
  Future<void> runOnce() async {
    if (_syncing) return;

    final authState = ref.read(authControllerProvider).asData?.value;
    if (authState is! Authenticated) return;

    final settings = await ref.read(settingsProvider.future);
    final canSync = await ref.read(syncConnectivityProvider).canSync(
          wifiOnlySync: settings.wifiOnlySync,
        );
    if (!canSync) return;

    _syncing = true;
    state = const AsyncLoading();

    try {
      await _doSync(authState);
      state = const AsyncData(null);
    } on Object catch (e, st) {
      state = AsyncError(_toAppFailure(e), st);
      talker.handle(e, st, '[SyncService]');
    } finally {
      _syncing = false;
    }
  }

  // ── Core sync logic ────────────────────────────────────────────────────────

  Future<void> _doSync(Authenticated auth) async {
    final db = ref.read(appDatabaseProvider);
    final productsDao = ref.read(productsDaoProvider);
    final coursesDao = ref.read(coursesDaoProvider);
    final globalIngredientsDao = ref.read(globalIngredientsDaoProvider);
    final syncMetaDao = ref.read(syncMetaDaoProvider);
    final dio = ref.read(dioProvider);
    final clock = ref.read(clockProvider);

    final stopwatch = Stopwatch()..start();

    // ── 1. Collect dirty records ──────────────────────────────────────────

    final dirtyProducts =
        (await productsDao.getPendingSync()).take(_kMaxItemsPerEntity).toList();
    final dirtyIngredients =
        (await productsDao.getPendingIngredientSync()).take(_kMaxItemsPerEntity).toList();
    final dirtyCourses =
        (await coursesDao.getPendingSync()).take(_kMaxItemsPerEntity).toList();
    final dirtyIntakeLogs =
        (await coursesDao.getPendingIntakeSync()).take(_kMaxItemsPerEntity).toList();

    // ── 2. Build pushed-ID sets (for ACK resolution later) ────────────────

    final pushedProductIds = {for (final r in dirtyProducts) r.id};
    final pushedIngredientIds = {for (final r in dirtyIngredients) r.id};
    final pushedCourseIds = {for (final r in dirtyCourses) r.id};
    final pushedLogIds = {for (final r in dirtyIntakeLogs) r.id};

    // ── 3. Build request ──────────────────────────────────────────────────

    final lastSyncAt = await syncMetaDao.getLastSyncAt();
    final clientTime = clock.nowUtc();

    final request = SyncRequestDto(
      lastSyncAt: lastSyncAt,
      clientTime: clientTime,
      products: dirtyProducts.map((r) => r.toSyncDto()).toList(),
      productIngredients: dirtyIngredients.map((r) => r.toSyncDto()).toList(),
      courses: dirtyCourses.map((r) => r.toSyncDto()).toList(),
      intakeLogs: dirtyIntakeLogs.map((r) => r.toSyncDto()).toList(),
    );

    // ── 4. POST /api/sync ─────────────────────────────────────────────────

    final httpResponse = await dio.post<Map<String, dynamic>>(
      '/api/sync',
      data: request.toJson(),
    );

    final response = SyncResponseDto.fromJson(httpResponse.data!);

    // ── 5. Apply server changes in a single Drift transaction ─────────────

    await db.transaction(() async {
      await _applyGlobalIngredients(globalIngredientsDao, response);
      await _applyProducts(productsDao, response, pushedProductIds);
      await _applyProductIngredients(
        productsDao,
        response,
        pushedIngredientIds,
      );
      await _applyCourses(
        coursesDao,
        response,
        pushedCourseIds,
        auth.userId,
      );
      await _applyIntakeLogs(
        coursesDao,
        response,
        pushedLogIds,
        auth.userId,
      );
      await syncMetaDao.updateSyncMeta(
        lastSyncAt: response.serverTime,
        lastSyncDurationMs: stopwatch.elapsedMilliseconds,
        lastSyncStatus: 'success',
      );
    });
  }

  // ── Entity appliers ────────────────────────────────────────────────────────

  Future<void> _applyGlobalIngredients(
    GlobalIngredientsDao dao,
    SyncResponseDto response,
  ) async {
    if (response.globalIngredients.isEmpty) return;
    await dao.upsertBatch(
      response.globalIngredients.map((dto) => dto.toDriftCompanion()).toList(),
    );
  }

  /// True LWW resolution for products.
  ///
  /// ACK'd rows (we pushed them) → always overwrite with server-stamped time.
  /// Pull-only rows → skip if we have a locally-newer dirty version.
  Future<void> _applyProducts(
    ProductsDao dao,
    SyncResponseDto response,
    Set<String> pushedIds,
  ) async {
    if (response.products.isEmpty) return;

    final pullOnly =
        response.products.where((dto) => !pushedIds.contains(dto.id)).toList();

    // Build a map of id → updatedAt for locally dirty rows so we can apply
    // True-LWW: keep local if local.updatedAt > server.updatedAt.
    final localDirtyTimestamps = {
      for (final r in await dao.getPendingSync()) r.id: r.updatedAt,
    };

    final companions = [
      // ACK'd — unconditionally replace with server version.
      for (final dto in response.products.where((d) => pushedIds.contains(d.id)))
        dto.toDriftCompanion(),
      // Pull-only — only upsert when server version is not older than local dirty.
      for (final dto in pullOnly)
        if (_shouldApplyPull(dto.id, dto.updatedAt, localDirtyTimestamps))
          dto.toDriftCompanion(),
    ];

    if (companions.isNotEmpty) await dao.upsertBatch(companions);
  }

  Future<void> _applyProductIngredients(
    ProductsDao dao,
    SyncResponseDto response,
    Set<String> pushedIds,
  ) async {
    if (response.productIngredients.isEmpty) return;

    final pullOnly = response.productIngredients
        .where((dto) => !pushedIds.contains(dto.id))
        .toList();
    final localDirtyTimestamps = {
      for (final r in await dao.getPendingIngredientSync()) r.id: r.updatedAt,
    };

    final companions = [
      for (final dto
          in response.productIngredients.where((d) => pushedIds.contains(d.id)))
        dto.toDriftCompanion(),
      for (final dto in pullOnly)
        if (_shouldApplyPull(dto.id, dto.updatedAt, localDirtyTimestamps))
          dto.toDriftCompanion(),
    ];

    if (companions.isNotEmpty) await dao.upsertIngredientBatch(companions);
  }

  Future<void> _applyCourses(
    CoursesDao dao,
    SyncResponseDto response,
    Set<String> pushedIds,
    String userId,
  ) async {
    if (response.courses.isEmpty) return;

    final pullOnly =
        response.courses.where((dto) => !pushedIds.contains(dto.id)).toList();
    final localDirtyTimestamps = {
      for (final r in await dao.getPendingSync()) r.id: r.updatedAt,
    };

    final companions = [
      for (final dto
          in response.courses.where((d) => pushedIds.contains(d.id)))
        dto.toDriftCompanion(userId: userId),
      for (final dto in pullOnly)
        if (_shouldApplyPull(dto.id, dto.updatedAt, localDirtyTimestamps))
          dto.toDriftCompanion(userId: userId),
    ];

    if (companions.isNotEmpty) await dao.upsertCourseBatch(companions);
  }

  Future<void> _applyIntakeLogs(
    CoursesDao dao,
    SyncResponseDto response,
    Set<String> pushedIds,
    String userId,
  ) async {
    if (response.intakeLogs.isEmpty) return;

    final pullOnly = response.intakeLogs
        .where((dto) => !pushedIds.contains(dto.id))
        .toList();
    final localDirtyTimestamps = {
      for (final r in await dao.getPendingIntakeSync()) r.id: r.updatedAt,
    };

    final companions = [
      for (final dto
          in response.intakeLogs.where((d) => pushedIds.contains(d.id)))
        dto.toDriftCompanion(userId: userId),
      for (final dto in pullOnly)
        if (_shouldApplyPull(dto.id, dto.updatedAt, localDirtyTimestamps))
          dto.toDriftCompanion(userId: userId),
    ];

    if (companions.isNotEmpty) await dao.upsertIntakeLogBatch(companions);
  }

  // ── LWW helpers ────────────────────────────────────────────────────────────

  /// Returns `true` when the server version should be applied.
  ///
  /// Skips the server version if a locally dirty row exists with a strictly
  /// newer [updatedAt] timestamp — that local edit is more recent and will win
  /// the next sync cycle instead.
  bool _shouldApplyPull(
    String id,
    DateTime serverUpdatedAt,
    Map<String, DateTime> localDirtyTimestamps,
  ) {
    final localUpdatedAt = localDirtyTimestamps[id];
    if (localUpdatedAt == null) return true;
    return !localUpdatedAt.isAfter(serverUpdatedAt);
  }

  // ── Error mapping ──────────────────────────────────────────────────────────

  AppFailure _toAppFailure(Object e) {
    if (e is DioException) {
      final status = e.response?.statusCode;
      if (status == 400) {
        final body = e.response?.data;
        final detail = body is Map ? body['title'] ?? body.toString() : e.message;
        return SyncFailure(message: 'Validation error: $detail');
      }
      if (status == 401) return AuthFailure.expired;
      if (status == 403) {
        return const SyncFailure(
          message: 'Takeover attempt detected. See dev logs.',
        );
      }
      return NetworkFailure(
        message: e.message ?? 'Sync network error',
        statusCode: status,
      );
    }
    if (e is SocketException) {
      return const NetworkFailure(message: 'No internet connection.');
    }
    if (e is AppFailure) return e;
    return UnknownFailure(message: e.toString(), cause: e);
  }
}

