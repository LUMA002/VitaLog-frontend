import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';

/// Sync contract used by [SyncEngine].
///
/// Stub — will be fully implemented in Phase 5 (Auth & Sync).
/// Implementation: [ApiSyncRepository] — executes the batch pull-push
/// against `POST /api/sync`.
abstract interface class ISyncRepository {
  /// Executes a full pull-push sync cycle.
  /// Returns [Unit] on success or an [AppFailure] describing what went wrong.
  Future<Result<Unit, AppFailure>> sync();
}
