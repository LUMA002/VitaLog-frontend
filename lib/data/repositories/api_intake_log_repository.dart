import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../domain/models/intake_log.dart';
import '../../domain/repositories/i_intake_log_repository.dart';

/// Thin-client (Web/Desktop) implementation of [IIntakeLogRepository].
///
/// Stub — to be implemented in Phase 6 (Web/Thin client).
final class ApiIntakeLogRepository implements IIntakeLogRepository {
  const ApiIntakeLogRepository();

  @override
  Stream<List<IntakeLog>> watchForUser(String? userId) =>
      throw UnimplementedError('ApiIntakeLogRepository is not yet implemented.');

  @override
  Stream<List<IntakeLog>> watchForCourse(String courseId) =>
      throw UnimplementedError('ApiIntakeLogRepository is not yet implemented.');

  @override
  Future<IntakeLog?> getById(String id) =>
      throw UnimplementedError('ApiIntakeLogRepository is not yet implemented.');

  @override
  Future<Result<Unit, AppFailure>> upsert(IntakeLog log) =>
      throw UnimplementedError('ApiIntakeLogRepository is not yet implemented.');

  @override
  Future<Result<Unit, AppFailure>> softDelete(String id, DateTime nowUtc) =>
      throw UnimplementedError('ApiIntakeLogRepository is not yet implemented.');
}
