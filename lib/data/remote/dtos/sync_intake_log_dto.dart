import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/decimal_as_string_converter.dart';
import '../converters/microsecond_datetime_json_converter.dart';

part 'sync_intake_log_dto.freezed.dart';
part 'sync_intake_log_dto.g.dart';

/// Wire representation of an [IntakeLog] in the `/api/sync` payload.
///
/// JSON contract:
/// ```json
/// {
///   "id": "uuid",
///   "courseId": "uuid",
///   "actualServingSize": "1.000000",
///   "takenAt": "2026-05-17T07:30:00.000000Z",
///   "updatedAt": "2026-05-17T07:30:01.123456Z",
///   "deletedAt": null
/// }
/// ```
///
/// Note: `userId` is intentionally absent — the server injects it from the JWT.
@freezed
sealed class SyncIntakeLogDto with _$SyncIntakeLogDto {
  const factory SyncIntakeLogDto({
    required String id,
    required String courseId,
    @DecimalAsStringConverter() required double actualServingSize,
    @MicrosecondDateTimeJsonConverter() required DateTime takenAt,
    @MicrosecondDateTimeJsonConverter() required DateTime updatedAt,
    @MicrosecondDateTimeJsonConverter() required DateTime? deletedAt,
  }) = _SyncIntakeLogDto;

  factory SyncIntakeLogDto.fromJson(Map<String, dynamic> json) =>
      _$SyncIntakeLogDtoFromJson(json);
}
