import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/courses_table.dart';
import '../tables/intake_logs_table.dart';
import '../tables/products_table.dart';

part 'courses_dao.g.dart';

/// Row returned by [CoursesDao.watchIntakeHistoryForUser] (Drift join).
class IntakeHistoryRow {
  const IntakeHistoryRow({required this.log, this.productName});

  final IntakeLogsData log;
  final String? productName;
}

/// Data access for [Courses] and [IntakeLogs].
///
/// These two entities are grouped in one DAO because IntakeLogs are always
/// queried in the context of a course (dashboard plan, history timeline).
@DriftAccessor(tables: [Courses, IntakeLogs, Products])
class CoursesDao extends DatabaseAccessor<AppDatabase>
    with _$CoursesDaoMixin {
  CoursesDao(super.db);

  // ─── Courses ──────────────────────────────────────────────────────────────

  /// Reactive stream of all courses for a given user (including soft-deleted —
  /// filter `deletedAt == null` in the repository layer).
  Stream<List<CoursesData>> watchForUser(String? userId) => (select(courses)
        ..where(
          (t) => userId == null ? t.userId.isNull() : t.userId.equals(userId),
        ))
      .watch();

  /// Course by UUID. Returns null if not found.
  Future<CoursesData?> getCourseById(String id) =>
      (select(courses)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Dirty courses awaiting push, oldest-edit first.
  Future<List<CoursesData>> getPendingSync() =>
      (select(courses)
            ..where((t) => t.pendingSync.equals(1))
            ..orderBy([(t) => OrderingTerm.asc(t.updatedAt)]))
          .get();

  /// Insert or replace a batch of courses.
  Future<void> upsertCourseBatch(List<CoursesCompanion> rows) =>
      batch((b) => b.insertAllOnConflictUpdate(courses, rows));

  // ─── IntakeLogs ───────────────────────────────────────────────────────────

  /// Reactive stream of all intake logs for a course.
  Stream<List<IntakeLogsData>> watchForCourse(String courseId) =>
      (select(intakeLogs)..where((t) => t.courseId.equals(courseId))).watch();

  /// Reactive stream of intake logs for a user (for history/dashboard).
  Stream<List<IntakeLogsData>> watchIntakeLogsForUser(String? userId) =>
      (select(intakeLogs)
            ..where(
              (t) =>
                  userId == null
                      ? t.userId.isNull()
                      : t.userId.equals(userId),
            ))
          .watch();

  /// Intake log by UUID.
  Future<IntakeLogsData?> getIntakeLogById(String id) =>
      (select(intakeLogs)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Dirty intake logs awaiting push, oldest-edit first.
  Future<List<IntakeLogsData>> getPendingIntakeSync() =>
      (select(intakeLogs)
            ..where((t) => t.pendingSync.equals(1))
            ..orderBy([(t) => OrderingTerm.asc(t.updatedAt)]))
          .get();

  /// Insert or replace a batch of intake logs.
  Future<void> upsertIntakeLogBatch(List<IntakeLogsCompanion> rows) =>
      batch((b) => b.insertAllOnConflictUpdate(intakeLogs, rows));

  /// Intake history with product names via LEFT JOIN (includes soft-deleted
  /// courses and products so historical labels stay intact).
  Stream<List<IntakeHistoryRow>> watchIntakeHistoryForUser(String? userId) {
    final joined = select(intakeLogs).join([
      leftOuterJoin(courses, courses.id.equalsExp(intakeLogs.courseId)),
      leftOuterJoin(products, products.id.equalsExp(courses.productId)),
    ]);

    if (userId == null) {
      joined.where(intakeLogs.userId.isNull());
    } else {
      joined.where(intakeLogs.userId.equals(userId));
    }

    return joined.watch().map(
      (rows) => rows
          .map(
            (row) => IntakeHistoryRow(
              log: row.readTable(intakeLogs),
              productName: row.readTableOrNull(products)?.name,
            ),
          )
          .where((r) => r.log.deletedAt == null)
          .toList(),
    );
  }
}
