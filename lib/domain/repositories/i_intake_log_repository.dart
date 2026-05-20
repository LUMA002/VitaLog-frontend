import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../models/intake_log.dart';
import '../models/intake_log_history_entry.dart';

/// Thick/Thin chokepoint for intake log data access.
abstract interface class IIntakeLogRepository {
  /// Reactive stream of all active intake logs for [userId].
  /// Pass `null` for guest mode.
  Stream<List<IntakeLog>> watchForUser(String? userId);

  /// History stream with product names via LEFT JOIN (includes soft-deleted
  /// courses and products so labels remain after course deletion).
  Stream<List<IntakeLogHistoryEntry>> watchHistoryForUser(String? userId);

  /// Reactive stream of all intake logs for [courseId].
  Stream<List<IntakeLog>> watchForCourse(String courseId);

  /// Returns a single intake log by [id], or null if not found.
  Future<IntakeLog?> getById(String id);

  /// Persists [log] locally and marks it as pending sync.
  Future<Result<Unit, AppFailure>> upsert(IntakeLog log);

  /// Soft-deletes the log with [id] by setting [deletedAt] to [nowUtc].
  Future<Result<Unit, AppFailure>> softDelete(String id, DateTime nowUtc);
}
