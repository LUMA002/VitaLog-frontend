// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_global_ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncGlobalIngredientDto _$SyncGlobalIngredientDtoFromJson(
  Map<String, dynamic> json,
) => _SyncGlobalIngredientDto(
  id: json['id'] as String,
  name: json['name'] as String,
  defaultUnit: json['defaultUnit'] as String,
  category: _categoryFromJson(json['category'] as String),
  updatedAt: const MicrosecondDateTimeJsonConverter().fromJson(
    json['updatedAt'] as String,
  ),
  deletedAt: _$JsonConverterFromJson<String, DateTime>(
    json['deletedAt'],
    const MicrosecondDateTimeJsonConverter().fromJson,
  ),
);

Map<String, dynamic> _$SyncGlobalIngredientDtoToJson(
  _SyncGlobalIngredientDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'defaultUnit': instance.defaultUnit,
  'category': _categoryToJson(instance.category),
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
