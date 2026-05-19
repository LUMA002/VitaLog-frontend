// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intake_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IntakeLog {

 String get id; String get courseId; String? get userId; double get actualServingSize; DateTime get takenAtUtc; DateTime get updatedAtUtc; DateTime? get deletedAtUtc;
/// Create a copy of IntakeLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntakeLogCopyWith<IntakeLog> get copyWith => _$IntakeLogCopyWithImpl<IntakeLog>(this as IntakeLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntakeLog&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.actualServingSize, actualServingSize) || other.actualServingSize == actualServingSize)&&(identical(other.takenAtUtc, takenAtUtc) || other.takenAtUtc == takenAtUtc)&&(identical(other.updatedAtUtc, updatedAtUtc) || other.updatedAtUtc == updatedAtUtc)&&(identical(other.deletedAtUtc, deletedAtUtc) || other.deletedAtUtc == deletedAtUtc));
}


@override
int get hashCode => Object.hash(runtimeType,id,courseId,userId,actualServingSize,takenAtUtc,updatedAtUtc,deletedAtUtc);

@override
String toString() {
  return 'IntakeLog(id: $id, courseId: $courseId, userId: $userId, actualServingSize: $actualServingSize, takenAtUtc: $takenAtUtc, updatedAtUtc: $updatedAtUtc, deletedAtUtc: $deletedAtUtc)';
}


}

/// @nodoc
abstract mixin class $IntakeLogCopyWith<$Res>  {
  factory $IntakeLogCopyWith(IntakeLog value, $Res Function(IntakeLog) _then) = _$IntakeLogCopyWithImpl;
@useResult
$Res call({
 String id, String courseId, String? userId, double actualServingSize, DateTime takenAtUtc, DateTime updatedAtUtc, DateTime? deletedAtUtc
});




}
/// @nodoc
class _$IntakeLogCopyWithImpl<$Res>
    implements $IntakeLogCopyWith<$Res> {
  _$IntakeLogCopyWithImpl(this._self, this._then);

  final IntakeLog _self;
  final $Res Function(IntakeLog) _then;

/// Create a copy of IntakeLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? userId = freezed,Object? actualServingSize = null,Object? takenAtUtc = null,Object? updatedAtUtc = null,Object? deletedAtUtc = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,actualServingSize: null == actualServingSize ? _self.actualServingSize : actualServingSize // ignore: cast_nullable_to_non_nullable
as double,takenAtUtc: null == takenAtUtc ? _self.takenAtUtc : takenAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAtUtc: null == updatedAtUtc ? _self.updatedAtUtc : updatedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAtUtc: freezed == deletedAtUtc ? _self.deletedAtUtc : deletedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [IntakeLog].
extension IntakeLogPatterns on IntakeLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IntakeLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IntakeLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IntakeLog value)  $default,){
final _that = this;
switch (_that) {
case _IntakeLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IntakeLog value)?  $default,){
final _that = this;
switch (_that) {
case _IntakeLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String courseId,  String? userId,  double actualServingSize,  DateTime takenAtUtc,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IntakeLog() when $default != null:
return $default(_that.id,_that.courseId,_that.userId,_that.actualServingSize,_that.takenAtUtc,_that.updatedAtUtc,_that.deletedAtUtc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String courseId,  String? userId,  double actualServingSize,  DateTime takenAtUtc,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)  $default,) {final _that = this;
switch (_that) {
case _IntakeLog():
return $default(_that.id,_that.courseId,_that.userId,_that.actualServingSize,_that.takenAtUtc,_that.updatedAtUtc,_that.deletedAtUtc);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String courseId,  String? userId,  double actualServingSize,  DateTime takenAtUtc,  DateTime updatedAtUtc,  DateTime? deletedAtUtc)?  $default,) {final _that = this;
switch (_that) {
case _IntakeLog() when $default != null:
return $default(_that.id,_that.courseId,_that.userId,_that.actualServingSize,_that.takenAtUtc,_that.updatedAtUtc,_that.deletedAtUtc);case _:
  return null;

}
}

}

/// @nodoc


class _IntakeLog implements IntakeLog {
  const _IntakeLog({required this.id, required this.courseId, required this.userId, required this.actualServingSize, required this.takenAtUtc, required this.updatedAtUtc, required this.deletedAtUtc});
  

@override final  String id;
@override final  String courseId;
@override final  String? userId;
@override final  double actualServingSize;
@override final  DateTime takenAtUtc;
@override final  DateTime updatedAtUtc;
@override final  DateTime? deletedAtUtc;

/// Create a copy of IntakeLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntakeLogCopyWith<_IntakeLog> get copyWith => __$IntakeLogCopyWithImpl<_IntakeLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntakeLog&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.actualServingSize, actualServingSize) || other.actualServingSize == actualServingSize)&&(identical(other.takenAtUtc, takenAtUtc) || other.takenAtUtc == takenAtUtc)&&(identical(other.updatedAtUtc, updatedAtUtc) || other.updatedAtUtc == updatedAtUtc)&&(identical(other.deletedAtUtc, deletedAtUtc) || other.deletedAtUtc == deletedAtUtc));
}


@override
int get hashCode => Object.hash(runtimeType,id,courseId,userId,actualServingSize,takenAtUtc,updatedAtUtc,deletedAtUtc);

@override
String toString() {
  return 'IntakeLog(id: $id, courseId: $courseId, userId: $userId, actualServingSize: $actualServingSize, takenAtUtc: $takenAtUtc, updatedAtUtc: $updatedAtUtc, deletedAtUtc: $deletedAtUtc)';
}


}

/// @nodoc
abstract mixin class _$IntakeLogCopyWith<$Res> implements $IntakeLogCopyWith<$Res> {
  factory _$IntakeLogCopyWith(_IntakeLog value, $Res Function(_IntakeLog) _then) = __$IntakeLogCopyWithImpl;
@override @useResult
$Res call({
 String id, String courseId, String? userId, double actualServingSize, DateTime takenAtUtc, DateTime updatedAtUtc, DateTime? deletedAtUtc
});




}
/// @nodoc
class __$IntakeLogCopyWithImpl<$Res>
    implements _$IntakeLogCopyWith<$Res> {
  __$IntakeLogCopyWithImpl(this._self, this._then);

  final _IntakeLog _self;
  final $Res Function(_IntakeLog) _then;

/// Create a copy of IntakeLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? userId = freezed,Object? actualServingSize = null,Object? takenAtUtc = null,Object? updatedAtUtc = null,Object? deletedAtUtc = freezed,}) {
  return _then(_IntakeLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,actualServingSize: null == actualServingSize ? _self.actualServingSize : actualServingSize // ignore: cast_nullable_to_non_nullable
as double,takenAtUtc: null == takenAtUtc ? _self.takenAtUtc : takenAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAtUtc: null == updatedAtUtc ? _self.updatedAtUtc : updatedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAtUtc: freezed == deletedAtUtc ? _self.deletedAtUtc : deletedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
