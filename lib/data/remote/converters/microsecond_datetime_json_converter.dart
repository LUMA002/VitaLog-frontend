import 'package:json_annotation/json_annotation.dart';

/// JSON converter for [DateTime] that guarantees exactly 6 fractional-second
/// digits on the wire (e.g. `2026-05-17T13:12:00.123456Z`).
///
/// Why custom and not [DateTime.toIso8601String]:
///   Dart may omit trailing zeros (e.g. `…T13:00:00.000000Z` → `…T13:00:00Z`)
///   which would break the backend's `MicrosecondPrecisionTimeProvider`
///   round-trip validation that always expects 6-digit precision.
///
/// Always asserts UTC — [fromJson] calls `.toUtc()` to normalise any offset.
class MicrosecondDateTimeJsonConverter
    implements JsonConverter<DateTime, String> {
  const MicrosecondDateTimeJsonConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toUtc();

  /// Emits `yyyy-MM-ddTHH:mm:ss.ffffffZ` — exactly 6 fractional digits, Z
  /// suffix to satisfy the backend's `IsUtc` (Offset == TimeSpan.Zero) check.
  @override
  String toJson(DateTime object) {
    final utc = object.toUtc();
    final y = utc.year.toString().padLeft(4, '0');
    final mo = utc.month.toString().padLeft(2, '0');
    final d = utc.day.toString().padLeft(2, '0');
    final h = utc.hour.toString().padLeft(2, '0');
    final mi = utc.minute.toString().padLeft(2, '0');
    final s = utc.second.toString().padLeft(2, '0');
    // Combine milliseconds (ms) and sub-millisecond microseconds (us) into
    // a 6-digit zero-padded fractional second.
    final frac =
        (utc.millisecond * 1000 + utc.microsecond).toString().padLeft(6, '0');
    return '$y-$mo-${d}T$h:$mi:$s.${frac}Z';
  }
}
