import 'package:drift/drift.dart';

/// Stores [DateTime] as INTEGER microsecondsSinceEpoch in SQLite.
///
/// This gives us bit-exact parity with PostgreSQL `timestamptz` (6-digit
/// fractional seconds) and keeps True-LWW comparisons to fast integer ops.
/// JSON serialization uses ISO-8601 with the `Z` suffix (always UTC).
///
/// IMPORTANT: [toSql] asserts that the value is UTC. Every [DateTime] that
/// enters the persistence layer MUST be UTC — this is the single enforcement
/// chokepoint for the "all DateTime in app is UTC" rule.
class MicrosecondDateTimeConverter extends TypeConverter<DateTime, int>
    with JsonTypeConverter2<DateTime, int, String> {
  const MicrosecondDateTimeConverter();

  @override
  DateTime fromSql(int fromDb) =>
      DateTime.fromMicrosecondsSinceEpoch(fromDb, isUtc: true);

  @override
  int toSql(DateTime value) {
    assert(value.isUtc, 'DateTime must be UTC before persisting.');
    return value.microsecondsSinceEpoch;
  }

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toUtc();

  /// Dart already emits 6 fractional digits for UTC [DateTime], producing the
  /// `Z`-suffixed ISO-8601 string the backend's `IsUtc` validator expects.
  @override
  String toJson(DateTime value) => value.toUtc().toIso8601String();
}
