// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_product_ingredient_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncProductIngredientDto {

 String get id; String get productId; String? get ingredientId; String? get customIngredientName;@DecimalAsStringConverter() double get amount; String get unit;@MicrosecondDateTimeJsonConverter() DateTime get updatedAt;@MicrosecondDateTimeJsonConverter() DateTime? get deletedAt;
/// Create a copy of SyncProductIngredientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncProductIngredientDtoCopyWith<SyncProductIngredientDto> get copyWith => _$SyncProductIngredientDtoCopyWithImpl<SyncProductIngredientDto>(this as SyncProductIngredientDto, _$identity);

  /// Serializes this SyncProductIngredientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncProductIngredientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.customIngredientName, customIngredientName) || other.customIngredientName == customIngredientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,ingredientId,customIngredientName,amount,unit,updatedAt,deletedAt);

@override
String toString() {
  return 'SyncProductIngredientDto(id: $id, productId: $productId, ingredientId: $ingredientId, customIngredientName: $customIngredientName, amount: $amount, unit: $unit, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $SyncProductIngredientDtoCopyWith<$Res>  {
  factory $SyncProductIngredientDtoCopyWith(SyncProductIngredientDto value, $Res Function(SyncProductIngredientDto) _then) = _$SyncProductIngredientDtoCopyWithImpl;
@useResult
$Res call({
 String id, String productId, String? ingredientId, String? customIngredientName,@DecimalAsStringConverter() double amount, String unit,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt
});




}
/// @nodoc
class _$SyncProductIngredientDtoCopyWithImpl<$Res>
    implements $SyncProductIngredientDtoCopyWith<$Res> {
  _$SyncProductIngredientDtoCopyWithImpl(this._self, this._then);

  final SyncProductIngredientDto _self;
  final $Res Function(SyncProductIngredientDto) _then;

/// Create a copy of SyncProductIngredientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? ingredientId = freezed,Object? customIngredientName = freezed,Object? amount = null,Object? unit = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,ingredientId: freezed == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String?,customIngredientName: freezed == customIngredientName ? _self.customIngredientName : customIngredientName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncProductIngredientDto].
extension SyncProductIngredientDtoPatterns on SyncProductIngredientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncProductIngredientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncProductIngredientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncProductIngredientDto value)  $default,){
final _that = this;
switch (_that) {
case _SyncProductIngredientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncProductIngredientDto value)?  $default,){
final _that = this;
switch (_that) {
case _SyncProductIngredientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  String? ingredientId,  String? customIngredientName, @DecimalAsStringConverter()  double amount,  String unit, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncProductIngredientDto() when $default != null:
return $default(_that.id,_that.productId,_that.ingredientId,_that.customIngredientName,_that.amount,_that.unit,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  String? ingredientId,  String? customIngredientName, @DecimalAsStringConverter()  double amount,  String unit, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _SyncProductIngredientDto():
return $default(_that.id,_that.productId,_that.ingredientId,_that.customIngredientName,_that.amount,_that.unit,_that.updatedAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  String? ingredientId,  String? customIngredientName, @DecimalAsStringConverter()  double amount,  String unit, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _SyncProductIngredientDto() when $default != null:
return $default(_that.id,_that.productId,_that.ingredientId,_that.customIngredientName,_that.amount,_that.unit,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncProductIngredientDto implements SyncProductIngredientDto {
  const _SyncProductIngredientDto({required this.id, required this.productId, required this.ingredientId, required this.customIngredientName, @DecimalAsStringConverter() required this.amount, required this.unit, @MicrosecondDateTimeJsonConverter() required this.updatedAt, @MicrosecondDateTimeJsonConverter() required this.deletedAt});
  factory _SyncProductIngredientDto.fromJson(Map<String, dynamic> json) => _$SyncProductIngredientDtoFromJson(json);

@override final  String id;
@override final  String productId;
@override final  String? ingredientId;
@override final  String? customIngredientName;
@override@DecimalAsStringConverter() final  double amount;
@override final  String unit;
@override@MicrosecondDateTimeJsonConverter() final  DateTime updatedAt;
@override@MicrosecondDateTimeJsonConverter() final  DateTime? deletedAt;

/// Create a copy of SyncProductIngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncProductIngredientDtoCopyWith<_SyncProductIngredientDto> get copyWith => __$SyncProductIngredientDtoCopyWithImpl<_SyncProductIngredientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncProductIngredientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncProductIngredientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.customIngredientName, customIngredientName) || other.customIngredientName == customIngredientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,ingredientId,customIngredientName,amount,unit,updatedAt,deletedAt);

@override
String toString() {
  return 'SyncProductIngredientDto(id: $id, productId: $productId, ingredientId: $ingredientId, customIngredientName: $customIngredientName, amount: $amount, unit: $unit, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$SyncProductIngredientDtoCopyWith<$Res> implements $SyncProductIngredientDtoCopyWith<$Res> {
  factory _$SyncProductIngredientDtoCopyWith(_SyncProductIngredientDto value, $Res Function(_SyncProductIngredientDto) _then) = __$SyncProductIngredientDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String? ingredientId, String? customIngredientName,@DecimalAsStringConverter() double amount, String unit,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt
});




}
/// @nodoc
class __$SyncProductIngredientDtoCopyWithImpl<$Res>
    implements _$SyncProductIngredientDtoCopyWith<$Res> {
  __$SyncProductIngredientDtoCopyWithImpl(this._self, this._then);

  final _SyncProductIngredientDto _self;
  final $Res Function(_SyncProductIngredientDto) _then;

/// Create a copy of SyncProductIngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? ingredientId = freezed,Object? customIngredientName = freezed,Object? amount = null,Object? unit = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_SyncProductIngredientDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,ingredientId: freezed == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String?,customIngredientName: freezed == customIngredientName ? _self.customIngredientName : customIngredientName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
