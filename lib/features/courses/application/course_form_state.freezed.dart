// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseFormState {

 String? get productId; String get productName;/// Raw text input for serving size — validated on submit.
 String get servingSizeInput;/// Duration from midnight (UTC-safe, timezone-agnostic schedule time).
 Duration get timeOfDay;/// UTC midnight of the start date.
 DateTime get startDateUtc;/// UTC midnight of the optional end date. Null = open-ended.
 DateTime? get endDateUtc; bool get isSubmitting;/// Field-level validation errors keyed by field name.
/// Key `'_global'` holds a top-level submit error message.
 Map<String, String> get fieldErrors;
/// Create a copy of CourseFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseFormStateCopyWith<CourseFormState> get copyWith => _$CourseFormStateCopyWithImpl<CourseFormState>(this as CourseFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseFormState&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.servingSizeInput, servingSizeInput) || other.servingSizeInput == servingSizeInput)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.startDateUtc, startDateUtc) || other.startDateUtc == startDateUtc)&&(identical(other.endDateUtc, endDateUtc) || other.endDateUtc == endDateUtc)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors));
}


@override
int get hashCode => Object.hash(runtimeType,productId,productName,servingSizeInput,timeOfDay,startDateUtc,endDateUtc,isSubmitting,const DeepCollectionEquality().hash(fieldErrors));

@override
String toString() {
  return 'CourseFormState(productId: $productId, productName: $productName, servingSizeInput: $servingSizeInput, timeOfDay: $timeOfDay, startDateUtc: $startDateUtc, endDateUtc: $endDateUtc, isSubmitting: $isSubmitting, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class $CourseFormStateCopyWith<$Res>  {
  factory $CourseFormStateCopyWith(CourseFormState value, $Res Function(CourseFormState) _then) = _$CourseFormStateCopyWithImpl;
@useResult
$Res call({
 String? productId, String productName, String servingSizeInput, Duration timeOfDay, DateTime startDateUtc, DateTime? endDateUtc, bool isSubmitting, Map<String, String> fieldErrors
});




}
/// @nodoc
class _$CourseFormStateCopyWithImpl<$Res>
    implements $CourseFormStateCopyWith<$Res> {
  _$CourseFormStateCopyWithImpl(this._self, this._then);

  final CourseFormState _self;
  final $Res Function(CourseFormState) _then;

/// Create a copy of CourseFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = freezed,Object? productName = null,Object? servingSizeInput = null,Object? timeOfDay = null,Object? startDateUtc = null,Object? endDateUtc = freezed,Object? isSubmitting = null,Object? fieldErrors = null,}) {
  return _then(_self.copyWith(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,servingSizeInput: null == servingSizeInput ? _self.servingSizeInput : servingSizeInput // ignore: cast_nullable_to_non_nullable
as String,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as Duration,startDateUtc: null == startDateUtc ? _self.startDateUtc : startDateUtc // ignore: cast_nullable_to_non_nullable
as DateTime,endDateUtc: freezed == endDateUtc ? _self.endDateUtc : endDateUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseFormState].
extension CourseFormStatePatterns on CourseFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseFormState value)  $default,){
final _that = this;
switch (_that) {
case _CourseFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseFormState value)?  $default,){
final _that = this;
switch (_that) {
case _CourseFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? productId,  String productName,  String servingSizeInput,  Duration timeOfDay,  DateTime startDateUtc,  DateTime? endDateUtc,  bool isSubmitting,  Map<String, String> fieldErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseFormState() when $default != null:
return $default(_that.productId,_that.productName,_that.servingSizeInput,_that.timeOfDay,_that.startDateUtc,_that.endDateUtc,_that.isSubmitting,_that.fieldErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? productId,  String productName,  String servingSizeInput,  Duration timeOfDay,  DateTime startDateUtc,  DateTime? endDateUtc,  bool isSubmitting,  Map<String, String> fieldErrors)  $default,) {final _that = this;
switch (_that) {
case _CourseFormState():
return $default(_that.productId,_that.productName,_that.servingSizeInput,_that.timeOfDay,_that.startDateUtc,_that.endDateUtc,_that.isSubmitting,_that.fieldErrors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? productId,  String productName,  String servingSizeInput,  Duration timeOfDay,  DateTime startDateUtc,  DateTime? endDateUtc,  bool isSubmitting,  Map<String, String> fieldErrors)?  $default,) {final _that = this;
switch (_that) {
case _CourseFormState() when $default != null:
return $default(_that.productId,_that.productName,_that.servingSizeInput,_that.timeOfDay,_that.startDateUtc,_that.endDateUtc,_that.isSubmitting,_that.fieldErrors);case _:
  return null;

}
}

}

/// @nodoc


class _CourseFormState implements CourseFormState {
  const _CourseFormState({required this.productId, required this.productName, required this.servingSizeInput, required this.timeOfDay, required this.startDateUtc, required this.endDateUtc, required this.isSubmitting, final  Map<String, String> fieldErrors = const {}}): _fieldErrors = fieldErrors;
  

@override final  String? productId;
@override final  String productName;
/// Raw text input for serving size — validated on submit.
@override final  String servingSizeInput;
/// Duration from midnight (UTC-safe, timezone-agnostic schedule time).
@override final  Duration timeOfDay;
/// UTC midnight of the start date.
@override final  DateTime startDateUtc;
/// UTC midnight of the optional end date. Null = open-ended.
@override final  DateTime? endDateUtc;
@override final  bool isSubmitting;
/// Field-level validation errors keyed by field name.
/// Key `'_global'` holds a top-level submit error message.
 final  Map<String, String> _fieldErrors;
/// Field-level validation errors keyed by field name.
/// Key `'_global'` holds a top-level submit error message.
@override@JsonKey() Map<String, String> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}


/// Create a copy of CourseFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseFormStateCopyWith<_CourseFormState> get copyWith => __$CourseFormStateCopyWithImpl<_CourseFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseFormState&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.servingSizeInput, servingSizeInput) || other.servingSizeInput == servingSizeInput)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.startDateUtc, startDateUtc) || other.startDateUtc == startDateUtc)&&(identical(other.endDateUtc, endDateUtc) || other.endDateUtc == endDateUtc)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors));
}


