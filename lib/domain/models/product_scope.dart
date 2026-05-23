import 'product.dart';

extension ProductScopeX on Product {
  bool get isGlobalProduct =>
      creatorUserId == null && !isLocalDraft;

  bool get isCustomProduct =>
      creatorUserId != null || isLocalDraft;
}
