// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_course_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncCourseDto {

 String get id; String get productId;@DecimalAsStringConverter() double get servingSize;@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) Duration get timeOfDay;@JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson) DateTime get startDate;@JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson) DateTime? get endDate;@MicrosecondDateTimeJsonConverter() DateTime get updatedAt;@MicrosecondDateTimeJsonConverter() DateTime? get deletedAt;
/// Create a copy of SyncCourseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncCourseDtoCopyWith<SyncCourseDto> get copyWith => _$SyncCourseDtoCopyWithImpl<SyncCourseDto>(this as SyncCourseDto, _$identity);

  /// Serializes this SyncCourseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncCourseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.servingSize, servingSize) || other.servingSize == servingSize)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,servingSize,timeOfDay,startDate,endDate,updatedAt,deletedAt);

@override
String toString() {
  return 'SyncCourseDto(id: $id, productId: $productId, servingSize: $servingSize, timeOfDay: $timeOfDay, startDate: $startDate, endDate: $endDate, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $SyncCourseDtoCopyWith<$Res>  {
  factory $SyncCourseDtoCopyWith(SyncCourseDto value, $Res Function(SyncCourseDto) _then) = _$SyncCourseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String productId,@DecimalAsStringConverter() double servingSize,@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) Duration timeOfDay,@JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson) DateTime startDate,@JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson) DateTime? endDate,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt
});




}
/// @nodoc
class _$SyncCourseDtoCopyWithImpl<$Res>
    implements $SyncCourseDtoCopyWith<$Res> {
  _$SyncCourseDtoCopyWithImpl(this._self, this._then);

  final SyncCourseDto _self;
  final $Res Function(SyncCourseDto) _then;

/// Create a copy of SyncCourseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? servingSize = null,Object? timeOfDay = null,Object? startDate = null,Object? endDate = freezed,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,servingSize: null == servingSize ? _self.servingSize : servingSize // ignore: cast_nullable_to_non_nullable
as double,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as Duration,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncCourseDto].
extension SyncCourseDtoPatterns on SyncCourseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncCourseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncCourseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncCourseDto value)  $default,){
final _that = this;
switch (_that) {
case _SyncCourseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncCourseDto value)?  $default,){
final _that = this;
switch (_that) {
case _SyncCourseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId, @DecimalAsStringConverter()  double servingSize, @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)  Duration timeOfDay, @JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson)  DateTime startDate, @JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson)  DateTime? endDate, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncCourseDto() when $default != null:
return $default(_that.id,_that.productId,_that.servingSize,_that.timeOfDay,_that.startDate,_that.endDate,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId, @DecimalAsStringConverter()  double servingSize, @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)  Duration timeOfDay, @JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson)  DateTime startDate, @JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson)  DateTime? endDate, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _SyncCourseDto():
return $default(_that.id,_that.productId,_that.servingSize,_that.timeOfDay,_that.startDate,_that.endDate,_that.updatedAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId, @DecimalAsStringConverter()  double servingSize, @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)  Duration timeOfDay, @JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson)  DateTime startDate, @JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson)  DateTime? endDate, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _SyncCourseDto() when $default != null:
return $default(_that.id,_that.productId,_that.servingSize,_that.timeOfDay,_that.startDate,_that.endDate,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncCourseDto implements SyncCourseDto {
  const _SyncCourseDto({required this.id, required this.productId, @DecimalAsStringConverter() required this.servingSize, @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) required this.timeOfDay, @JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson) required this.startDate, @JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson) required this.endDate, @MicrosecondDateTimeJsonConverter() required this.updatedAt, @MicrosecondDateTimeJsonConverter() required this.deletedAt});
  factory _SyncCourseDto.fromJson(Map<String, dynamic> json) => _$SyncCourseDtoFromJson(json);

@override final  String id;
@override final  String productId;
@override@DecimalAsStringConverter() final  double servingSize;
@override@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) final  Duration timeOfDay;
@override@JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson) final  DateTime startDate;
@override@JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson) final  DateTime? endDate;
@override@MicrosecondDateTimeJsonConverter() final  DateTime updatedAt;
@override@MicrosecondDateTimeJsonConverter() final  DateTime? deletedAt;

/// Create a copy of SyncCourseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncCourseDtoCopyWith<_SyncCourseDto> get copyWith => __$SyncCourseDtoCopyWithImpl<_SyncCourseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncCourseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncCourseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.servingSize, servingSize) || other.servingSize == servingSize)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,servingSize,timeOfDay,startDate,endDate,updatedAt,deletedAt);

@override
String toString() {
  return 'SyncCourseDto(id: $id, productId: $productId, servingSize: $servingSize, timeOfDay: $timeOfDay, startDate: $startDate, endDate: $endDate, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$SyncCourseDtoCopyWith<$Res> implements $SyncCourseDtoCopyWith<$Res> {
  factory _$SyncCourseDtoCopyWith(_SyncCourseDto value, $Res Function(_SyncCourseDto) _then) = __$SyncCourseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId,@DecimalAsStringConverter() double servingSize,@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) Duration timeOfDay,@JsonKey(fromJson: _dateOnlyFromJson, toJson: _dateOnlyToJson) DateTime startDate,@JsonKey(fromJson: _nullableDateOnlyFromJson, toJson: _nullableDateOnlyToJson) DateTime? endDate,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt
});




}
/// @nodoc
class __$SyncCourseDtoCopyWithImpl<$Res>
    implements _$SyncCourseDtoCopyWith<$Res> {
  __$SyncCourseDtoCopyWithImpl(this._self, this._then);

  final _SyncCourseDto _self;
  final $Res Function(_SyncCourseDto) _then;

/// Create a copy of SyncCourseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? servingSize = null,Object? timeOfDay = null,Object? startDate = null,Object? endDate = freezed,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_SyncCourseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,servingSize: null == servingSize ? _self.servingSize : servingSize // ignore: cast_nullable_to_non_nullable
as double,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as Duration,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