@override
int get hashCode => Object.hash(runtimeType,productId,productName,servingSizeInput,timeOfDay,startDateUtc,endDateUtc,isSubmitting,const DeepCollectionEquality().hash(_fieldErrors));

@override
String toString() {
  return 'CourseFormState(productId: $productId, productName: $productName, servingSizeInput: $servingSizeInput, timeOfDay: $timeOfDay, startDateUtc: $startDateUtc, endDateUtc: $endDateUtc, isSubmitting: $isSubmitting, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class _$CourseFormStateCopyWith<$Res> implements $CourseFormStateCopyWith<$Res> {
  factory _$CourseFormStateCopyWith(_CourseFormState value, $Res Function(_CourseFormState) _then) = __$CourseFormStateCopyWithImpl;
@override @useResult
$Res call({
 String? productId, String productName, String servingSizeInput, Duration timeOfDay, DateTime startDateUtc, DateTime? endDateUtc, bool isSubmitting, Map<String, String> fieldErrors
});




}
/// @nodoc
class __$CourseFormStateCopyWithImpl<$Res>
    implements _$CourseFormStateCopyWith<$Res> {
  __$CourseFormStateCopyWithImpl(this._self, this._then);

  final _CourseFormState _self;
  final $Res Function(_CourseFormState) _then;

/// Create a copy of CourseFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = freezed,Object? productName = null,Object? servingSizeInput = null,Object? timeOfDay = null,Object? startDateUtc = null,Object? endDateUtc = freezed,Object? isSubmitting = null,Object? fieldErrors = null,}) {
  return _then(_CourseFormState(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,servingSizeInput: null == servingSizeInput ? _self.servingSizeInput : servingSizeInput // ignore: cast_nullable_to_non_nullable
as String,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as Duration,startDateUtc: null == startDateUtc ? _self.startDateUtc : startDateUtc // ignore: cast_nullable_to_non_nullable
as DateTime,endDateUtc: freezed == endDateUtc ? _self.endDateUtc : endDateUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
