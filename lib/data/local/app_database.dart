import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'converters/microsecond_datetime_converter.dart';
import 'daos/courses_dao.dart';
import 'daos/global_ingredients_dao.dart';
import 'daos/products_dao.dart';
import 'daos/sync_meta_dao.dart';
import 'daos/wellbeing_logs_dao.dart';
import 'tables/courses_table.dart';
import 'tables/global_ingredients_table.dart';
import 'tables/intake_logs_table.dart';
import 'tables/product_ingredients_table.dart';
import 'tables/products_table.dart';
import 'tables/sync_meta_table.dart';
import 'tables/wellbeing_logs_table.dart';

part 'app_database.g.dart';

/// The single local SQLite database for the VitaLog mobile client.
///
/// Opened on a background isolate via [NativeDatabase.createInBackground]
/// (eliminates UI-thread jank during large sync batches).
///
/// [schemaVersion] = 1 — the initial schema. Future migrations are added as
/// numbered `onUpgrade` branches; never modify `onCreate`.
///
/// PRAGMA `foreign_keys = ON` is set both at creation time and before every
/// subsequent open ([beforeOpen]) to survive database re-opens on Android.
@DriftDatabase(
  tables: [
    Products,
    ProductIngredients,
    Courses,
    IntakeLogs,
    GlobalIngredients,
    WellbeingLogs,
    SyncMeta,
  ],
  daos: [
    ProductsDao,
    CoursesDao,
    GlobalIngredientsDao,
    WellbeingLogsDao,
    SyncMetaDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  /// Convenience factory: opens `vita_log.sqlite` in the app-documents dir
  /// on a background isolate. Use this in production Riverpod wiring.
  factory AppDatabase.connect() => AppDatabase(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();

      // Enforce FK constraints at creation time.
      await customStatement('PRAGMA foreign_keys = ON;');

      // ── Performance indexes ──────────────────────────────────────────────
      // (courses) delta-sync queries and dashboard derivation
      await customStatement(
        'CREATE INDEX idx_courses_user_updated '
        'ON courses (user_id, updated_at)',
      );
      // (courses) upload-selector (dirty rows)
      await customStatement(
        'CREATE INDEX idx_courses_pending '
        'ON courses (pending_sync)',
      );

      // (intake_logs) delta-sync queries
      await customStatement(
        'CREATE INDEX idx_intake_logs_user_updated '
        'ON intake_logs (user_id, updated_at)',
      );
      // (intake_logs) dashboard timeline by course
      await customStatement(
        'CREATE INDEX idx_intake_logs_course_taken '
        'ON intake_logs (course_id, taken_at)',
      );
      // (intake_logs) upload-selector
      await customStatement(
        'CREATE INDEX idx_intake_logs_pending '
        'ON intake_logs (pending_sync)',
      );

      // (products) delta-sync queries
      await customStatement(
        'CREATE INDEX idx_products_creator_updated '
        'ON products (creator_user_id, updated_at)',
      );
      // (products) upload-selector
      await customStatement(
        'CREATE INDEX idx_products_pending '
        'ON products (pending_sync)',
      );

      // (product_ingredients) join queries
      await customStatement(
        'CREATE INDEX idx_product_ingredients_product '
        'ON product_ingredients (product_id)',
      );
      // (product_ingredients) upload-selector
      await customStatement(
        'CREATE INDEX idx_product_ingredients_pending '
        'ON product_ingredients (pending_sync)',
      );

      // (global_ingredients) delta-sync
      await customStatement(
        'CREATE INDEX idx_global_ingredients_updated '
        'ON global_ingredients (updated_at)',
      );

      // ── Seed the single SyncMeta row ─────────────────────────────────────
      await into(syncMeta).insert(const SyncMetaCompanion(id: Value(1)));
    },
    beforeOpen: (_) async {
      // Re-enable FK enforcement after every open (SQLite resets per-connection).
      await customStatement('PRAGMA foreign_keys = ON;');
    },
  );
}

/// Opens the production SQLite file on a background isolate.
LazyDatabase _openConnection() => LazyDatabase(() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'vita_log.sqlite'));
  return NativeDatabase.createInBackground(file);
});
