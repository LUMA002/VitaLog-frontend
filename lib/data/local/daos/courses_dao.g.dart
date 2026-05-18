// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_dao.dart';

// ignore_for_file: type=lint
mixin _$CoursesDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductsTable get products => attachedDatabase.products;
  $CoursesTable get courses => attachedDatabase.courses;
  $IntakeLogsTable get intakeLogs => attachedDatabase.intakeLogs;
  CoursesDaoManager get managers => CoursesDaoManager(this);
}

class CoursesDaoManager {
  final _$CoursesDaoMixin _db;
  CoursesDaoManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$CoursesTableTableManager get courses =>
      $$CoursesTableTableManager(_db.attachedDatabase, _db.courses);
  $$IntakeLogsTableTableManager get intakeLogs =>
      $$IntakeLogsTableTableManager(_db.attachedDatabase, _db.intakeLogs);
}
