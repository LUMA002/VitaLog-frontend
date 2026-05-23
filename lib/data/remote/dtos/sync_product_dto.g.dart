// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncProductDto _$SyncProductDtoFromJson(Map<String, dynamic> json) =>
    _SyncProductDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      updatedAt: const MicrosecondDateTimeJsonConverter().fromJson(
        json['updatedAt'] as String,
      ),
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
        json['deletedAt'],
        const MicrosecondDateTimeJsonConverter().fromJson,
      ),
      creatorUserId: json['creatorUserId'] as String?,
    );

Map<String, dynamic> _$SyncProductDtoToJson(_SyncProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'updatedAt': const MicrosecondDateTimeJsonConverter().toJson(
        instance.updatedAt,
      ),
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
        instance.deletedAt,
        const MicrosecondDateTimeJsonConverter().toJson,
      ),
      'creatorUserId': instance.creatorUserId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
