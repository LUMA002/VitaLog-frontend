// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellbeing_logs_dao.dart';

// ignore_for_file: type=lint
mixin _$WellbeingLogsDaoMixin on DatabaseAccessor<AppDatabase> {
  $WellbeingLogsTable get wellbeingLogs => attachedDatabase.wellbeingLogs;
  WellbeingLogsDaoManager get managers => WellbeingLogsDaoManager(this);
}

class WellbeingLogsDaoManager {
  final _$WellbeingLogsDaoMixin _db;
  WellbeingLogsDaoManager(this._db);
  $$WellbeingLogsTableTableManager get wellbeingLogs =>
      $$WellbeingLogsTableTableManager(_db.attachedDatabase, _db.wellbeingLogs);
}
