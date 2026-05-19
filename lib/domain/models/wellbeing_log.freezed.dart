// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellbeing_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WellbeingLog {

 String get id; DateTime get recordedAtUtc; int get mood; int get energy; double? get sleepHours; String? get notes; DateTime get createdAtUtc; DateTime get updatedAtUtc; int get syncFlags;
/// Create a copy of WellbeingLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WellbeingLogCopyWith<WellbeingLog> get copyWith => _$WellbeingLogCopyWithImpl<WellbeingLog>(this as WellbeingLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WellbeingLog&&(identical(other.id, id) || other.id == id)&&(identical(other.recordedAtUtc, recordedAtUtc) || other.recordedAtUtc == recordedAtUtc)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAtUtc, createdAtUtc) || other.createdAtUtc == createdAtUtc)&&(identical(other.updatedAtUtc, updatedAtUtc) || other.updatedAtUtc == updatedAtUtc)&&(identical(other.syncFlags, syncFlags) || other.syncFlags == syncFlags));
}


@override
int get hashCode => Object.hash(runtimeType,id,recordedAtUtc,mood,energy,sleepHours,notes,createdAtUtc,updatedAtUtc,syncFlags);

@override
String toString() {
  return 'WellbeingLog(id: $id, recordedAtUtc: $recordedAtUtc, mood: $mood, energy: $energy, sleepHours: $sleepHours, notes: $notes, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, syncFlags: $syncFlags)';
}


}

/// @nodoc
abstract mixin class $WellbeingLogCopyWith<$Res>  {
  factory $WellbeingLogCopyWith(WellbeingLog value, $Res Function(WellbeingLog) _then) = _$WellbeingLogCopyWithImpl;
@useResult
$Res call({
 String id, DateTime recordedAtUtc, int mood, int energy, double? sleepHours, String? notes, DateTime createdAtUtc, DateTime updatedAtUtc, int syncFlags
});




}
/// @nodoc
class _$WellbeingLogCopyWithImpl<$Res>
    implements $WellbeingLogCopyWith<$Res> {
  _$WellbeingLogCopyWithImpl(this._self, this._then);

  final WellbeingLog _self;
  final $Res Function(WellbeingLog) _then;

/// Create a copy of WellbeingLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recordedAtUtc = null,Object? mood = null,Object? energy = null,Object? sleepHours = freezed,Object? notes = freezed,Object? createdAtUtc = null,Object? updatedAtUtc = null,Object? syncFlags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recordedAtUtc: null == recordedAtUtc ? _self.recordedAtUtc : recordedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as int,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as int,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAtUtc: null == createdAtUtc ? _self.createdAtUtc : createdAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAtUtc: null == updatedAtUtc ? _self.updatedAtUtc : updatedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,syncFlags: null == syncFlags ? _self.syncFlags : syncFlags // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WellbeingLog].
extension WellbeingLogPatterns on WellbeingLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WellbeingLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WellbeingLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WellbeingLog value)  $default,){
final _that = this;
switch (_that) {
case _WellbeingLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WellbeingLog value)?  $default,){
final _that = this;
switch (_that) {
case _WellbeingLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime recordedAtUtc,  int mood,  int energy,  double? sleepHours,  String? notes,  DateTime createdAtUtc,  DateTime updatedAtUtc,  int syncFlags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WellbeingLog() when $default != null:
return $default(_that.id,_that.recordedAtUtc,_that.mood,_that.energy,_that.sleepHours,_that.notes,_that.createdAtUtc,_that.updatedAtUtc,_that.syncFlags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime recordedAtUtc,  int mood,  int energy,  double? sleepHours,  String? notes,  DateTime createdAtUtc,  DateTime updatedAtUtc,  int syncFlags)  $default,) {final _that = this;
switch (_that) {
case _WellbeingLog():
return $default(_that.id,_that.recordedAtUtc,_that.mood,_that.energy,_that.sleepHours,_that.notes,_that.createdAtUtc,_that.updatedAtUtc,_that.syncFlags);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime recordedAtUtc,  int mood,  int energy,  double? sleepHours,  String? notes,  DateTime createdAtUtc,  DateTime updatedAtUtc,  int syncFlags)?  $default,) {final _that = this;
switch (_that) {
case _WellbeingLog() when $default != null:
return $default(_that.id,_that.recordedAtUtc,_that.mood,_that.energy,_that.sleepHours,_that.notes,_that.createdAtUtc,_that.updatedAtUtc,_that.syncFlags);case _:
  return null;

}
}

}

/// @nodoc


class _WellbeingLog implements WellbeingLog {
  const _WellbeingLog({required this.id, required this.recordedAtUtc, required this.mood, required this.energy, required this.sleepHours, required this.notes, required this.createdAtUtc, required this.updatedAtUtc, required this.syncFlags});
  

@override final  String id;
@override final  DateTime recordedAtUtc;
@override final  int mood;
@override final  int energy;
@override final  double? sleepHours;
@override final  String? notes;
@override final  DateTime createdAtUtc;
@override final  DateTime updatedAtUtc;
@override final  int syncFlags;

/// Create a copy of WellbeingLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WellbeingLogCopyWith<_WellbeingLog> get copyWith => __$WellbeingLogCopyWithImpl<_WellbeingLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WellbeingLog&&(identical(other.id, id) || other.id == id)&&(identical(other.recordedAtUtc, recordedAtUtc) || other.recordedAtUtc == recordedAtUtc)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAtUtc, createdAtUtc) || other.createdAtUtc == createdAtUtc)&&(identical(other.updatedAtUtc, updatedAtUtc) || other.updatedAtUtc == updatedAtUtc)&&(identical(other.syncFlags, syncFlags) || other.syncFlags == syncFlags));
}


@override
int get hashCode => Object.hash(runtimeType,id,recordedAtUtc,mood,energy,sleepHours,notes,createdAtUtc,updatedAtUtc,syncFlags);

@override
String toString() {
  return 'WellbeingLog(id: $id, recordedAtUtc: $recordedAtUtc, mood: $mood, energy: $energy, sleepHours: $sleepHours, notes: $notes, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, syncFlags: $syncFlags)';
}


}

/// @nodoc
abstract mixin class _$WellbeingLogCopyWith<$Res> implements $WellbeingLogCopyWith<$Res> {
  factory _$WellbeingLogCopyWith(_WellbeingLog value, $Res Function(_WellbeingLog) _then) = __$WellbeingLogCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime recordedAtUtc, int mood, int energy, double? sleepHours, String? notes, DateTime createdAtUtc, DateTime updatedAtUtc, int syncFlags
});




}
/// @nodoc
class __$WellbeingLogCopyWithImpl<$Res>
    implements _$WellbeingLogCopyWith<$Res> {
  __$WellbeingLogCopyWithImpl(this._self, this._then);

  final _WellbeingLog _self;
  final $Res Function(_WellbeingLog) _then;

/// Create a copy of WellbeingLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recordedAtUtc = null,Object? mood = null,Object? energy = null,Object? sleepHours = freezed,Object? notes = freezed,Object? createdAtUtc = null,Object? updatedAtUtc = null,Object? syncFlags = null,}) {
  return _then(_WellbeingLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recordedAtUtc: null == recordedAtUtc ? _self.recordedAtUtc : recordedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as int,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as int,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAtUtc: null == createdAtUtc ? _self.createdAtUtc : createdAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAtUtc: null == updatedAtUtc ? _self.updatedAtUtc : updatedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,syncFlags: null == syncFlags ? _self.syncFlags : syncFlags // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
