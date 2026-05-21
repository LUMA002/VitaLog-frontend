// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_intake_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncIntakeLogDto _$SyncIntakeLogDtoFromJson(Map<String, dynamic> json) =>
    _SyncIntakeLogDto(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      actualServingSize: const DecimalAsStringConverter().fromJson(
        json['actualServingSize'] as Object,
      ),
      takenAt: const MicrosecondDateTimeJsonConverter().fromJson(
        json['takenAt'] as String,
      ),
      updatedAt: const MicrosecondDateTimeJsonConverter().fromJson(
        json['updatedAt'] as String,
      ),
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
        json['deletedAt'],
        const MicrosecondDateTimeJsonConverter().fromJson,
      ),
    );

Map<String, dynamic> _$SyncIntakeLogDtoToJson(
  _SyncIntakeLogDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'courseId': instance.courseId,
  'actualServingSize': const DecimalAsStringConverter().toJson(
    instance.actualServingSize,
  ),
  'takenAt': const MicrosecondDateTimeJsonConverter().toJson(instance.takenAt),
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
