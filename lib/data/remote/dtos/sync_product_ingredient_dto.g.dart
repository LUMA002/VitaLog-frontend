// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_product_ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncProductIngredientDto _$SyncProductIngredientDtoFromJson(
  Map<String, dynamic> json,
) => _SyncProductIngredientDto(
  id: json['id'] as String,
  productId: json['productId'] as String,
  ingredientId: json['ingredientId'] as String?,
  customIngredientName: json['customIngredientName'] as String?,
  amount: const DecimalAsStringConverter().fromJson(json['amount'] as Object),
  unit: json['unit'] as String,
  updatedAt: const MicrosecondDateTimeJsonConverter().fromJson(
    json['updatedAt'] as String,
  ),
  deletedAt: _$JsonConverterFromJson<String, DateTime>(
    json['deletedAt'],
    const MicrosecondDateTimeJsonConverter().fromJson,
  ),
);

Map<String, dynamic> _$SyncProductIngredientDtoToJson(
  _SyncProductIngredientDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'ingredientId': instance.ingredientId,
  'customIngredientName': instance.customIngredientName,
  'amount': const DecimalAsStringConverter().toJson(instance.amount),
  'unit': instance.unit,
  'updatedAt': const MicrosecondDateTimeJsonConverter().toJson(
    instance.updatedAt,
  ),
  'deletedAt': _$JsonConverterToJson<String, DateTime>(
    instance.deletedAt,
    const MicrosecondDateTimeJsonConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
