// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellbeing_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WellbeingFormState {

 int get mood; int get energy; double get sleepHours; String get notes; bool get isSubmitting; String? get errorMessage;
/// Create a copy of WellbeingFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WellbeingFormStateCopyWith<WellbeingFormState> get copyWith => _$WellbeingFormStateCopyWithImpl<WellbeingFormState>(this as WellbeingFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WellbeingFormState&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,mood,energy,sleepHours,notes,isSubmitting,errorMessage);

@override
String toString() {
  return 'WellbeingFormState(mood: $mood, energy: $energy, sleepHours: $sleepHours, notes: $notes, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $WellbeingFormStateCopyWith<$Res>  {
  factory $WellbeingFormStateCopyWith(WellbeingFormState value, $Res Function(WellbeingFormState) _then) = _$WellbeingFormStateCopyWithImpl;
@useResult
$Res call({
 int mood, int energy, double sleepHours, String notes, bool isSubmitting, String? errorMessage
});




}
/// @nodoc
class _$WellbeingFormStateCopyWithImpl<$Res>
    implements $WellbeingFormStateCopyWith<$Res> {
  _$WellbeingFormStateCopyWithImpl(this._self, this._then);

  final WellbeingFormState _self;
  final $Res Function(WellbeingFormState) _then;

/// Create a copy of WellbeingFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mood = null,Object? energy = null,Object? sleepHours = null,Object? notes = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as int,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WellbeingFormState].
extension WellbeingFormStatePatterns on WellbeingFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WellbeingFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WellbeingFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WellbeingFormState value)  $default,){
final _that = this;
switch (_that) {
case _WellbeingFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WellbeingFormState value)?  $default,){
final _that = this;
switch (_that) {
case _WellbeingFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int mood,  int energy,  double sleepHours,  String notes,  bool isSubmitting,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WellbeingFormState() when $default != null:
return $default(_that.mood,_that.energy,_that.sleepHours,_that.notes,_that.isSubmitting,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int mood,  int energy,  double sleepHours,  String notes,  bool isSubmitting,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _WellbeingFormState():
return $default(_that.mood,_that.energy,_that.sleepHours,_that.notes,_that.isSubmitting,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int mood,  int energy,  double sleepHours,  String notes,  bool isSubmitting,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _WellbeingFormState() when $default != null:
return $default(_that.mood,_that.energy,_that.sleepHours,_that.notes,_that.isSubmitting,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _WellbeingFormState implements WellbeingFormState {
  const _WellbeingFormState({this.mood = 3, this.energy = 3, this.sleepHours = 7.0, this.notes = '', this.isSubmitting = false, this.errorMessage});
  

@override@JsonKey() final  int mood;
@override@JsonKey() final  int energy;
@override@JsonKey() final  double sleepHours;
@override@JsonKey() final  String notes;
@override@JsonKey() final  bool isSubmitting;
@override final  String? errorMessage;

/// Create a copy of WellbeingFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WellbeingFormStateCopyWith<_WellbeingFormState> get copyWith => __$WellbeingFormStateCopyWithImpl<_WellbeingFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WellbeingFormState&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,mood,energy,sleepHours,notes,isSubmitting,errorMessage);

@override
String toString() {
  return 'WellbeingFormState(mood: $mood, energy: $energy, sleepHours: $sleepHours, notes: $notes, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$WellbeingFormStateCopyWith<$Res> implements $WellbeingFormStateCopyWith<$Res> {
  factory _$WellbeingFormStateCopyWith(_WellbeingFormState value, $Res Function(_WellbeingFormState) _then) = __$WellbeingFormStateCopyWithImpl;
@override @useResult
$Res call({
 int mood, int energy, double sleepHours, String notes, bool isSubmitting, String? errorMessage
});




}
/// @nodoc
class __$WellbeingFormStateCopyWithImpl<$Res>
    implements _$WellbeingFormStateCopyWith<$Res> {
  __$WellbeingFormStateCopyWithImpl(this._self, this._then);

  final _WellbeingFormState _self;
  final $Res Function(_WellbeingFormState) _then;

/// Create a copy of WellbeingFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mood = null,Object? energy = null,Object? sleepHours = null,Object? notes = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_WellbeingFormState(
mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as int,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
