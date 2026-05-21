// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncRequestDto {

@JsonKey(name: 'LastSyncAt')@MicrosecondDateTimeJsonConverter() DateTime? get lastSyncAt;@JsonKey(name: 'ClientTime')@MicrosecondDateTimeJsonConverter() DateTime get clientTime;@JsonKey(name: 'Products') List<SyncProductDto> get products;@JsonKey(name: 'ProductIngredients') List<SyncProductIngredientDto> get productIngredients;@JsonKey(name: 'Courses') List<SyncCourseDto> get courses;@JsonKey(name: 'IntakeLogs') List<SyncIntakeLogDto> get intakeLogs;
/// Create a copy of SyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncRequestDtoCopyWith<SyncRequestDto> get copyWith => _$SyncRequestDtoCopyWithImpl<SyncRequestDto>(this as SyncRequestDto, _$identity);

  /// Serializes this SyncRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncRequestDto&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.clientTime, clientTime) || other.clientTime == clientTime)&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.productIngredients, productIngredients)&&const DeepCollectionEquality().equals(other.courses, courses)&&const DeepCollectionEquality().equals(other.intakeLogs, intakeLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastSyncAt,clientTime,const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(productIngredients),const DeepCollectionEquality().hash(courses),const DeepCollectionEquality().hash(intakeLogs));

@override
String toString() {
  return 'SyncRequestDto(lastSyncAt: $lastSyncAt, clientTime: $clientTime, products: $products, productIngredients: $productIngredients, courses: $courses, intakeLogs: $intakeLogs)';
}


}

/// @nodoc
abstract mixin class $SyncRequestDtoCopyWith<$Res>  {
  factory $SyncRequestDtoCopyWith(SyncRequestDto value, $Res Function(SyncRequestDto) _then) = _$SyncRequestDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'LastSyncAt')@MicrosecondDateTimeJsonConverter() DateTime? lastSyncAt,@JsonKey(name: 'ClientTime')@MicrosecondDateTimeJsonConverter() DateTime clientTime,@JsonKey(name: 'Products') List<SyncProductDto> products,@JsonKey(name: 'ProductIngredients') List<SyncProductIngredientDto> productIngredients,@JsonKey(name: 'Courses') List<SyncCourseDto> courses,@JsonKey(name: 'IntakeLogs') List<SyncIntakeLogDto> intakeLogs
});




}
/// @nodoc
class _$SyncRequestDtoCopyWithImpl<$Res>
    implements $SyncRequestDtoCopyWith<$Res> {
  _$SyncRequestDtoCopyWithImpl(this._self, this._then);

  final SyncRequestDto _self;
  final $Res Function(SyncRequestDto) _then;

/// Create a copy of SyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastSyncAt = freezed,Object? clientTime = null,Object? products = null,Object? productIngredients = null,Object? courses = null,Object? intakeLogs = null,}) {
  return _then(_self.copyWith(
lastSyncAt: freezed == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as DateTime?,clientTime: null == clientTime ? _self.clientTime : clientTime // ignore: cast_nullable_to_non_nullable
as DateTime,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<SyncProductDto>,productIngredients: null == productIngredients ? _self.productIngredients : productIngredients // ignore: cast_nullable_to_non_nullable
as List<SyncProductIngredientDto>,courses: null == courses ? _self.courses : courses // ignore: cast_nullable_to_non_nullable
as List<SyncCourseDto>,intakeLogs: null == intakeLogs ? _self.intakeLogs : intakeLogs // ignore: cast_nullable_to_non_nullable
as List<SyncIntakeLogDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncRequestDto].
extension SyncRequestDtoPatterns on SyncRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _SyncRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _SyncRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'LastSyncAt')@MicrosecondDateTimeJsonConverter()  DateTime? lastSyncAt, @JsonKey(name: 'ClientTime')@MicrosecondDateTimeJsonConverter()  DateTime clientTime, @JsonKey(name: 'Products')  List<SyncProductDto> products, @JsonKey(name: 'ProductIngredients')  List<SyncProductIngredientDto> productIngredients, @JsonKey(name: 'Courses')  List<SyncCourseDto> courses, @JsonKey(name: 'IntakeLogs')  List<SyncIntakeLogDto> intakeLogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncRequestDto() when $default != null:
return $default(_that.lastSyncAt,_that.clientTime,_that.products,_that.productIngredients,_that.courses,_that.intakeLogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'LastSyncAt')@MicrosecondDateTimeJsonConverter()  DateTime? lastSyncAt, @JsonKey(name: 'ClientTime')@MicrosecondDateTimeJsonConverter()  DateTime clientTime, @JsonKey(name: 'Products')  List<SyncProductDto> products, @JsonKey(name: 'ProductIngredients')  List<SyncProductIngredientDto> productIngredients, @JsonKey(name: 'Courses')  List<SyncCourseDto> courses, @JsonKey(name: 'IntakeLogs')  List<SyncIntakeLogDto> intakeLogs)  $default,) {final _that = this;
switch (_that) {
case _SyncRequestDto():
return $default(_that.lastSyncAt,_that.clientTime,_that.products,_that.productIngredients,_that.courses,_that.intakeLogs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'LastSyncAt')@MicrosecondDateTimeJsonConverter()  DateTime? lastSyncAt, @JsonKey(name: 'ClientTime')@MicrosecondDateTimeJsonConverter()  DateTime clientTime, @JsonKey(name: 'Products')  List<SyncProductDto> products, @JsonKey(name: 'ProductIngredients')  List<SyncProductIngredientDto> productIngredients, @JsonKey(name: 'Courses')  List<SyncCourseDto> courses, @JsonKey(name: 'IntakeLogs')  List<SyncIntakeLogDto> intakeLogs)?  $default,) {final _that = this;
switch (_that) {
case _SyncRequestDto() when $default != null:
return $default(_that.lastSyncAt,_that.clientTime,_that.products,_that.productIngredients,_that.courses,_that.intakeLogs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncRequestDto implements SyncRequestDto {
  const _SyncRequestDto({@JsonKey(name: 'LastSyncAt')@MicrosecondDateTimeJsonConverter() required this.lastSyncAt, @JsonKey(name: 'ClientTime')@MicrosecondDateTimeJsonConverter() required this.clientTime, @JsonKey(name: 'Products') required final  List<SyncProductDto> products, @JsonKey(name: 'ProductIngredients') required final  List<SyncProductIngredientDto> productIngredients, @JsonKey(name: 'Courses') required final  List<SyncCourseDto> courses, @JsonKey(name: 'IntakeLogs') required final  List<SyncIntakeLogDto> intakeLogs}): _products = products,_productIngredients = productIngredients,_courses = courses,_intakeLogs = intakeLogs;
  factory _SyncRequestDto.fromJson(Map<String, dynamic> json) => _$SyncRequestDtoFromJson(json);

@override@JsonKey(name: 'LastSyncAt')@MicrosecondDateTimeJsonConverter() final  DateTime? lastSyncAt;
@override@JsonKey(name: 'ClientTime')@MicrosecondDateTimeJsonConverter() final  DateTime clientTime;
 final  List<SyncProductDto> _products;
@override@JsonKey(name: 'Products') List<SyncProductDto> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<SyncProductIngredientDto> _productIngredients;
@override@JsonKey(name: 'ProductIngredients') List<SyncProductIngredientDto> get productIngredients {
  if (_productIngredients is EqualUnmodifiableListView) return _productIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productIngredients);
}

 final  List<SyncCourseDto> _courses;
@override@JsonKey(name: 'Courses') List<SyncCourseDto> get courses {
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courses);
}

 final  List<SyncIntakeLogDto> _intakeLogs;
@override@JsonKey(name: 'IntakeLogs') List<SyncIntakeLogDto> get intakeLogs {
  if (_intakeLogs is EqualUnmodifiableListView) return _intakeLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_intakeLogs);
}


/// Create a copy of SyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncRequestDtoCopyWith<_SyncRequestDto> get copyWith => __$SyncRequestDtoCopyWithImpl<_SyncRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncRequestDto&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.clientTime, clientTime) || other.clientTime == clientTime)&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._productIngredients, _productIngredients)&&const DeepCollectionEquality().equals(other._courses, _courses)&&const DeepCollectionEquality().equals(other._intakeLogs, _intakeLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastSyncAt,clientTime,const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_productIngredients),const DeepCollectionEquality().hash(_courses),const DeepCollectionEquality().hash(_intakeLogs));

@override
String toString() {
  return 'SyncRequestDto(lastSyncAt: $lastSyncAt, clientTime: $clientTime, products: $products, productIngredients: $productIngredients, courses: $courses, intakeLogs: $intakeLogs)';
}


}

