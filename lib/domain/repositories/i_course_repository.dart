import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../models/course.dart';

/// Thick/Thin chokepoint for course data access.
///
/// Mobile binds to [DriftCourseRepository]; future web build binds to
/// [ApiCourseRepository]. Features must never import Drift or Dio directly.
abstract interface class ICourseRepository {
  /// Reactive stream of active (non-deleted) courses for [userId].
  /// Pass `null` for guest mode (rows with no userId).
  Stream<List<Course>> watchActiveForUser(String? userId);

  /// Returns a single course by [id], or null if not found.
  Future<Course?> getById(String id);

  /// Persists [course] locally and marks it as pending sync (`pendingSync=1`).
  Future<Result<Unit, AppFailure>> upsert(Course course);

  /// Soft-deletes the course with [id] by setting [deletedAt] to [nowUtc]
  /// and marking it as pending sync.
  Future<Result<Unit, AppFailure>> softDelete(String id, DateTime nowUtc);
}
