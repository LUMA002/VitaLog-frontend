import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../data/local/daos/courses_dao.dart';
import '../../domain/models/course.dart';
import '../../domain/repositories/i_course_repository.dart';
import 'mappers/course_mapper.dart';

/// Drift (SQLite) implementation of [ICourseRepository].
///
/// Wraps [CoursesDao] and converts any storage exception to a [DbFailure]
/// so callers never see raw Drift/SQLite errors.
final class DriftCourseRepository implements ICourseRepository {
  const DriftCourseRepository(this._dao);

  final CoursesDao _dao;

  @override
  Stream<List<Course>> watchActiveForUser(String? userId) {
    return _dao.watchForUser(userId).map(
      (rows) =>
          rows
              .where((r) => r.deletedAt == null)
              .map((r) => r.toDomain())
              .toList(),
    );
  }

  @override
  Future<Course?> getById(String id) async {
    final row = await _dao.getCourseById(id);
    return row?.toDomain();
  }

  @override
  Future<Result<Unit, AppFailure>> upsert(Course course) async {
    try {
      await _dao.upsertCourseBatch([course.toDrift(pendingSync: 1)]);
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<Unit, AppFailure>> softDelete(
    String id,
    DateTime nowUtc,
  ) async {
    try {
      final existing = await _dao.getCourseById(id);
      if (existing == null) {
        return const Failure(DbFailure(message: 'Course not found.'));
      }
      final updated = existing.toDomain().copyWith(
        deletedAtUtc: nowUtc,
        updatedAtUtc: nowUtc,
      );
      await _dao.upsertCourseBatch([updated.toDrift(pendingSync: 1)]);
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }
}
