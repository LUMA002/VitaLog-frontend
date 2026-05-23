// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncProductDto {

 String get id; String get name; String? get description;@MicrosecondDateTimeJsonConverter() DateTime get updatedAt;@MicrosecondDateTimeJsonConverter() DateTime? get deletedAt; String? get creatorUserId;
/// Create a copy of SyncProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncProductDtoCopyWith<SyncProductDto> get copyWith => _$SyncProductDtoCopyWithImpl<SyncProductDto>(this as SyncProductDto, _$identity);

  /// Serializes this SyncProductDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,updatedAt,deletedAt,creatorUserId);

@override
String toString() {
  return 'SyncProductDto(id: $id, name: $name, description: $description, updatedAt: $updatedAt, deletedAt: $deletedAt, creatorUserId: $creatorUserId)';
}


}

/// @nodoc
abstract mixin class $SyncProductDtoCopyWith<$Res>  {
  factory $SyncProductDtoCopyWith(SyncProductDto value, $Res Function(SyncProductDto) _then) = _$SyncProductDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt, String? creatorUserId
});




}
/// @nodoc
class _$SyncProductDtoCopyWithImpl<$Res>
    implements $SyncProductDtoCopyWith<$Res> {
  _$SyncProductDtoCopyWithImpl(this._self, this._then);

  final SyncProductDto _self;
  final $Res Function(SyncProductDto) _then;

/// Create a copy of SyncProductDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? updatedAt = null,Object? deletedAt = freezed,Object? creatorUserId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,creatorUserId: freezed == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncProductDto].
extension SyncProductDtoPatterns on SyncProductDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncProductDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncProductDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncProductDto value)  $default,){
final _that = this;
switch (_that) {
case _SyncProductDto():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncProductDto value)?  $default,){
final _that = this;
switch (_that) {
case _SyncProductDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt,  String? creatorUserId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncProductDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.updatedAt,_that.deletedAt,_that.creatorUserId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt,  String? creatorUserId)  $default,) {final _that = this;
switch (_that) {
case _SyncProductDto():
return $default(_that.id,_that.name,_that.description,_that.updatedAt,_that.deletedAt,_that.creatorUserId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt,  String? creatorUserId)?  $default,) {final _that = this;
switch (_that) {
case _SyncProductDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.updatedAt,_that.deletedAt,_that.creatorUserId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncProductDto implements SyncProductDto {
  const _SyncProductDto({required this.id, required this.name, required this.description, @MicrosecondDateTimeJsonConverter() required this.updatedAt, @MicrosecondDateTimeJsonConverter() required this.deletedAt, this.creatorUserId});
  factory _SyncProductDto.fromJson(Map<String, dynamic> json) => _$SyncProductDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override@MicrosecondDateTimeJsonConverter() final  DateTime updatedAt;
@override@MicrosecondDateTimeJsonConverter() final  DateTime? deletedAt;
@override final  String? creatorUserId;

/// Create a copy of SyncProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncProductDtoCopyWith<_SyncProductDto> get copyWith => __$SyncProductDtoCopyWithImpl<_SyncProductDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncProductDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.creatorUserId, creatorUserId) || other.creatorUserId == creatorUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,updatedAt,deletedAt,creatorUserId);

@override
String toString() {
  return 'SyncProductDto(id: $id, name: $name, description: $description, updatedAt: $updatedAt, deletedAt: $deletedAt, creatorUserId: $creatorUserId)';
}


}

/// @nodoc
abstract mixin class _$SyncProductDtoCopyWith<$Res> implements $SyncProductDtoCopyWith<$Res> {
  factory _$SyncProductDtoCopyWith(_SyncProductDto value, $Res Function(_SyncProductDto) _then) = __$SyncProductDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt, String? creatorUserId
});




}
/// @nodoc
class __$SyncProductDtoCopyWithImpl<$Res>
    implements _$SyncProductDtoCopyWith<$Res> {
  __$SyncProductDtoCopyWithImpl(this._self, this._then);

  final _SyncProductDto _self;
  final $Res Function(_SyncProductDto) _then;

/// Create a copy of SyncProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? updatedAt = null,Object? deletedAt = freezed,Object? creatorUserId = freezed,}) {
  return _then(_SyncProductDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,creatorUserId: freezed == creatorUserId ? _self.creatorUserId : creatorUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
