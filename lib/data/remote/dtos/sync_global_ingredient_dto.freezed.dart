// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_global_ingredient_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncGlobalIngredientDto {

 String get id; String get name; String get defaultUnit;@JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson) IngredientCategory get category;@MicrosecondDateTimeJsonConverter() DateTime get updatedAt;@MicrosecondDateTimeJsonConverter() DateTime? get deletedAt;
/// Create a copy of SyncGlobalIngredientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncGlobalIngredientDtoCopyWith<SyncGlobalIngredientDto> get copyWith => _$SyncGlobalIngredientDtoCopyWithImpl<SyncGlobalIngredientDto>(this as SyncGlobalIngredientDto, _$identity);

  /// Serializes this SyncGlobalIngredientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncGlobalIngredientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultUnit, defaultUnit) || other.defaultUnit == defaultUnit)&&(identical(other.category, category) || other.category == category)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,defaultUnit,category,updatedAt,deletedAt);

@override
String toString() {
  return 'SyncGlobalIngredientDto(id: $id, name: $name, defaultUnit: $defaultUnit, category: $category, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $SyncGlobalIngredientDtoCopyWith<$Res>  {
  factory $SyncGlobalIngredientDtoCopyWith(SyncGlobalIngredientDto value, $Res Function(SyncGlobalIngredientDto) _then) = _$SyncGlobalIngredientDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String defaultUnit,@JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson) IngredientCategory category,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt
});




}
/// @nodoc
class _$SyncGlobalIngredientDtoCopyWithImpl<$Res>
    implements $SyncGlobalIngredientDtoCopyWith<$Res> {
  _$SyncGlobalIngredientDtoCopyWithImpl(this._self, this._then);

  final SyncGlobalIngredientDto _self;
  final $Res Function(SyncGlobalIngredientDto) _then;

/// Create a copy of SyncGlobalIngredientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? defaultUnit = null,Object? category = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,defaultUnit: null == defaultUnit ? _self.defaultUnit : defaultUnit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IngredientCategory,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncGlobalIngredientDto].
extension SyncGlobalIngredientDtoPatterns on SyncGlobalIngredientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncGlobalIngredientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncGlobalIngredientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncGlobalIngredientDto value)  $default,){
final _that = this;
switch (_that) {
case _SyncGlobalIngredientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncGlobalIngredientDto value)?  $default,){
final _that = this;
switch (_that) {
case _SyncGlobalIngredientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String defaultUnit, @JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson)  IngredientCategory category, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncGlobalIngredientDto() when $default != null:
return $default(_that.id,_that.name,_that.defaultUnit,_that.category,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String defaultUnit, @JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson)  IngredientCategory category, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _SyncGlobalIngredientDto():
return $default(_that.id,_that.name,_that.defaultUnit,_that.category,_that.updatedAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String defaultUnit, @JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson)  IngredientCategory category, @MicrosecondDateTimeJsonConverter()  DateTime updatedAt, @MicrosecondDateTimeJsonConverter()  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _SyncGlobalIngredientDto() when $default != null:
return $default(_that.id,_that.name,_that.defaultUnit,_that.category,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncGlobalIngredientDto implements SyncGlobalIngredientDto {
  const _SyncGlobalIngredientDto({required this.id, required this.name, required this.defaultUnit, @JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson) required this.category, @MicrosecondDateTimeJsonConverter() required this.updatedAt, @MicrosecondDateTimeJsonConverter() required this.deletedAt});
  factory _SyncGlobalIngredientDto.fromJson(Map<String, dynamic> json) => _$SyncGlobalIngredientDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String defaultUnit;
@override@JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson) final  IngredientCategory category;
@override@MicrosecondDateTimeJsonConverter() final  DateTime updatedAt;
@override@MicrosecondDateTimeJsonConverter() final  DateTime? deletedAt;

/// Create a copy of SyncGlobalIngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncGlobalIngredientDtoCopyWith<_SyncGlobalIngredientDto> get copyWith => __$SyncGlobalIngredientDtoCopyWithImpl<_SyncGlobalIngredientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncGlobalIngredientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncGlobalIngredientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultUnit, defaultUnit) || other.defaultUnit == defaultUnit)&&(identical(other.category, category) || other.category == category)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,defaultUnit,category,updatedAt,deletedAt);

@override
String toString() {
  return 'SyncGlobalIngredientDto(id: $id, name: $name, defaultUnit: $defaultUnit, category: $category, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$SyncGlobalIngredientDtoCopyWith<$Res> implements $SyncGlobalIngredientDtoCopyWith<$Res> {
  factory _$SyncGlobalIngredientDtoCopyWith(_SyncGlobalIngredientDto value, $Res Function(_SyncGlobalIngredientDto) _then) = __$SyncGlobalIngredientDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String defaultUnit,@JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson) IngredientCategory category,@MicrosecondDateTimeJsonConverter() DateTime updatedAt,@MicrosecondDateTimeJsonConverter() DateTime? deletedAt
});




}
/// @nodoc
class __$SyncGlobalIngredientDtoCopyWithImpl<$Res>
    implements _$SyncGlobalIngredientDtoCopyWith<$Res> {
  __$SyncGlobalIngredientDtoCopyWithImpl(this._self, this._then);

  final _SyncGlobalIngredientDto _self;
  final $Res Function(_SyncGlobalIngredientDto) _then;

/// Create a copy of SyncGlobalIngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? defaultUnit = null,Object? category = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_SyncGlobalIngredientDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,defaultUnit: null == defaultUnit ? _self.defaultUnit : defaultUnit // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IngredientCategory,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
