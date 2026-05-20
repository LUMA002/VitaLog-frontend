// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheduled_intake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduledIntake {

 String get courseId; String get productId;/// Display name resolved from the [Product] catalogue.
 String get productName; double get servingSize;/// Duration from UTC midnight representing the scheduled time-of-day.
 Duration get timeOfDay;/// UTC timestamp for the scheduled slot (today's UTC midnight + [timeOfDay]).
 DateTime get scheduledAtUtc;/// Whether an [IntakeLog] exists for this course today.
 bool get isTaken;/// ID of the matching [IntakeLog] when [isTaken] is true.
 String? get intakeLogId;/// UTC timestamp the intake was actually recorded.
 DateTime? get takenAtUtc;
/// Create a copy of ScheduledIntake
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduledIntakeCopyWith<ScheduledIntake> get copyWith => _$ScheduledIntakeCopyWithImpl<ScheduledIntake>(this as ScheduledIntake, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduledIntake&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.servingSize, servingSize) || other.servingSize == servingSize)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.scheduledAtUtc, scheduledAtUtc) || other.scheduledAtUtc == scheduledAtUtc)&&(identical(other.isTaken, isTaken) || other.isTaken == isTaken)&&(identical(other.intakeLogId, intakeLogId) || other.intakeLogId == intakeLogId)&&(identical(other.takenAtUtc, takenAtUtc) || other.takenAtUtc == takenAtUtc));
}


@override
int get hashCode => Object.hash(runtimeType,courseId,productId,productName,servingSize,timeOfDay,scheduledAtUtc,isTaken,intakeLogId,takenAtUtc);

@override
String toString() {
  return 'ScheduledIntake(courseId: $courseId, productId: $productId, productName: $productName, servingSize: $servingSize, timeOfDay: $timeOfDay, scheduledAtUtc: $scheduledAtUtc, isTaken: $isTaken, intakeLogId: $intakeLogId, takenAtUtc: $takenAtUtc)';
}


}

/// @nodoc
abstract mixin class $ScheduledIntakeCopyWith<$Res>  {
  factory $ScheduledIntakeCopyWith(ScheduledIntake value, $Res Function(ScheduledIntake) _then) = _$ScheduledIntakeCopyWithImpl;
@useResult
$Res call({
 String courseId, String productId, String productName, double servingSize, Duration timeOfDay, DateTime scheduledAtUtc, bool isTaken, String? intakeLogId, DateTime? takenAtUtc
});




}
/// @nodoc
class _$ScheduledIntakeCopyWithImpl<$Res>
    implements $ScheduledIntakeCopyWith<$Res> {
  _$ScheduledIntakeCopyWithImpl(this._self, this._then);

  final ScheduledIntake _self;
  final $Res Function(ScheduledIntake) _then;

/// Create a copy of ScheduledIntake
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? courseId = null,Object? productId = null,Object? productName = null,Object? servingSize = null,Object? timeOfDay = null,Object? scheduledAtUtc = null,Object? isTaken = null,Object? intakeLogId = freezed,Object? takenAtUtc = freezed,}) {
  return _then(_self.copyWith(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,servingSize: null == servingSize ? _self.servingSize : servingSize // ignore: cast_nullable_to_non_nullable
as double,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as Duration,scheduledAtUtc: null == scheduledAtUtc ? _self.scheduledAtUtc : scheduledAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,isTaken: null == isTaken ? _self.isTaken : isTaken // ignore: cast_nullable_to_non_nullable
as bool,intakeLogId: freezed == intakeLogId ? _self.intakeLogId : intakeLogId // ignore: cast_nullable_to_non_nullable
as String?,takenAtUtc: freezed == takenAtUtc ? _self.takenAtUtc : takenAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduledIntake].
extension ScheduledIntakePatterns on ScheduledIntake {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduledIntake value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduledIntake() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduledIntake value)  $default,){
final _that = this;
switch (_that) {
case _ScheduledIntake():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduledIntake value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduledIntake() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String courseId,  String productId,  String productName,  double servingSize,  Duration timeOfDay,  DateTime scheduledAtUtc,  bool isTaken,  String? intakeLogId,  DateTime? takenAtUtc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduledIntake() when $default != null:
return $default(_that.courseId,_that.productId,_that.productName,_that.servingSize,_that.timeOfDay,_that.scheduledAtUtc,_that.isTaken,_that.intakeLogId,_that.takenAtUtc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String courseId,  String productId,  String productName,  double servingSize,  Duration timeOfDay,  DateTime scheduledAtUtc,  bool isTaken,  String? intakeLogId,  DateTime? takenAtUtc)  $default,) {final _that = this;
switch (_that) {
case _ScheduledIntake():
return $default(_that.courseId,_that.productId,_that.productName,_that.servingSize,_that.timeOfDay,_that.scheduledAtUtc,_that.isTaken,_that.intakeLogId,_that.takenAtUtc);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String courseId,  String productId,  String productName,  double servingSize,  Duration timeOfDay,  DateTime scheduledAtUtc,  bool isTaken,  String? intakeLogId,  DateTime? takenAtUtc)?  $default,) {final _that = this;
switch (_that) {
case _ScheduledIntake() when $default != null:
return $default(_that.courseId,_that.productId,_that.productName,_that.servingSize,_that.timeOfDay,_that.scheduledAtUtc,_that.isTaken,_that.intakeLogId,_that.takenAtUtc);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduledIntake implements ScheduledIntake {
  const _ScheduledIntake({required this.courseId, required this.productId, required this.productName, required this.servingSize, required this.timeOfDay, required this.scheduledAtUtc, required this.isTaken, required this.intakeLogId, required this.takenAtUtc});
  

@override final  String courseId;
@override final  String productId;
/// Display name resolved from the [Product] catalogue.
@override final  String productName;
@override final  double servingSize;
/// Duration from UTC midnight representing the scheduled time-of-day.
@override final  Duration timeOfDay;
/// UTC timestamp for the scheduled slot (today's UTC midnight + [timeOfDay]).
@override final  DateTime scheduledAtUtc;
/// Whether an [IntakeLog] exists for this course today.
@override final  bool isTaken;
/// ID of the matching [IntakeLog] when [isTaken] is true.
@override final  String? intakeLogId;
/// UTC timestamp the intake was actually recorded.
@override final  DateTime? takenAtUtc;

/// Create a copy of ScheduledIntake
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduledIntakeCopyWith<_ScheduledIntake> get copyWith => __$ScheduledIntakeCopyWithImpl<_ScheduledIntake>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduledIntake&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.servingSize, servingSize) || other.servingSize == servingSize)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.scheduledAtUtc, scheduledAtUtc) || other.scheduledAtUtc == scheduledAtUtc)&&(identical(other.isTaken, isTaken) || other.isTaken == isTaken)&&(identical(other.intakeLogId, intakeLogId) || other.intakeLogId == intakeLogId)&&(identical(other.takenAtUtc, takenAtUtc) || other.takenAtUtc == takenAtUtc));
}


