import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../models/wellbeing_log.dart';

/// Thick/Thin chokepoint for wellbeing journal data access.
///
/// This repository is local-only in V2. There is no sync contract for
/// wellbeing logs yet (reserved via [WellbeingLog.syncFlags]).
abstract interface class IWellbeingLogRepository {
  /// Reactive stream of all entries, newest first.
  Stream<List<WellbeingLog>> watchAll();

  /// Returns a single entry by [id], or null if not found.
  Future<WellbeingLog?> getById(String id);

  /// Inserts a new wellbeing log entry.
  Future<Result<Unit, AppFailure>> insert(WellbeingLog log);

  /// Updates an existing wellbeing log entry.
  Future<Result<Unit, AppFailure>> update(WellbeingLog log);

  /// Permanently deletes the entry with [id] (no soft-delete — local-only).
  Future<Result<Unit, AppFailure>> deleteById(String id);
}
