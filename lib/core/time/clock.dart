abstract interface class Clock {
  DateTime nowUtc();
}

final class SystemClock implements Clock {
  const SystemClock();

  @override
  DateTime nowUtc() => DateTime.now().toUtc();
}

final class TestClock implements Clock {
  TestClock(this._fixed);

  DateTime _fixed;

  void advance(Duration duration) => _fixed = _fixed.add(duration);

  @override
  DateTime nowUtc() => _fixed.toUtc();
}
