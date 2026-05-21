import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/microsecond_datetime_json_converter.dart';
import 'sync_course_dto.dart';
import 'sync_global_ingredient_dto.dart';
import 'sync_intake_log_dto.dart';
import 'sync_product_dto.dart';
import 'sync_product_ingredient_dto.dart';

part 'sync_response_dto.freezed.dart';
part 'sync_response_dto.g.dart';

/// Deserialized payload from `POST /api/sync` — the server's canonical state.
///
/// [serverTime] is the single authoritative timestamp stamped on every ACK'd
/// row. The client MUST persist it as `lastSyncAt` in [SyncMeta] and use it
/// as `LastSyncAt` in the next request (not [clientTime]).
///
/// JSON contract (camelCase — ASP.NET Core `JsonNamingPolicy.CamelCase`):
/// ```json
/// {
///   "serverTime": "2026-05-17T13:12:00.123456Z",
///   "products": [...],
///   "productIngredients": [...],
///   "courses": [...],
///   "intakeLogs": [...],
///   "globalIngredients": [...]
/// }
/// ```
@freezed
sealed class SyncResponseDto with _$SyncResponseDto {
  const factory SyncResponseDto({
    @MicrosecondDateTimeJsonConverter() required DateTime serverTime,
    required List<SyncProductDto> products,
    required List<SyncProductIngredientDto> productIngredients,
    required List<SyncCourseDto> courses,
    required List<SyncIntakeLogDto> intakeLogs,
    required List<SyncGlobalIngredientDto> globalIngredients,
  }) = _SyncResponseDto;

  factory SyncResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SyncResponseDtoFromJson(json);
}
