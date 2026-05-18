import 'package:drift/drift.dart';

import 'products_table.dart';
import 'syncable.dart';

/// A user's scheduled supplement course.
///
/// Dates are stored as INTEGER **epoch-days** (UTC) — `millisecondsSinceEpoch
/// ~/ 86400000` — so a full midnight UTC timestamp is not needed for date-only
/// comparisons. [timeOfDay] is seconds since midnight (0..86399), mirroring
/// the backend's `TimeOnly` type.
///
/// [userId] is NULL while the app is in Guest mode. [DataClaimUseCase] stamps
/// it with the real user ID on first login.
@DataClassName('CoursesData')
class Courses extends Table with Syncable {
  /// NULL in guest mode; stamped on login via DataClaimUseCase.
  TextColumn get userId => text().nullable()();

  TextColumn get productId => text().references(Products, #id)();

  /// Number of servings per intake. Must be > 0.
  RealColumn get servingSize =>
      real().customConstraint('NOT NULL CHECK (serving_size > 0)')();

  /// Seconds since midnight UTC (0 – 86 399). Mirrors backend `TimeOnly`.
  IntColumn get timeOfDay => integer()
      .customConstraint('NOT NULL CHECK (time_of_day BETWEEN 0 AND 86399)')();

  /// Epoch-days UTC (millisecondsSinceEpoch ~/ 86_400_000).
  IntColumn get startDate => integer()();

  /// NULL = open-ended course. Must be >= [startDate] when set.
  IntColumn get endDate => integer().nullable().customConstraint(
      'NULL CHECK (end_date IS NULL OR end_date >= start_date)')();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
