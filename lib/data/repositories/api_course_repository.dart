import '../../core/failure/app_failure.dart';
import '../../core/result/result.dart';
import '../../domain/models/course.dart';
import '../../domain/repositories/i_course_repository.dart';

/// Thin-client (Web/Desktop) implementation of [ICourseRepository].
///
/// Stub — to be implemented in Phase 6 (Web/Thin client).
/// All methods delegate directly to the remote API via Dio.
/// There is no local database on thin clients.
final class ApiCourseRepository implements ICourseRepository {
  const ApiCourseRepository();

  @override
  Stream<List<Course>> watchActiveForUser(String? userId) =>
      throw UnimplementedError('ApiCourseRepository is not yet implemented.');

  @override
  Future<Course?> getById(String id) =>
      throw UnimplementedError('ApiCourseRepository is not yet implemented.');

  @override
  Future<Result<Unit, AppFailure>> upsert(Course course) =>
      throw UnimplementedError('ApiCourseRepository is not yet implemented.');

  @override
  Future<Result<Unit, AppFailure>> softDelete(String id, DateTime nowUtc) =>
      throw UnimplementedError('ApiCourseRepository is not yet implemented.');
}
