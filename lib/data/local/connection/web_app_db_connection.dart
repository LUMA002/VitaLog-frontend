import 'package:drift/drift.dart';

/// Web stub - the Thin Client has no local SQLite database.
QueryExecutor openAppDatabase() =>
    throw UnsupportedError('SQLite database is not available on Web.');
