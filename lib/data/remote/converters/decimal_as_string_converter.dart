import 'package:json_annotation/json_annotation.dart';

/// JSON converter that serialises Dart [double] ↔ JSON string representation.
///
/// **Why string and not raw number?**
/// Dart's `jsonEncode` can emit scientific notation for very small floats
/// (e.g. `1e-5`), which C# `decimal` deserialisation rejects. Using a fixed
/// 6-decimal-place string (`"0.000010"`) is accepted by ASP.NET Core's default
/// `JsonSerializerDefaults.Web` options which include
/// `NumberHandling = AllowReadingFromString`.
///
/// **fromJson** accepts both `num` (server responses send JSON numbers) and
/// `String` (round-trips through our own toJson).
class DecimalAsStringConverter implements JsonConverter<double, Object> {
  const DecimalAsStringConverter();

  @override
  double fromJson(Object json) {
    if (json is num) return json.toDouble();
    if (json is String) return double.parse(json);
    throw FormatException('Cannot parse decimal from JSON value: $json');
  }

  /// Emits `num.toStringAsFixed(6)` — e.g. `"2.500000"` — which prevents
  /// scientific notation for any value ≥ 1e-6 and satisfies the backend's
  /// `> 0` constraint validators.
  @override
  String toJson(double value) => value.toStringAsFixed(6);
}
