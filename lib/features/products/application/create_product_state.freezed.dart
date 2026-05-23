// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IngredientFormEntry {

 GlobalIngredient? get globalIngredient; String? get customName; double get amount; String get unit;
/// Create a copy of IngredientFormEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientFormEntryCopyWith<IngredientFormEntry> get copyWith => _$IngredientFormEntryCopyWithImpl<IngredientFormEntry>(this as IngredientFormEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientFormEntry&&(identical(other.globalIngredient, globalIngredient) || other.globalIngredient == globalIngredient)&&(identical(other.customName, customName) || other.customName == customName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,globalIngredient,customName,amount,unit);

@override
String toString() {
  return 'IngredientFormEntry(globalIngredient: $globalIngredient, customName: $customName, amount: $amount, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $IngredientFormEntryCopyWith<$Res>  {
  factory $IngredientFormEntryCopyWith(IngredientFormEntry value, $Res Function(IngredientFormEntry) _then) = _$IngredientFormEntryCopyWithImpl;
@useResult
$Res call({
 GlobalIngredient? globalIngredient, String? customName, double amount, String unit
});


$GlobalIngredientCopyWith<$Res>? get globalIngredient;

}
/// @nodoc
class _$IngredientFormEntryCopyWithImpl<$Res>
    implements $IngredientFormEntryCopyWith<$Res> {
  _$IngredientFormEntryCopyWithImpl(this._self, this._then);

  final IngredientFormEntry _self;
  final $Res Function(IngredientFormEntry) _then;

/// Create a copy of IngredientFormEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? globalIngredient = freezed,Object? customName = freezed,Object? amount = null,Object? unit = null,}) {
  return _then(_self.copyWith(
globalIngredient: freezed == globalIngredient ? _self.globalIngredient : globalIngredient // ignore: cast_nullable_to_non_nullable
as GlobalIngredient?,customName: freezed == customName ? _self.customName : customName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of IngredientFormEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GlobalIngredientCopyWith<$Res>? get globalIngredient {
    if (_self.globalIngredient == null) {
    return null;
  }

  return $GlobalIngredientCopyWith<$Res>(_self.globalIngredient!, (value) {
    return _then(_self.copyWith(globalIngredient: value));
  });
}
}


/// Adds pattern-matching-related methods to [IngredientFormEntry].
extension IngredientFormEntryPatterns on IngredientFormEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientFormEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientFormEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientFormEntry value)  $default,){
final _that = this;
switch (_that) {
case _IngredientFormEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientFormEntry value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientFormEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GlobalIngredient? globalIngredient,  String? customName,  double amount,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientFormEntry() when $default != null:
return $default(_that.globalIngredient,_that.customName,_that.amount,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GlobalIngredient? globalIngredient,  String? customName,  double amount,  String unit)  $default,) {final _that = this;
switch (_that) {
case _IngredientFormEntry():
return $default(_that.globalIngredient,_that.customName,_that.amount,_that.unit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GlobalIngredient? globalIngredient,  String? customName,  double amount,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _IngredientFormEntry() when $default != null:
return $default(_that.globalIngredient,_that.customName,_that.amount,_that.unit);case _:
  return null;

}
}

}

/// @nodoc


class _IngredientFormEntry implements IngredientFormEntry {
  const _IngredientFormEntry({this.globalIngredient, this.customName, required this.amount, required this.unit});
  

@override final  GlobalIngredient? globalIngredient;
@override final  String? customName;
@override final  double amount;
@override final  String unit;

/// Create a copy of IngredientFormEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientFormEntryCopyWith<_IngredientFormEntry> get copyWith => __$IngredientFormEntryCopyWithImpl<_IngredientFormEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientFormEntry&&(identical(other.globalIngredient, globalIngredient) || other.globalIngredient == globalIngredient)&&(identical(other.customName, customName) || other.customName == customName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,globalIngredient,customName,amount,unit);

@override
String toString() {
  return 'IngredientFormEntry(globalIngredient: $globalIngredient, customName: $customName, amount: $amount, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$IngredientFormEntryCopyWith<$Res> implements $IngredientFormEntryCopyWith<$Res> {
  factory _$IngredientFormEntryCopyWith(_IngredientFormEntry value, $Res Function(_IngredientFormEntry) _then) = __$IngredientFormEntryCopyWithImpl;
@override @useResult
$Res call({
 GlobalIngredient? globalIngredient, String? customName, double amount, String unit
});


@override $GlobalIngredientCopyWith<$Res>? get globalIngredient;

}
/// @nodoc
class __$IngredientFormEntryCopyWithImpl<$Res>
    implements _$IngredientFormEntryCopyWith<$Res> {
  __$IngredientFormEntryCopyWithImpl(this._self, this._then);

  final _IngredientFormEntry _self;
  final $Res Function(_IngredientFormEntry) _then;

/// Create a copy of IngredientFormEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? globalIngredient = freezed,Object? customName = freezed,Object? amount = null,Object? unit = null,}) {
  return _then(_IngredientFormEntry(
globalIngredient: freezed == globalIngredient ? _self.globalIngredient : globalIngredient // ignore: cast_nullable_to_non_nullable
as GlobalIngredient?,customName: freezed == customName ? _self.customName : customName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of IngredientFormEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GlobalIngredientCopyWith<$Res>? get globalIngredient {
    if (_self.globalIngredient == null) {
    return null;
  }

  return $GlobalIngredientCopyWith<$Res>(_self.globalIngredient!, (value) {
    return _then(_self.copyWith(globalIngredient: value));
  });
}
}

/// @nodoc
mixin _$CreateProductState {

 List<IngredientFormEntry> get ingredients; bool get isSubmitting; String? get nameError;
/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProductStateCopyWith<CreateProductState> get copyWith => _$CreateProductStateCopyWithImpl<CreateProductState>(this as CreateProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductState&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.nameError, nameError) || other.nameError == nameError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ingredients),isSubmitting,nameError);

@override
String toString() {
  return 'CreateProductState(ingredients: $ingredients, isSubmitting: $isSubmitting, nameError: $nameError)';
}


}

/// @nodoc
abstract mixin class $CreateProductStateCopyWith<$Res>  {
  factory $CreateProductStateCopyWith(CreateProductState value, $Res Function(CreateProductState) _then) = _$CreateProductStateCopyWithImpl;
@useResult
$Res call({
 List<IngredientFormEntry> ingredients, bool isSubmitting, String? nameError
});




}
/// @nodoc
class _$CreateProductStateCopyWithImpl<$Res>
    implements $CreateProductStateCopyWith<$Res> {
  _$CreateProductStateCopyWithImpl(this._self, this._then);

  final CreateProductState _self;
  final $Res Function(CreateProductState) _then;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredients = null,Object? isSubmitting = null,Object? nameError = freezed,}) {
  return _then(_self.copyWith(
ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientFormEntry>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateProductState].
extension CreateProductStatePatterns on CreateProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateProductState value)  $default,){
final _that = this;
switch (_that) {
case _CreateProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateProductState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IngredientFormEntry> ingredients,  bool isSubmitting,  String? nameError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateProductState() when $default != null:
return $default(_that.ingredients,_that.isSubmitting,_that.nameError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IngredientFormEntry> ingredients,  bool isSubmitting,  String? nameError)  $default,) {final _that = this;
switch (_that) {
case _CreateProductState():
return $default(_that.ingredients,_that.isSubmitting,_that.nameError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IngredientFormEntry> ingredients,  bool isSubmitting,  String? nameError)?  $default,) {final _that = this;
switch (_that) {
case _CreateProductState() when $default != null:
return $default(_that.ingredients,_that.isSubmitting,_that.nameError);case _:
  return null;

}
}

}

/// @nodoc


class _CreateProductState implements CreateProductState {
  const _CreateProductState({final  List<IngredientFormEntry> ingredients = const [], this.isSubmitting = false, this.nameError}): _ingredients = ingredients;
  

