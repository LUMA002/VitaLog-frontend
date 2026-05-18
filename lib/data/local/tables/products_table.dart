import 'package:drift/drift.dart';

import 'syncable.dart';

/// Local mirror of the backend `Products` table.
///
/// [creatorUserId] is NULL for global (server-seeded) products and for
/// guest-created drafts. The [isLocalDraft] flag is the authoritative signal
/// for the "claim" flow: only rows with `isLocalDraft = 1` are stamped with
/// the authenticated userId on first login (see `DataClaimUseCase`).
@DataClassName('ProductsData')
class Products extends Table with Syncable {
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();

  /// NULL  = global product (server-seeded, no owner).
  /// Guest = NULL until claimed via [DataClaimUseCase].
  TextColumn get creatorUserId => text().nullable()();

  /// 1 = created locally (offline/guest). 0 = fetched from server.
  /// This distinguishes guest-created products from cached global products
  /// that also have a NULL [creatorUserId].
  IntColumn get isLocalDraft =>
      integer().withDefault(const Constant(0))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
