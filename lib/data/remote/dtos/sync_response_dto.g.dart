// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncResponseDto _$SyncResponseDtoFromJson(
  Map<String, dynamic> json,
) => _SyncResponseDto(
  serverTime: const MicrosecondDateTimeJsonConverter().fromJson(
    json['serverTime'] as String,
  ),
  products: (json['products'] as List<dynamic>)
      .map((e) => SyncProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  productIngredients: (json['productIngredients'] as List<dynamic>)
      .map((e) => SyncProductIngredientDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  courses: (json['courses'] as List<dynamic>)
      .map((e) => SyncCourseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  intakeLogs: (json['intakeLogs'] as List<dynamic>)
      .map((e) => SyncIntakeLogDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  globalIngredients: (json['globalIngredients'] as List<dynamic>)
      .map((e) => SyncGlobalIngredientDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SyncResponseDtoToJson(_SyncResponseDto instance) =>
    <String, dynamic>{
      'serverTime': const MicrosecondDateTimeJsonConverter().toJson(
        instance.serverTime,
      ),
      'products': instance.products,
      'productIngredients': instance.productIngredients,
      'courses': instance.courses,
      'intakeLogs': instance.intakeLogs,
      'globalIngredients': instance.globalIngredients,
    };