 final  List<IngredientFormEntry> _ingredients;
@override@JsonKey() List<IngredientFormEntry> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override@JsonKey() final  bool isSubmitting;
@override final  String? nameError;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateProductStateCopyWith<_CreateProductState> get copyWith => __$CreateProductStateCopyWithImpl<_CreateProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateProductState&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.nameError, nameError) || other.nameError == nameError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ingredients),isSubmitting,nameError);

@override
String toString() {
  return 'CreateProductState(ingredients: $ingredients, isSubmitting: $isSubmitting, nameError: $nameError)';
}


}

/// @nodoc
abstract mixin class _$CreateProductStateCopyWith<$Res> implements $CreateProductStateCopyWith<$Res> {
  factory _$CreateProductStateCopyWith(_CreateProductState value, $Res Function(_CreateProductState) _then) = __$CreateProductStateCopyWithImpl;
@override @useResult
$Res call({
 List<IngredientFormEntry> ingredients, bool isSubmitting, String? nameError
});




}
/// @nodoc
class __$CreateProductStateCopyWithImpl<$Res>
    implements _$CreateProductStateCopyWith<$Res> {
  __$CreateProductStateCopyWithImpl(this._self, this._then);

  final _CreateProductState _self;
  final $Res Function(_CreateProductState) _then;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredients = null,Object? isSubmitting = null,Object? nameError = freezed,}) {
  return _then(_CreateProductState(
ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientFormEntry>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