@override
int get hashCode => Object.hash(runtimeType,courseId,productId,productName,servingSize,timeOfDay,scheduledAtUtc,isTaken,intakeLogId,takenAtUtc);

@override
String toString() {
  return 'ScheduledIntake(courseId: $courseId, productId: $productId, productName: $productName, servingSize: $servingSize, timeOfDay: $timeOfDay, scheduledAtUtc: $scheduledAtUtc, isTaken: $isTaken, intakeLogId: $intakeLogId, takenAtUtc: $takenAtUtc)';
}


}

/// @nodoc
abstract mixin class _$ScheduledIntakeCopyWith<$Res> implements $ScheduledIntakeCopyWith<$Res> {
  factory _$ScheduledIntakeCopyWith(_ScheduledIntake value, $Res Function(_ScheduledIntake) _then) = __$ScheduledIntakeCopyWithImpl;
@override @useResult
$Res call({
 String courseId, String productId, String productName, double servingSize, Duration timeOfDay, DateTime scheduledAtUtc, bool isTaken, String? intakeLogId, DateTime? takenAtUtc
});




}
/// @nodoc
class __$ScheduledIntakeCopyWithImpl<$Res>
    implements _$ScheduledIntakeCopyWith<$Res> {
  __$ScheduledIntakeCopyWithImpl(this._self, this._then);

  final _ScheduledIntake _self;
  final $Res Function(_ScheduledIntake) _then;

/// Create a copy of ScheduledIntake
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courseId = null,Object? productId = null,Object? productName = null,Object? servingSize = null,Object? timeOfDay = null,Object? scheduledAtUtc = null,Object? isTaken = null,Object? intakeLogId = freezed,Object? takenAtUtc = freezed,}) {
  return _then(_ScheduledIntake(
courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,servingSize: null == servingSize ? _self.servingSize : servingSize // ignore: cast_nullable_to_non_nullable
as double,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as Duration,scheduledAtUtc: null == scheduledAtUtc ? _self.scheduledAtUtc : scheduledAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,isTaken: null == isTaken ? _self.isTaken : isTaken // ignore: cast_nullable_to_non_nullable
as bool,intakeLogId: freezed == intakeLogId ? _self.intakeLogId : intakeLogId // ignore: cast_nullable_to_non_nullable
as String?,takenAtUtc: freezed == takenAtUtc ? _self.takenAtUtc : takenAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
