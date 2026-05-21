// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncCourseDto _$SyncCourseDtoFromJson(Map<String, dynamic> json) =>
    _SyncCourseDto(
      id: json['id'] as String,
      productId: json['productId'] as String,
      servingSize: const DecimalAsStringConverter().fromJson(
        json['servingSize'] as Object,
      ),
      timeOfDay: _timeOfDayFromJson(json['timeOfDay'] as String),
      startDate: _dateOnlyFromJson(json['startDate'] as String),
      endDate: _nullableDateOnlyFromJson(json['endDate'] as String?),
      updatedAt: const MicrosecondDateTimeJsonConverter().fromJson(
        json['updatedAt'] as String,
      ),
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
        json['deletedAt'],
        const MicrosecondDateTimeJsonConverter().fromJson,
      ),
    );

Map<String, dynamic> _$SyncCourseDtoToJson(
  _SyncCourseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'servingSize': const DecimalAsStringConverter().toJson(instance.servingSize),
  'timeOfDay': _timeOfDayToJson(instance.timeOfDay),
  'startDate': _dateOnlyToJson(instance.startDate),
  'endDate': _nullableDateOnlyToJson(instance.endDate),
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
