// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncResponseDto {

@MicrosecondDateTimeJsonConverter() DateTime get serverTime; List<SyncProductDto> get products; List<SyncProductIngredientDto> get productIngredients; List<SyncCourseDto> get courses; List<SyncIntakeLogDto> get intakeLogs; List<SyncGlobalIngredientDto> get globalIngredients;
/// Create a copy of SyncResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncResponseDtoCopyWith<SyncResponseDto> get copyWith => _$SyncResponseDtoCopyWithImpl<SyncResponseDto>(this as SyncResponseDto, _$identity);

  /// Serializes this SyncResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncResponseDto&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime)&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.productIngredients, productIngredients)&&const DeepCollectionEquality().equals(other.courses, courses)&&const DeepCollectionEquality().equals(other.intakeLogs, intakeLogs)&&const DeepCollectionEquality().equals(other.globalIngredients, globalIngredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverTime,const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(productIngredients),const DeepCollectionEquality().hash(courses),const DeepCollectionEquality().hash(intakeLogs),const DeepCollectionEquality().hash(globalIngredients));

@override
String toString() {
  return 'SyncResponseDto(serverTime: $serverTime, products: $products, productIngredients: $productIngredients, courses: $courses, intakeLogs: $intakeLogs, globalIngredients: $globalIngredients)';
}


}

/// @nodoc
abstract mixin class $SyncResponseDtoCopyWith<$Res>  {
  factory $SyncResponseDtoCopyWith(SyncResponseDto value, $Res Function(SyncResponseDto) _then) = _$SyncResponseDtoCopyWithImpl;
@useResult
$Res call({
@MicrosecondDateTimeJsonConverter() DateTime serverTime, List<SyncProductDto> products, List<SyncProductIngredientDto> productIngredients, List<SyncCourseDto> courses, List<SyncIntakeLogDto> intakeLogs, List<SyncGlobalIngredientDto> globalIngredients
});




}
/// @nodoc
class _$SyncResponseDtoCopyWithImpl<$Res>
    implements $SyncResponseDtoCopyWith<$Res> {
  _$SyncResponseDtoCopyWithImpl(this._self, this._then);

  final SyncResponseDto _self;
  final $Res Function(SyncResponseDto) _then;

/// Create a copy of SyncResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverTime = null,Object? products = null,Object? productIngredients = null,Object? courses = null,Object? intakeLogs = null,Object? globalIngredients = null,}) {
  return _then(_self.copyWith(
serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<SyncProductDto>,productIngredients: null == productIngredients ? _self.productIngredients : productIngredients // ignore: cast_nullable_to_non_nullable
as List<SyncProductIngredientDto>,courses: null == courses ? _self.courses : courses // ignore: cast_nullable_to_non_nullable
as List<SyncCourseDto>,intakeLogs: null == intakeLogs ? _self.intakeLogs : intakeLogs // ignore: cast_nullable_to_non_nullable
as List<SyncIntakeLogDto>,globalIngredients: null == globalIngredients ? _self.globalIngredients : globalIngredients // ignore: cast_nullable_to_non_nullable
as List<SyncGlobalIngredientDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncResponseDto].
extension SyncResponseDtoPatterns on SyncResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _SyncResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _SyncResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MicrosecondDateTimeJsonConverter()  DateTime serverTime,  List<SyncProductDto> products,  List<SyncProductIngredientDto> productIngredients,  List<SyncCourseDto> courses,  List<SyncIntakeLogDto> intakeLogs,  List<SyncGlobalIngredientDto> globalIngredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncResponseDto() when $default != null:
return $default(_that.serverTime,_that.products,_that.productIngredients,_that.courses,_that.intakeLogs,_that.globalIngredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MicrosecondDateTimeJsonConverter()  DateTime serverTime,  List<SyncProductDto> products,  List<SyncProductIngredientDto> productIngredients,  List<SyncCourseDto> courses,  List<SyncIntakeLogDto> intakeLogs,  List<SyncGlobalIngredientDto> globalIngredients)  $default,) {final _that = this;
switch (_that) {
case _SyncResponseDto():
return $default(_that.serverTime,_that.products,_that.productIngredients,_that.courses,_that.intakeLogs,_that.globalIngredients);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MicrosecondDateTimeJsonConverter()  DateTime serverTime,  List<SyncProductDto> products,  List<SyncProductIngredientDto> productIngredients,  List<SyncCourseDto> courses,  List<SyncIntakeLogDto> intakeLogs,  List<SyncGlobalIngredientDto> globalIngredients)?  $default,) {final _that = this;
switch (_that) {
case _SyncResponseDto() when $default != null:
return $default(_that.serverTime,_that.products,_that.productIngredients,_that.courses,_that.intakeLogs,_that.globalIngredients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncResponseDto implements SyncResponseDto {
  const _SyncResponseDto({@MicrosecondDateTimeJsonConverter() required this.serverTime, required final  List<SyncProductDto> products, required final  List<SyncProductIngredientDto> productIngredients, required final  List<SyncCourseDto> courses, required final  List<SyncIntakeLogDto> intakeLogs, required final  List<SyncGlobalIngredientDto> globalIngredients}): _products = products,_productIngredients = productIngredients,_courses = courses,_intakeLogs = intakeLogs,_globalIngredients = globalIngredients;
  factory _SyncResponseDto.fromJson(Map<String, dynamic> json) => _$SyncResponseDtoFromJson(json);

@override@MicrosecondDateTimeJsonConverter() final  DateTime serverTime;
 final  List<SyncProductDto> _products;
@override List<SyncProductDto> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<SyncProductIngredientDto> _productIngredients;
@override List<SyncProductIngredientDto> get productIngredients {
  if (_productIngredients is EqualUnmodifiableListView) return _productIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productIngredients);
}

 final  List<SyncCourseDto> _courses;
@override List<SyncCourseDto> get courses {
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courses);
}

 final  List<SyncIntakeLogDto> _intakeLogs;
@override List<SyncIntakeLogDto> get intakeLogs {
  if (_intakeLogs is EqualUnmodifiableListView) return _intakeLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_intakeLogs);
}

 final  List<SyncGlobalIngredientDto> _globalIngredients;
@override List<SyncGlobalIngredientDto> get globalIngredients {
  if (_globalIngredients is EqualUnmodifiableListView) return _globalIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_globalIngredients);
}


/// Create a copy of SyncResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncResponseDtoCopyWith<_SyncResponseDto> get copyWith => __$SyncResponseDtoCopyWithImpl<_SyncResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncResponseDto&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime)&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._productIngredients, _productIngredients)&&const DeepCollectionEquality().equals(other._courses, _courses)&&const DeepCollectionEquality().equals(other._intakeLogs, _intakeLogs)&&const DeepCollectionEquality().equals(other._globalIngredients, _globalIngredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverTime,const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_productIngredients),const DeepCollectionEquality().hash(_courses),const DeepCollectionEquality().hash(_intakeLogs),const DeepCollectionEquality().hash(_globalIngredients));

@override
String toString() {
  return 'SyncResponseDto(serverTime: $serverTime, products: $products, productIngredients: $productIngredients, courses: $courses, intakeLogs: $intakeLogs, globalIngredients: $globalIngredients)';
}


}

