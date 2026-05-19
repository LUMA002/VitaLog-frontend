import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

/// A supplement product acting as a container for [ProductIngredient]s.
///
/// [creatorUserId] is null for global (server-seeded) products and for
/// guest-created drafts before the claim flow runs on first login.
///
/// [isLocalDraft] is the authoritative flag for the claim flow:
///   - `true`  → created offline by this client; claim on first login.
///   - `false` → fetched from the server; never claim.
///
/// No [fromJson]/[toJson] — serialization lives in DTOs (Phase 5).
@freezed
sealed class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String? description,
    required String? creatorUserId,
    required bool isLocalDraft,
    required DateTime updatedAtUtc,
    required DateTime? deletedAtUtc,
  }) = _Product;
}
