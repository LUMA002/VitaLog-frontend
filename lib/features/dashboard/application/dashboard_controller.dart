import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers/repository_providers.dart';
import '../../../core/utils/uuid.dart';
import '../../../domain/models/course.dart';
import '../../../domain/models/intake_log.dart';
import '../../../domain/models/product.dart';
import '../../auth/application/auth_controller.dart';
import 'scheduled_intake.dart';

part 'dashboard_controller.g.dart';

/// Derives today's supplement schedule by joining active [Course]s,
/// today's [IntakeLog]s and the [Product] catalogue.
///
/// Whenever any of the three underlying Drift streams emit, [build] re-runs
/// and the dashboard re-renders automatically with zero explicit refresh calls.
@riverpod
class DashboardSchedule extends _$DashboardSchedule {
  @override
  FutureOr<List<ScheduledIntake>> build() async {
    final authState = ref.watch(authControllerProvider).value;
    final userId = switch (authState) {
      Authenticated(:final userId) => userId,
      _ => null,
    };

    final clock = ref.watch(clockProvider);
    final nowUtc = clock.nowUtc();

    final courses =
        await ref.watch(activeCourseStreamProvider(userId).future);
    final logs =
        await ref.watch(userIntakeLogStreamProvider(userId).future);
    final products = await ref.watch(allProductStreamProvider.future);

    return _buildSchedule(courses, logs, products, nowUtc);
  }

  // ── Mutations ──────────────────────────────────────────────────────────────

  /// Creates an [IntakeLog] for [courseId] at the current UTC time.
  Future<void> logIntake(String courseId) async {
    final schedule = state.value;
    final intake = schedule?.where((i) => i.courseId == courseId).firstOrNull;
    if (intake == null) return;

    final clock = ref.read(clockProvider);
    final now = clock.nowUtc();
    final authState = ref.read(authControllerProvider).value;
    final userId = switch (authState) {
      Authenticated(:final userId) => userId,
      _ => null,
    };

    final log = IntakeLog(
      id: newUuid(),
      courseId: courseId,
      userId: userId,
      actualServingSize: intake.servingSize,
      takenAtUtc: now,
      updatedAtUtc: now,
      deletedAtUtc: null,
    );

    await ref.read(intakeLogRepositoryProvider).upsert(log);
  }

  /// Soft-deletes the [IntakeLog] for [courseId] if one exists today.
  Future<void> unlogIntake(String courseId) async {
    final schedule = state.value;
    final intake = schedule?.where((i) => i.courseId == courseId).firstOrNull;
    if (intake?.intakeLogId == null) return;

    final clock = ref.read(clockProvider);
    await ref
        .read(intakeLogRepositoryProvider)
        .softDelete(intake!.intakeLogId!, clock.nowUtc());
  }

  // ── Schedule derivation ───────────────────────────────────────────────────

  static List<ScheduledIntake> _buildSchedule(
    List<Course> courses,
    List<IntakeLog> logs,
    List<Product> products,
    DateTime nowUtc,
  ) {
    final todayUtc =
        DateTime.utc(nowUtc.year, nowUtc.month, nowUtc.day);
    final todayEndUtc = todayUtc.add(const Duration(days: 1));

    final productsById = {for (final p in products) p.id: p};

    // Courses active on today's UTC date.
    final activeCourses = courses.where((c) {
      if (c.deletedAtUtc != null) return false;
      if (c.startDateUtc.isAfter(todayEndUtc)) return false;
      if (c.endDateUtc != null && c.endDateUtc!.isBefore(todayUtc)) {
        return false;
      }
      return true;
    });

    // Keep the most recent log per course for today.
    final logsByCourse = <String, IntakeLog>{};
    for (final log in logs) {
      if (log.deletedAtUtc != null) continue;
      if (log.takenAtUtc.isBefore(todayUtc)) continue;
      if (!log.takenAtUtc.isBefore(todayEndUtc)) continue;
      final existing = logsByCourse[log.courseId];
      if (existing == null ||
          log.takenAtUtc.isAfter(existing.takenAtUtc)) {
        logsByCourse[log.courseId] = log;
      }
    }

    return activeCourses.map((course) {
      final product = productsById[course.productId];
      final takenLog = logsByCourse[course.id];
      return ScheduledIntake(
        courseId: course.id,
        productId: course.productId,
        productName: product?.name ?? '—',
        servingSize: course.servingSize,
        timeOfDay: course.timeOfDay,
        scheduledAtUtc: todayUtc.add(course.timeOfDay),
        isTaken: takenLog != null,
        intakeLogId: takenLog?.id,
        takenAtUtc: takenLog?.takenAtUtc,
      );
    }).toList()
      ..sort((a, b) => a.timeOfDay.compareTo(b.timeOfDay));
  }
}
