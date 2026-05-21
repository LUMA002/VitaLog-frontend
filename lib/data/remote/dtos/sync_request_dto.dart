import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/microsecond_datetime_json_converter.dart';
import 'sync_course_dto.dart';
import 'sync_intake_log_dto.dart';
import 'sync_product_dto.dart';
import 'sync_product_ingredient_dto.dart';

part 'sync_request_dto.freezed.dart';
part 'sync_request_dto.g.dart';

/// The full push payload for `POST /api/sync`.
///
/// JSON keys match the backend's `SyncRequest` positional record (PascalCase
/// via explicit `@JsonKey`). ASP.NET Core's `PropertyNameCaseInsensitive = true`
/// accepts these regardless of casing, so we follow the C# contract names for
/// grep-ability.
///
/// Backend validation limits each collection to [SyncLimits.MaxItemsPerEntity]
/// (2000) rows. Clients must chunk larger dirty sets across multiple sync cycles.
@freezed
sealed class SyncRequestDto with _$SyncRequestDto {
  const factory SyncRequestDto({
    @JsonKey(name: 'LastSyncAt')
    @MicrosecondDateTimeJsonConverter()
    required DateTime? lastSyncAt,
    @JsonKey(name: 'ClientTime')
    @MicrosecondDateTimeJsonConverter()
    required DateTime clientTime,
    @JsonKey(name: 'Products')
    required List<SyncProductDto> products,
    @JsonKey(name: 'ProductIngredients')
    required List<SyncProductIngredientDto> productIngredients,
    @JsonKey(name: 'Courses')
    required List<SyncCourseDto> courses,
    @JsonKey(name: 'IntakeLogs')
    required List<SyncIntakeLogDto> intakeLogs,
  }) = _SyncRequestDto;

  factory SyncRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SyncRequestDtoFromJson(json);
}
