import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/decimal_as_string_converter.dart';
import '../converters/microsecond_datetime_json_converter.dart';

part 'sync_product_ingredient_dto.freezed.dart';
part 'sync_product_ingredient_dto.g.dart';

/// Wire representation of a [ProductIngredient] in the `/api/sync` payload.
///
/// JSON contract:
/// ```json
/// {
///   "id": "uuid",
///   "productId": "uuid",
///   "ingredientId": "uuid-or-null",
///   "customIngredientName": "string-or-null",
///   "amount": "30.000000",
///   "unit": "g",
///   "updatedAt": "2026-05-17T13:12:00.123456Z",
///   "deletedAt": null
/// }
/// ```
///
/// XOR rule: exactly one of [ingredientId] or [customIngredientName] is non-null.
@freezed
sealed class SyncProductIngredientDto with _$SyncProductIngredientDto {
  const factory SyncProductIngredientDto({
    required String id,
    required String productId,
    required String? ingredientId,
    required String? customIngredientName,
    @DecimalAsStringConverter() required double amount,
    required String unit,
    @MicrosecondDateTimeJsonConverter() required DateTime updatedAt,
    @MicrosecondDateTimeJsonConverter() required DateTime? deletedAt,
  }) = _SyncProductIngredientDto;

  factory SyncProductIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$SyncProductIngredientDtoFromJson(json);
}
