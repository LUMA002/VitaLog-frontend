// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_intake_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncIntakeLogDto {

 String get id; String get courseId;@DecimalAsStringConverter() double get actualServingSize;@MicrosecondDateTimeJsonConverter() DateTime get takenAt;@MicrosecondDateTimeJsonConverter() DateTime get updatedAt;@MicrosecondDateTimeJsonConverter() DateTime? get deletedAt;
/// Create a copy of SyncIntakeLogDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncIntakeLogDtoCopyWith<SyncIntakeLogDto> get copyWith => _$SyncIntakeLogDtoCopyWithImpl<SyncIntakeLogDto>(this as SyncIntakeLogDto, _$identity);

  /// Serializes this SyncIntakeLogDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncIntakeLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.actualServingSize, actualServingSize) || other.actualServingSize == actualServingSize)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,actualServingSize,takenAt,updatedAt,deletedAt);

@override
String toString() {
  return 'SyncIntakeLogDto(id: $id, courseId: $courseId, actualServingSize: $actualServingSize, takenAt: $takenAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $SyncIntakeLogDtoCopyWith<$Res>  {
  factory $SyncIntakeLogDtoCopyWith(SyncIntakeLogDto value, $Res Function(SyncIntakeLogDto) _then) = _$SyncIntakeLogDtoCopyWithImpl;
@useResult
$Res call({
 String id, String courseId,@DecimalAsStringConverter() double actualServingSize,@MicrosecondDateTimeJsonConverter() DateTime takenAt,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt
});




}
/// @nodoc
class _$SyncIntakeLogDtoCopyWithImpl<$Res>
    implements $SyncIntakeLogDtoCopyWith<$Res> {
  _$SyncIntakeLogDtoCopyWithImpl(this._self, this._then);

  final SyncIntakeLogDto _self;
  final $Res Function(SyncIntakeLogDto) _then;

/// Create a copy of SyncIntakeLogDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? actualServingSize = null,Object? takenAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,actualServingSize: null == actualServingSize ? _self.actualServingSize : actualServingSize // ignore: cast_nullable_to_non_nullable
as double,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncIntakeLogDto].
extension SyncIntakeLogDtoPatterns on SyncIntakeLogDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncIntakeLogDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncIntakeLogDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncIntakeLogDto value)  $default,){
final _that = this;
switch (_that) {
case _SyncIntakeLogDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncIntakeLogDto value)?  $default,){
final _that = this;
switch (_that) {
case _SyncIntakeLogDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String courseId, @DecimalAsStringConverter()  double actualServingSize, @MicrosecondDateTimeJsonConverter()  DateTime takenAt, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncIntakeLogDto() when $default != null:
return $default(_that.id,_that.courseId,_that.actualServingSize,_that.takenAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String courseId, @DecimalAsStringConverter()  double actualServingSize, @MicrosecondDateTimeJsonConverter()  DateTime takenAt, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _SyncIntakeLogDto():
return $default(_that.id,_that.courseId,_that.actualServingSize,_that.takenAt,_that.updatedAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String courseId, @DecimalAsStringConverter()  double actualServingSize, @MicrosecondDateTimeJsonConverter()  DateTime takenAt, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _SyncIntakeLogDto() when $default != null:
return $default(_that.id,_that.courseId,_that.actualServingSize,_that.takenAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncIntakeLogDto implements SyncIntakeLogDto {
  const _SyncIntakeLogDto({required this.id, required this.courseId, @DecimalAsStringConverter() required this.actualServingSize, @MicrosecondDateTimeJsonConverter() required this.takenAt, @MicrosecondDateTimeJsonConverter() required this.updatedAt, @MicrosecondDateTimeJsonConverter() required this.deletedAt});
  factory _SyncIntakeLogDto.fromJson(Map<String, dynamic> json) => _$SyncIntakeLogDtoFromJson(json);

@override final  String id;
@override final  String courseId;
@override@DecimalAsStringConverter() final  double actualServingSize;
@override@MicrosecondDateTimeJsonConverter() final  DateTime takenAt;
@override@MicrosecondDateTimeJsonConverter() final  DateTime updatedAt;
@override@MicrosecondDateTimeJsonConverter() final  DateTime? deletedAt;

/// Create a copy of SyncIntakeLogDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncIntakeLogDtoCopyWith<_SyncIntakeLogDto> get copyWith => __$SyncIntakeLogDtoCopyWithImpl<_SyncIntakeLogDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncIntakeLogDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncIntakeLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.actualServingSize, actualServingSize) || other.actualServingSize == actualServingSize)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseId,actualServingSize,takenAt,updatedAt,deletedAt);

@override
String toString() {
  return 'SyncIntakeLogDto(id: $id, courseId: $courseId, actualServingSize: $actualServingSize, takenAt: $takenAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$SyncIntakeLogDtoCopyWith<$Res> implements $SyncIntakeLogDtoCopyWith<$Res> {
  factory _$SyncIntakeLogDtoCopyWith(_SyncIntakeLogDto value, $Res Function(_SyncIntakeLogDto) _then) = __$SyncIntakeLogDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String courseId,@DecimalAsStringConverter() double actualServingSize,@MicrosecondDateTimeJsonConverter() DateTime takenAt,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt
});




}
/// @nodoc
class __$SyncIntakeLogDtoCopyWithImpl<$Res>
    implements _$SyncIntakeLogDtoCopyWith<$Res> {
  __$SyncIntakeLogDtoCopyWithImpl(this._self, this._then);

  final _SyncIntakeLogDto _self;
  final $Res Function(_SyncIntakeLogDto) _then;

/// Create a copy of SyncIntakeLogDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? actualServingSize = null,Object? takenAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_SyncIntakeLogDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,actualServingSize: null == actualServingSize ? _self.actualServingSize : actualServingSize // ignore: cast_nullable_to_non_nullable
as double,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