/// @nodoc
abstract mixin class _$SyncResponseDtoCopyWith<$Res> implements $SyncResponseDtoCopyWith<$Res> {
  factory _$SyncResponseDtoCopyWith(_SyncResponseDto value, $Res Function(_SyncResponseDto) _then) = __$SyncResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@MicrosecondDateTimeJsonConverter() DateTime serverTime, List<SyncProductDto> products, List<SyncProductIngredientDto> productIngredients, List<SyncCourseDto> courses, List<SyncIntakeLogDto> intakeLogs, List<SyncGlobalIngredientDto> globalIngredients
});




}
/// @nodoc
class __$SyncResponseDtoCopyWithImpl<$Res>
    implements _$SyncResponseDtoCopyWith<$Res> {
  __$SyncResponseDtoCopyWithImpl(this._self, this._then);

  final _SyncResponseDto _self;
  final $Res Function(_SyncResponseDto) _then;

/// Create a copy of SyncResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverTime = null,Object? products = null,Object? productIngredients = null,Object? courses = null,Object? intakeLogs = null,Object? globalIngredients = null,}) {
  return _then(_SyncResponseDto(
serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<SyncProductDto>,productIngredients: null == productIngredients ? _self._productIngredients : productIngredients // ignore: cast_nullable_to_non_nullable
as List<SyncProductIngredientDto>,courses: null == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<SyncCourseDto>,intakeLogs: null == intakeLogs ? _self._intakeLogs : intakeLogs // ignore: cast_nullable_to_non_nullable
as List<SyncIntakeLogDto>,globalIngredients: null == globalIngredients ? _self._globalIngredients : globalIngredients // ignore: cast_nullable_to_non_nullable
as List<SyncGlobalIngredientDto>,
  ));
}


}

// dart format on
