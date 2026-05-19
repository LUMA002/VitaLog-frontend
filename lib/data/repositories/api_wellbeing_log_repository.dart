import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../domain/models/wellbeing_log.dart';
import '../../domain/repositories/i_wellbeing_log_repository.dart';

/// Thin-client (Web/Desktop) implementation of [IWellbeingLogRepository].
///
/// Stub — to be implemented in Phase 6 (Web/Thin client).
/// Note: wellbeing logs are local-only in V2; this stub exists only to
/// satisfy the Thick/Thin chokepoint pattern uniformly.
final class ApiWellbeingLogRepository implements IWellbeingLogRepository {
  const ApiWellbeingLogRepository();

  @override
  Stream<List<WellbeingLog>> watchAll() =>
      throw UnimplementedError(
        'ApiWellbeingLogRepository is not yet implemented.',
      );

  @override
  Future<WellbeingLog?> getById(String id) =>
      throw UnimplementedError(
        'ApiWellbeingLogRepository is not yet implemented.',
      );

  @override
  Future<Result<Unit, AppFailure>> insert(WellbeingLog log) =>
      throw UnimplementedError(
        'ApiWellbeingLogRepository is not yet implemented.',
      );

  @override
  Future<Result<Unit, AppFailure>> update(WellbeingLog log) =>
      throw UnimplementedError(
        'ApiWellbeingLogRepository is not yet implemented.',
      );

  @override
  Future<Result<Unit, AppFailure>> deleteById(String id) =>
      throw UnimplementedError(
        'ApiWellbeingLogRepository is not yet implemented.',
      );
}