/// @nodoc
abstract mixin class _$SyncRequestDtoCopyWith<$Res> implements $SyncRequestDtoCopyWith<$Res> {
  factory _$SyncRequestDtoCopyWith(_SyncRequestDto value, $Res Function(_SyncRequestDto) _then) = __$SyncRequestDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'LastSyncAt')@MicrosecondDateTimeJsonConverter() DateTime? lastSyncAt,@JsonKey(name: 'ClientTime')@MicrosecondDateTimeJsonConverter() DateTime clientTime,@JsonKey(name: 'Products') List<SyncProductDto> products,@JsonKey(name: 'ProductIngredients') List<SyncProductIngredientDto> productIngredients,@JsonKey(name: 'Courses') List<SyncCourseDto> courses,@JsonKey(name: 'IntakeLogs') List<SyncIntakeLogDto> intakeLogs
});




}
/// @nodoc
class __$SyncRequestDtoCopyWithImpl<$Res>
    implements _$SyncRequestDtoCopyWith<$Res> {
  __$SyncRequestDtoCopyWithImpl(this._self, this._then);

  final _SyncRequestDto _self;
  final $Res Function(_SyncRequestDto) _then;

/// Create a copy of SyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastSyncAt = freezed,Object? clientTime = null,Object? products = null,Object? productIngredients = null,Object? courses = null,Object? intakeLogs = null,}) {
  return _then(_SyncRequestDto(
lastSyncAt: freezed == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as DateTime?,clientTime: null == clientTime ? _self.clientTime : clientTime // ignore: cast_nullable_to_non_nullable
as DateTime,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<SyncProductDto>,productIngredients: null == productIngredients ? _self._productIngredients : productIngredients // ignore: cast_nullable_to_non_nullable
as List<SyncProductIngredientDto>,courses: null == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<SyncCourseDto>,intakeLogs: null == intakeLogs ? _self._intakeLogs : intakeLogs // ignore: cast_nullable_to_non_nullable
as List<SyncIntakeLogDto>,
  ));
}


}

// dart format on
