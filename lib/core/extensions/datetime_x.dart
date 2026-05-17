extension DateTimeX on DateTime {
  int toUtcMicros() {
    assert(isUtc, 'DateTime must be UTC before converting to microseconds.');
    return microsecondsSinceEpoch;
  }

  /// ISO-8601 with 6 fractional digits, always UTC (Z suffix).
  String toIso8601_6() => toUtc().toIso8601String();
}

extension DateTimeIntX on int {
  DateTime fromUtcMicros() =>
      DateTime.fromMicrosecondsSinceEpoch(this, isUtc: true);
}
