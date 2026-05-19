// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GlobalIngredient {

 String get id; String get name; String get defaultUnit; IngredientCategory get category; DateTime get updatedAtUtc; DateTime? get deletedAtUtc;
/// Create a copy of GlobalIngredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalIngredientCopyWith<GlobalIngredient> get copyWith => _$GlobalIngredientCopyWithImpl<GlobalIngredient>(this as GlobalIngredient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultUnit, defaultUnit) || other.defaultUnit == defaultUnit)&&(identical(other.category, category) || other.category == category)&&(identical(other.updatedAtUtc, updatedAtUtc) || other.updatedAtUtc == updatedAtUtc)&&(identical(other.deletedAtUtc, deletedAtUtc) || other.deletedAtUtc == deletedAtUtc));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,defaultUnit,category,updatedAtUtc,deletedAtUtc);

@override
String toString() {
  return 'GlobalIngredient(id: $id, name: $name, defaultUnit: $defaultUnit, category: $category, updatedAtUtc: $updatedAtUtc, deletedAtUtc: $deletedAtUtc)';
}


}

/// @nodoc
abstract mixin class $GlobalIngredientCopyWith<$Res>  {
  factory $GlobalIngredientCopyWith(GlobalIngredient value, $Res Function(GlobalIngredient) _then) = _$GlobalIngredientCopyWithImpl;
@useResult
$Res call({
 String id, String name, String defaultUnit, IngredientCategory category, DateTime updatedAtUtc, DateTime? deletedAtUtc
});




}
/// @nodoc
class _$GlobalIngredientCopyWithImpl<$Res>
    implements $GlobalIngredientCopyWith<$Res> {
  _$GlobalIngredientCopyWithImpl(this._self, this._then);

  final GlobalIngredient _self;
  final $Res Function(GlobalIngredient) _then;

/// Create a copy of GlobalIngredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? defaultUnit = null,Object? category = null,Object? updatedAtUtc = null,Object? deletedAtUtc = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,defaultUnit: null == defaultUnit ? _self.defaultUnit : defaultUnit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IngredientCategory,updatedAtUtc: null == updatedAtUtc ? _self.updatedAtUtc : updatedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAtUtc: freezed == deletedAtUtc ? _self.deletedAtUtc : deletedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GlobalIngredient].
extension GlobalIngredientPatterns on GlobalIngredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GlobalIngredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GlobalIngredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GlobalIngredient value)  $default,){
final _that = this;
switch (_that) {
case _GlobalIngredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GlobalIngredient value)?  $default,){
final _that = this;
switch (_that) {
case _GlobalIngredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String defaultUnit,  IngredientCategory category,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GlobalIngredient() when $default != null:
return $default(_that.id,_that.name,_that.defaultUnit,_that.category,_that.updatedAtUtc,_that.deletedAtUtc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String defaultUnit,  IngredientCategory category,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)  $default,) {final _that = this;
switch (_that) {
case _GlobalIngredient():
return $default(_that.id,_that.name,_that.defaultUnit,_that.category,_that.updatedAtUtc,_that.deletedAtUtc);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String defaultUnit,  IngredientCategory category,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)?  $default,) {final _that = this;
switch (_that) {
case _GlobalIngredient() when $default != null:
return $default(_that.id,_that.name,_that.defaultUnit,_that.category,_that.updatedAtUtc,_that.deletedAtUtc);case _:
  return null;

}
}

}

/// @nodoc


class _GlobalIngredient implements GlobalIngredient {
  const _GlobalIngredient({required this.id, required this.name, required this.defaultUnit, required this.category, required this.updatedAtUtc, required this.deletedAtUtc});
  

@override final  String id;
@override final  String name;
@override final  String defaultUnit;
@override final  IngredientCategory category;
@override final  DateTime updatedAtUtc;
@override final  DateTime? deletedAtUtc;

/// Create a copy of GlobalIngredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalIngredientCopyWith<_GlobalIngredient> get copyWith => __$GlobalIngredientCopyWithImpl<_GlobalIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalIngredient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultUnit, defaultUnit) || other.defaultUnit == defaultUnit)&&(identical(other.category, category) || other.category == category)&&(identical(other.updatedAtUtc, updatedAtUtc) || other.updatedAtUtc == updatedAtUtc)&&(identical(other.deletedAtUtc, deletedAtUtc) || other.deletedAtUtc == deletedAtUtc));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,defaultUnit,category,updatedAtUtc,deletedAtUtc);

@override
String toString() {
  return 'GlobalIngredient(id: $id, name: $name, defaultUnit: $defaultUnit, category: $category, updatedAtUtc: $updatedAtUtc, deletedAtUtc: $deletedAtUtc)';
}


}

/// @nodoc
abstract mixin class _$GlobalIngredientCopyWith<$Res> implements $GlobalIngredientCopyWith<$Res> {
  factory _$GlobalIngredientCopyWith(_GlobalIngredient value, $Res Function(_GlobalIngredient) _then) = __$GlobalIngredientCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String defaultUnit, IngredientCategory category, DateTime updatedAtUtc, DateTime? deletedAtUtc
});




}
/// @nodoc
class __$GlobalIngredientCopyWithImpl<$Res>
    implements _$GlobalIngredientCopyWith<$Res> {
  __$GlobalIngredientCopyWithImpl(this._self, this._then);

  final _GlobalIngredient _self;
  final $Res Function(_GlobalIngredient) _then;

/// Create a copy of GlobalIngredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? defaultUnit = null,Object? category = null,Object? updatedAtUtc = null,Object? deletedAtUtc = freezed,}) {
  return _then(_GlobalIngredient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,defaultUnit: null == defaultUnit ? _self.defaultUnit : defaultUnit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IngredientCategory,updatedAtUtc: null == updatedAtUtc ? _self.updatedAtUtc : updatedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAtUtc: freezed == deletedAtUtc ? _self.deletedAtUtc : deletedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
