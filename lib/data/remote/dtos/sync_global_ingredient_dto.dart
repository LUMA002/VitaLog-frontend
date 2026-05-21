import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/ingredient_category.dart';
import '../converters/microsecond_datetime_json_converter.dart';

part 'sync_global_ingredient_dto.freezed.dart';
part 'sync_global_ingredient_dto.g.dart';

// ── Category helpers ──────────────────────────────────────────────────────────

/// Parses the backend's `JsonStringEnumConverter` output (PascalCase C# enum
/// names: `"Vitamin"`, `"Mineral"`, `"Supplement"`) into [IngredientCategory].
IngredientCategory _categoryFromJson(String value) {
  return switch (value) {
    'Vitamin' => IngredientCategory.vitamin,
    'Mineral' => IngredientCategory.mineral,
    'Supplement' => IngredientCategory.supplement,
    _ => IngredientCategory.supplement,
  };
}

String _categoryToJson(IngredientCategory cat) {
  return switch (cat) {
    IngredientCategory.vitamin => 'Vitamin',
    IngredientCategory.mineral => 'Mineral',
    IngredientCategory.supplement => 'Supplement',
  };
}

// ── DTO ───────────────────────────────────────────────────────────────────────

/// Wire representation of a [GlobalIngredient] in the `/api/sync` response.
///
/// These are server-owned / read-only from the mobile client's perspective.
/// JSON contract:
/// ```json
/// {
///   "id": "uuid",
///   "name": "Vitamin C",
///   "defaultUnit": "mg",
///   "category": "Vitamin",
///   "updatedAt": "2026-05-17T13:12:00.123456Z",
///   "deletedAt": null
/// }
/// ```
@freezed
sealed class SyncGlobalIngredientDto with _$SyncGlobalIngredientDto {
  const factory SyncGlobalIngredientDto({
    required String id,
    required String name,
    required String defaultUnit,
    @JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson)
    required IngredientCategory category,
    @MicrosecondDateTimeJsonConverter() required DateTime updatedAt,
    @MicrosecondDateTimeJsonConverter() required DateTime? deletedAt,
  }) = _SyncGlobalIngredientDto;

  factory SyncGlobalIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$SyncGlobalIngredientDtoFromJson(json);
}
