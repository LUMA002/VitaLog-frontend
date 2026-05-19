import 'package:drift/drift.dart';

import '../../../data/local/app_database.dart';
import '../../../domain/models/product.dart';

/// Maps between the Drift-generated [ProductsData] row and the [Product] domain model.
///
/// [isLocalDraft] is stored as INTEGER (0/1) in SQLite and mapped to [bool] here.
extension ProductDriftX on ProductsData {
  Product toDomain() => Product(
    id: id,
    name: name,
    description: description,
    creatorUserId: creatorUserId,
    isLocalDraft: isLocalDraft == 1,
    updatedAtUtc: updatedAt,
    deletedAtUtc: deletedAt,
  );
}

extension ProductDomainX on Product {
  ProductsCompanion toDrift({required int pendingSync}) => ProductsCompanion(
    id: Value(id),
    name: Value(name),
    description: Value(description),
    creatorUserId: Value(creatorUserId),
    isLocalDraft: Value(isLocalDraft ? 1 : 0),
    updatedAt: Value(updatedAtUtc),
    deletedAt: Value(deletedAtUtc),
    pendingSync: Value(pendingSync),
  );
}
