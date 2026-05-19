import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../data/local/daos/courses_dao.dart';
import '../../domain/models/intake_log.dart';
import '../../domain/repositories/i_intake_log_repository.dart';
import 'mappers/intake_log_mapper.dart';

/// Drift (SQLite) implementation of [IIntakeLogRepository].
final class DriftIntakeLogRepository implements IIntakeLogRepository {
  const DriftIntakeLogRepository(this._dao);

  final CoursesDao _dao;

  @override
  Stream<List<IntakeLog>> watchForUser(String? userId) {
    return _dao.watchIntakeLogsForUser(userId).map(
      (rows) =>
          rows
              .where((r) => r.deletedAt == null)
              .map((r) => r.toDomain())
              .toList(),
    );
  }

  @override
  Stream<List<IntakeLog>> watchForCourse(String courseId) {
    return _dao.watchForCourse(courseId).map(
      (rows) =>
          rows
              .where((r) => r.deletedAt == null)
              .map((r) => r.toDomain())
              .toList(),
    );
  }

  @override
  Future<IntakeLog?> getById(String id) async {
    final row = await _dao.getIntakeLogById(id);
    return row?.toDomain();
  }

  @override
  Future<Result<Unit, AppFailure>> upsert(IntakeLog log) async {
    try {
      await _dao.upsertIntakeLogBatch([log.toDrift(pendingSync: 1)]);
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
      final existing = await _dao.getIntakeLogById(id);
      if (existing == null) {
        return const Failure(DbFailure(message: 'IntakeLog not found.'));
      }
      final updated = existing.toDomain().copyWith(
        deletedAtUtc: nowUtc,
        updatedAtUtc: nowUtc,
      );
      await _dao.upsertIntakeLogBatch([updated.toDrift(pendingSync: 1)]);
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }
}
