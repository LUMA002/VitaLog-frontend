import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/microsecond_datetime_json_converter.dart';

part 'sync_product_dto.freezed.dart';
part 'sync_product_dto.g.dart';

/// Wire representation of a [Product] in the `/api/sync` payload.
///
/// JSON contract (camelCase, as sent by ASP.NET Core `JsonSerializerDefaults.Web`):
/// ```json
/// {
///   "id": "uuid-v4",
///   "name": "Opti-Men",
///   "description": null,
///   "updatedAt": "2026-05-17T13:12:00.123456Z",
///   "deletedAt": null
/// }
/// ```
///
/// Note: `creatorUserId` is omitted on push - the server injects ownership on upsert.
/// It is included in sync *responses* so clients can distinguish global vs custom
/// products after a cross-device pull.
@freezed
sealed class SyncProductDto with _$SyncProductDto {
  const factory SyncProductDto({
    required String id,
    required String name,
    required String? description,
    @MicrosecondDateTimeJsonConverter() required DateTime updatedAt,
    @MicrosecondDateTimeJsonConverter() required DateTime? deletedAt,
    String? creatorUserId,
  }) = _SyncProductDto;

  factory SyncProductDto.fromJson(Map<String, dynamic> json) =>
      _$SyncProductDtoFromJson(json);
}
