import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/decimal_as_string_converter.dart';
import '../converters/microsecond_datetime_json_converter.dart';

part 'sync_course_dto.freezed.dart';
part 'sync_course_dto.g.dart';

// ── Private JSON helpers ──────────────────────────────────────────────────────

/// Parses `"HH:mm:ss"` (C# `TimeOnly` wire format) into a [Duration].
Duration _timeOfDayFromJson(String value) {
  final parts = value.split(':');
  return Duration(
    hours: int.parse(parts[0]),
    minutes: int.parse(parts[1]),
    seconds: int.parse(parts[2]),
  );
}

/// Serialises a [Duration] to `"HH:mm:ss"`.
String _timeOfDayToJson(Duration value) {
  final totalSeconds = value.inSeconds;
  final h = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
  final m = ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
  final s = (totalSeconds % 60).toString().padLeft(2, '0');
  return '$h:$m:$s';
}

/// Parses `"yyyy-MM-dd"` (C# `DateOnly` wire format) to a UTC midnight [DateTime].
DateTime _dateOnlyFromJson(String value) {
  final parts = value.split('-');
  return DateTime.utc(
    int.parse(parts[0]),
    int.parse(parts[1]),
    int.parse(parts[2]),
  );
}

/// Serialises a [DateTime] (UTC midnight assumed) to `"yyyy-MM-dd"`.
String _dateOnlyToJson(DateTime value) {
  final utc = value.toUtc();
  final y = utc.year.toString().padLeft(4, '0');
  final m = utc.month.toString().padLeft(2, '0');
  final d = utc.day.toString().padLeft(2, '0');
  return '$y-$m-$d';
}

DateTime? _nullableDateOnlyFromJson(String? value) =>
    value == null ? null : _dateOnlyFromJson(value);

String? _nullableDateOnlyToJson(DateTime? value) =>
    value == null ? null : _dateOnlyToJson(value);

// ── DTO ───────────────────────────────────────────────────────────────────────

/// Wire representation of a [Course] in the `/api/sync` payload.
///
/// JSON contract:
/// ```json
/// {
///   "id": "uuid",
///   "productId": "uuid",
///   "servingSize": "2.000000",
///   "timeOfDay": "08:00:00",
///   "startDate": "2026-05-17",
///   "endDate": null,
///   "updatedAt": "2026-05-17T13:12:00.123456Z",
///   "deletedAt": null
/// }
/// ```
///
/// Note: `userId` is intentionally absent — the server injects it from the JWT
/// and never transmits it back.
@freezed
sealed class SyncCourseDto with _$SyncCourseDto {
  const factory SyncCourseDto({
    required String id,
    required String productId,
    @DecimalAsStringConverter() required double servingSize,
    @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
    required Duration timeOfDay,
    @JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson)
    required DateTime startDate,
    @JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson)
    required DateTime? endDate,
    @MicrosecondDateTimeJsonConverter() required DateTime updatedAt,
    @MicrosecondDateTimeJsonConverter() required DateTime? deletedAt,
  }) = _SyncCourseDto;

  factory SyncCourseDto.fromJson(Map<String, dynamic> json) =>
      _$SyncCourseDtoFromJson(json);
}
