import 'package:drift/drift.dart';

import '../../local/app_database.dart';
import '../../remote/dtos/sync_course_dto.dart';
import '../../remote/dtos/sync_global_ingredient_dto.dart';
import '../../remote/dtos/sync_intake_log_dto.dart';
import '../../remote/dtos/sync_product_dto.dart';
import '../../remote/dtos/sync_product_ingredient_dto.dart';

// ── Product ───────────────────────────────────────────────────────────────────

/// Converts a dirty [ProductsData] row into its sync push payload.
extension ProductDataSyncX on ProductsData {
  SyncProductDto toSyncDto() => SyncProductDto(
    id: id,
    name: name,
    description: description,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}

/// Converts a server-echoed [SyncProductDto] into a Drift [ProductsCompanion].
///
/// [creatorUserId] is absent (preserves existing on UPDATE, NULL on INSERT)
/// because the server never returns it in the DTO.
/// [isLocalDraft] is forced to `0` — once the server has echoed this row
/// back, it is no longer a local-only draft.
extension SyncProductDtoDriftX on SyncProductDto {
  ProductsCompanion toDriftCompanion() => ProductsCompanion(
    id: Value(id),
    name: Value(name),
    description: Value(description),
    // Intentionally absent: preserve existing `creatorUserId` on UPDATE;
    // new rows (INSERT) get NULL (treated as "global / unknown owner").
    creatorUserId: const Value.absent(),
    isLocalDraft: const Value(0),
    updatedAt: Value(updatedAt),
    deletedAt: Value(deletedAt),
    pendingSync: const Value(0),
  );
}

// ── ProductIngredient ─────────────────────────────────────────────────────────

extension ProductIngredientDataSyncX on ProductIngredientsData {
  SyncProductIngredientDto toSyncDto() => SyncProductIngredientDto(
    id: id,
    productId: productId,
    ingredientId: ingredientId,
    customIngredientName: customIngredientName,
    amount: amount,
    unit: unit,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}

extension SyncProductIngredientDtoDriftX on SyncProductIngredientDto {
  ProductIngredientsCompanion toDriftCompanion() => ProductIngredientsCompanion(
    id: Value(id),
    productId: Value(productId),
    ingredientId: Value(ingredientId),
    customIngredientName: Value(customIngredientName),
    amount: Value(amount),
    unit: Value(unit),
    updatedAt: Value(updatedAt),
    deletedAt: Value(deletedAt),
    pendingSync: const Value(0),
  );
}

// ── Course ────────────────────────────────────────────────────────────────────

extension CoursesDataSyncX on CoursesData {
  SyncCourseDto toSyncDto() => SyncCourseDto(
    id: id,
    productId: productId,
    servingSize: servingSize,
    timeOfDay: Duration(seconds: timeOfDay),
    startDate: DateTime.fromMillisecondsSinceEpoch(
      startDate * 86400000,
      isUtc: true,
    ),
    endDate: endDate == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(endDate! * 86400000, isUtc: true),
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}

/// [userId] must be the currently authenticated user's ID — the server never
/// returns `userId` in the DTO, so the caller injects it.
extension SyncCourseDtoDriftX on SyncCourseDto {
  CoursesCompanion toDriftCompanion({required String? userId}) =>
      CoursesCompanion(
        id: Value(id),
        userId: Value(userId),
        productId: Value(productId),
        servingSize: Value(servingSize),
        timeOfDay: Value(timeOfDay.inSeconds),
        startDate: Value(
          startDate.toUtc().millisecondsSinceEpoch ~/ 86400000,
        ),
        endDate: Value(
          endDate == null
              ? null
              : endDate!.toUtc().millisecondsSinceEpoch ~/ 86400000,
        ),
        updatedAt: Value(updatedAt),
        deletedAt: Value(deletedAt),
        pendingSync: const Value(0),
      );
}

// ── IntakeLog ─────────────────────────────────────────────────────────────────

extension IntakeLogsDataSyncX on IntakeLogsData {
  SyncIntakeLogDto toSyncDto() => SyncIntakeLogDto(
    id: id,
    courseId: courseId,
    actualServingSize: actualServingSize,
    takenAt: takenAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
  );
}

/// [userId] must be the currently authenticated user's ID.
extension SyncIntakeLogDtoDriftX on SyncIntakeLogDto {
  IntakeLogsCompanion toDriftCompanion({required String? userId}) =>
      IntakeLogsCompanion(
        id: Value(id),
        courseId: Value(courseId),
        userId: Value(userId),
        actualServingSize: Value(actualServingSize),
        takenAt: Value(takenAt),
        updatedAt: Value(updatedAt),
        deletedAt: Value(deletedAt),
        pendingSync: const Value(0),
      );
}

// ── GlobalIngredient ──────────────────────────────────────────────────────────

extension SyncGlobalIngredientDtoDriftX on SyncGlobalIngredientDto {
  GlobalIngredientsCompanion toDriftCompanion() => GlobalIngredientsCompanion(
    id: Value(id),
    name: Value(name),
    defaultUnit: Value(defaultUnit),
    category: Value(category.value),
    updatedAt: Value(updatedAt),
    deletedAt: Value(deletedAt),
    pendingSync: const Value(0),
  );
}
