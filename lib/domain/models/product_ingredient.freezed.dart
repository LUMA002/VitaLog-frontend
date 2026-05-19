// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductIngredient {

 String get id; String get productId; String? get ingredientId; String? get customIngredientName; double get amount; String get unit; DateTime get updatedAtUtc; DateTime? get deletedAtUtc;
/// Create a copy of ProductIngredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductIngredientCopyWith<ProductIngredient> get copyWith => _$ProductIngredientCopyWithImpl<ProductIngredient>(this as ProductIngredient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.customIngredientName, customIngredientName) || other.customIngredientName == customIngredientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.updatedAtUtc, updatedAtUtc) || other.updatedAtUtc == updatedAtUtc)&&(identical(other.deletedAtUtc, deletedAtUtc) || other.deletedAtUtc == deletedAtUtc));
}


@override
int get hashCode => Object.hash(runtimeType,id,productId,ingredientId,customIngredientName,amount,unit,updatedAtUtc,deletedAtUtc);

@override
String toString() {
  return 'ProductIngredient(id: $id, productId: $productId, ingredientId: $ingredientId, customIngredientName: $customIngredientName, amount: $amount, unit: $unit, updatedAtUtc: $updatedAtUtc, deletedAtUtc: $deletedAtUtc)';
}


}

/// @nodoc
abstract mixin class $ProductIngredientCopyWith<$Res>  {
  factory $ProductIngredientCopyWith(ProductIngredient value, $Res Function(ProductIngredient) _then) = _$ProductIngredientCopyWithImpl;
@useResult
$Res call({
 String id, String productId, String? ingredientId, String? customIngredientName, double amount, String unit, DateTime updatedAtUtc, DateTime? deletedAtUtc
});




}
/// @nodoc
class _$ProductIngredientCopyWithImpl<$Res>
    implements $ProductIngredientCopyWith<$Res> {
  _$ProductIngredientCopyWithImpl(this._self, this._then);

  final ProductIngredient _self;
  final $Res Function(ProductIngredient) _then;

/// Create a copy of ProductIngredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? ingredientId = freezed,Object? customIngredientName = freezed,Object? amount = null,Object? unit = null,Object? updatedAtUtc = null,Object? deletedAtUtc = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,ingredientId: freezed == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String?,customIngredientName: freezed == customIngredientName ? _self.customIngredientName : customIngredientName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,updatedAtUtc: null == updatedAtUtc ? _self.updatedAtUtc : updatedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAtUtc: freezed == deletedAtUtc ? _self.deletedAtUtc : deletedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductIngredient].
extension ProductIngredientPatterns on ProductIngredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductIngredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductIngredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductIngredient value)  $default,){
final _that = this;
switch (_that) {
case _ProductIngredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductIngredient value)?  $default,){
final _that = this;
switch (_that) {
case _ProductIngredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  String? ingredientId,  String? customIngredientName,  double amount,  String unit,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductIngredient() when $default != null:
return $default(_that.id,_that.productId,_that.ingredientId,_that.customIngredientName,_that.amount,_that.unit,_that.updatedAtUtc,_that.deletedAtUtc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  String? ingredientId,  String? customIngredientName,  double amount,  String unit,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)  $default,) {final _that = this;
switch (_that) {
case _ProductIngredient():
return $default(_that.id,_that.productId,_that.ingredientId,_that.customIngredientName,_that.amount,_that.unit,_that.updatedAtUtc,_that.deletedAtUtc);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  String? ingredientId,  String? customIngredientName,  double amount,  String unit,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)?  $default,) {final _that = this;
switch (_that) {
case _ProductIngredient() when $default != null:
return $default(_that.id,_that.productId,_that.ingredientId,_that.customIngredientName,_that.amount,_that.unit,_that.updatedAtUtc,_that.deletedAtUtc);case _:
  return null;

}
}

}

/// @nodoc


class _ProductIngredient implements ProductIngredient {
  const _ProductIngredient({required this.id, required this.productId, required this.ingredientId, required this.customIngredientName, required this.amount, required this.unit, required this.updatedAtUtc, required this.deletedAtUtc});
  

@override final  String id;
@override final  String productId;
@override final  String? ingredientId;
@override final  String? customIngredientName;
@override final  double amount;
@override final  String unit;
@override final  DateTime updatedAtUtc;
@override final  DateTime? deletedAtUtc;

/// Create a copy of ProductIngredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductIngredientCopyWith<_ProductIngredient> get copyWith => __$ProductIngredientCopyWithImpl<_ProductIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.ingredientId, ingredientId) || other.ingredientId == ingredientId)&&(identical(other.customIngredientName, customIngredientName) || other.customIngredientName == customIngredientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.updatedAtUtc, updatedAtUtc) || other.updatedAtUtc == updatedAtUtc)&&(identical(other.deletedAtUtc, deletedAtUtc) || other.deletedAtUtc == deletedAtUtc));
}


@override
int get hashCode => Object.hash(runtimeType,id,productId,ingredientId,customIngredientName,amount,unit,updatedAtUtc,deletedAtUtc);

@override
String toString() {
  return 'ProductIngredient(id: $id, productId: $productId, ingredientId: $ingredientId, customIngredientName: $customIngredientName, amount: $amount, unit: $unit, updatedAtUtc: $updatedAtUtc, deletedAtUtc: $deletedAtUtc)';
}


}

/// @nodoc
abstract mixin class _$ProductIngredientCopyWith<$Res> implements $ProductIngredientCopyWith<$Res> {
  factory _$ProductIngredientCopyWith(_ProductIngredient value, $Res Function(_ProductIngredient) _then) = __$ProductIngredientCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String? ingredientId, String? customIngredientName, double amount, String unit, DateTime updatedAtUtc, DateTime? deletedAtUtc
});




}
/// @nodoc
class __$ProductIngredientCopyWithImpl<$Res>
    implements _$ProductIngredientCopyWith<$Res> {
  __$ProductIngredientCopyWithImpl(this._self, this._then);

  final _ProductIngredient _self;
  final $Res Function(_ProductIngredient) _then;

/// Create a copy of ProductIngredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? ingredientId = freezed,Object? customIngredientName = freezed,Object? amount = null,Object? unit = null,Object? updatedAtUtc = null,Object? deletedAtUtc = freezed,}) {
  return _then(_ProductIngredient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,ingredientId: freezed == ingredientId ? _self.ingredientId : ingredientId // ignore: cast_nullable_to_non_nullable
as String?,customIngredientName: freezed == customIngredientName ? _self.customIngredientName : customIngredientName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,updatedAtUtc: null == updatedAtUtc ? _self.updatedAtUtc : updatedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAtUtc: freezed == deletedAtUtc ? _self.deletedAtUtc : deletedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
