// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncRequestDto _$SyncRequestDtoFromJson(Map<String, dynamic> json) =>
    _SyncRequestDto(
      lastSyncAt: _$JsonConverterFromJson<String, DateTime>(
        json['LastSyncAt'],
        const MicrosecondDateTimeJsonConverter().fromJson,
      ),
      clientTime: const MicrosecondDateTimeJsonConverter().fromJson(
        json['ClientTime'] as String,
      ),
      products: (json['Products'] as List<dynamic>)
          .map((e) => SyncProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      productIngredients: (json['ProductIngredients'] as List<dynamic>)
          .map(
            (e) => SyncProductIngredientDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      courses: (json['Courses'] as List<dynamic>)
          .map((e) => SyncCourseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      intakeLogs: (json['IntakeLogs'] as List<dynamic>)
          .map((e) => SyncIntakeLogDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SyncRequestDtoToJson(_SyncRequestDto instance) =>
    <String, dynamic>{
      'LastSyncAt': _$JsonConverterToJson<String, DateTime>(
        instance.lastSyncAt,
        const MicrosecondDateTimeJsonConverter().toJson,
      ),
      'ClientTime': const MicrosecondDateTimeJsonConverter().toJson(
        instance.clientTime,
      ),
      'Products': instance.products,
      'ProductIngredients': instance.productIngredients,
      'Courses': instance.courses,
      'IntakeLogs': instance.intakeLogs,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
