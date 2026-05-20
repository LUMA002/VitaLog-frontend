import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/time/clock.dart';
import '../../data/local/app_database.dart';
import '../../data/local/daos/courses_dao.dart';
import '../../data/local/daos/global_ingredients_dao.dart';
import '../../data/local/daos/products_dao.dart';
import '../../data/local/daos/sync_meta_dao.dart';
import '../../data/local/daos/wellbeing_logs_dao.dart';
import '../../data/repositories/drift_course_repository.dart';
import '../../data/repositories/drift_global_ingredient_repository.dart';
import '../../data/repositories/drift_intake_log_repository.dart';
import '../../data/repositories/drift_product_ingredient_repository.dart';
import '../../data/repositories/drift_product_repository.dart';
import '../../data/repositories/drift_wellbeing_log_repository.dart';
import '../../domain/models/course.dart';
import '../../domain/models/intake_log.dart';
import '../../domain/models/intake_log_history_entry.dart';
import '../../domain/models/product.dart';
import '../../domain/models/wellbeing_log.dart';
import '../../domain/repositories/i_course_repository.dart';
import '../../domain/repositories/i_global_ingredient_repository.dart';
import '../../domain/repositories/i_intake_log_repository.dart';
import '../../domain/repositories/i_product_ingredient_repository.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../../domain/repositories/i_wellbeing_log_repository.dart';

part 'repository_providers.g.dart';

// ── Infrastructure ─────────────────────────────────────────────────────────

/// The single [AppDatabase] instance for the lifetime of the app.
/// Disposed automatically when the [ProviderScope] is torn down.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase.connect();
  ref.onDispose(db.close);
  return db;
}

/// Application-wide [Clock]. Inject [TestClock] in tests via overrides.
@Riverpod(keepAlive: true)
Clock clock(Ref ref) => const SystemClock();

// ── DAOs ───────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
ProductsDao productsDao(Ref ref) => ref.watch(appDatabaseProvider).productsDao;

@Riverpod(keepAlive: true)
CoursesDao coursesDao(Ref ref) => ref.watch(appDatabaseProvider).coursesDao;

@Riverpod(keepAlive: true)
GlobalIngredientsDao globalIngredientsDao(Ref ref) =>
    ref.watch(appDatabaseProvider).globalIngredientsDao;

@Riverpod(keepAlive: true)
WellbeingLogsDao wellbeingLogsDao(Ref ref) =>
    ref.watch(appDatabaseProvider).wellbeingLogsDao;

@Riverpod(keepAlive: true)
SyncMetaDao syncMetaDao(Ref ref) =>
    ref.watch(appDatabaseProvider).syncMetaDao;

// ── Repositories ───────────────────────────────────────────────────────────
// Features depend ONLY on these abstract interfaces. Drift types never cross
// this boundary into the features/ layer.

@Riverpod(keepAlive: true)
ICourseRepository courseRepository(Ref ref) =>
    DriftCourseRepository(ref.watch(coursesDaoProvider));

@Riverpod(keepAlive: true)
IProductRepository productRepository(Ref ref) =>
    DriftProductRepository(ref.watch(productsDaoProvider));

@Riverpod(keepAlive: true)
IProductIngredientRepository productIngredientRepository(Ref ref) =>
    DriftProductIngredientRepository(ref.watch(productsDaoProvider));

@Riverpod(keepAlive: true)
IIntakeLogRepository intakeLogRepository(Ref ref) =>
    DriftIntakeLogRepository(ref.watch(coursesDaoProvider));

@Riverpod(keepAlive: true)
IGlobalIngredientRepository globalIngredientRepository(Ref ref) =>
    DriftGlobalIngredientRepository(ref.watch(globalIngredientsDaoProvider));

@Riverpod(keepAlive: true)
IWellbeingLogRepository wellbeingLogRepository(Ref ref) =>
    DriftWellbeingLogRepository(ref.watch(wellbeingLogsDaoProvider));

// ── Shared stream providers ─────────────────────────────────────────────────
// Defined here so multiple features can share the same Drift stream
// subscription without creating duplicate listeners.

/// Stream of active courses for [userId] (null = guest mode).
@Riverpod(keepAlive: true)
Stream<List<Course>> activeCourseStream(Ref ref, String? userId) =>
    ref.watch(courseRepositoryProvider).watchActiveForUser(userId);

/// Stream of all intake logs for [userId] (null = guest mode).
@Riverpod(keepAlive: true)
Stream<List<IntakeLog>> userIntakeLogStream(Ref ref, String? userId) =>
    ref.watch(intakeLogRepositoryProvider).watchForUser(userId);

/// Intake history with product names (LEFT JOIN, keeps deleted course labels).
@Riverpod(keepAlive: true)
Stream<List<IntakeLogHistoryEntry>> intakeHistoryStream(
  Ref ref,
  String? userId,
) =>
    ref.watch(intakeLogRepositoryProvider).watchHistoryForUser(userId);

/// Stream of all products (global + custom), soft-deleted excluded by repo.
@Riverpod(keepAlive: true)
Stream<List<Product>> allProductStream(Ref ref) =>
    ref.watch(productRepositoryProvider).watchAll();

/// Stream of all wellbeing log entries, newest first.
@Riverpod(keepAlive: true)
Stream<List<WellbeingLog>> allWellbeingLogStream(Ref ref) =>
    ref.watch(wellbeingLogRepositoryProvider).watchAll();

/// Stream of the last successful sync timestamp from [SyncMeta].
/// Emits `null` before the first sync has ever run.
@Riverpod(keepAlive: true)
Stream<DateTime?> lastSyncAtStream(Ref ref) => ref
    .watch(syncMetaDaoProvider)
    .watchSyncMeta()
    .map((row) => row?.lastSyncAt);
