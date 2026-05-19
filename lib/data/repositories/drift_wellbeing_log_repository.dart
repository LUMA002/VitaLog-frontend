import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../data/local/daos/wellbeing_logs_dao.dart';
import '../../domain/models/wellbeing_log.dart';
import '../../domain/repositories/i_wellbeing_log_repository.dart';
import 'mappers/wellbeing_log_mapper.dart';

/// Drift (SQLite) implementation of [IWellbeingLogRepository].
///
/// Wellbeing logs are local-only in V2 — no pendingSync column, no sync
/// hooks. Hard deletes are used instead of soft deletes.
final class DriftWellbeingLogRepository implements IWellbeingLogRepository {
  const DriftWellbeingLogRepository(this._dao);

  final WellbeingLogsDao _dao;

  @override
  Stream<List<WellbeingLog>> watchAll() {
    return _dao.watchAll().map(
      (rows) => rows.map((r) => r.toDomain()).toList(),
    );
  }

  @override
  Future<WellbeingLog?> getById(String id) async {
    final row = await _dao.getById(id);
    return row?.toDomain();
  }

  @override
  Future<Result<Unit, AppFailure>> insert(WellbeingLog log) async {
    try {
      await _dao.insertLog(log.toDrift());
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<Unit, AppFailure>> update(WellbeingLog log) async {
    try {
      final affected = await _dao.updateLog(log.toDrift());
      if (!affected) {
        return const Failure(DbFailure(message: 'WellbeingLog not found.'));
      }
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<Unit, AppFailure>> deleteById(String id) async {
    try {
      await _dao.deleteById(id);
      return const Success(Unit.instance);
    } catch (e) {
      return Failure(DbFailure(message: e.toString(), cause: e));
    }
  }
}
