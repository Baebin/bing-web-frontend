// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bio_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BioUpdateRequest {

 String get bio;
/// Create a copy of BioUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BioUpdateRequestCopyWith<BioUpdateRequest> get copyWith => _$BioUpdateRequestCopyWithImpl<BioUpdateRequest>(this as BioUpdateRequest, _$identity);

  /// Serializes this BioUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BioUpdateRequest&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio);

@override
String toString() {
  return 'BioUpdateRequest(bio: $bio)';
}


}

/// @nodoc
abstract mixin class $BioUpdateRequestCopyWith<$Res>  {
  factory $BioUpdateRequestCopyWith(BioUpdateRequest value, $Res Function(BioUpdateRequest) _then) = _$BioUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String bio
});




}
/// @nodoc
class _$BioUpdateRequestCopyWithImpl<$Res>
    implements $BioUpdateRequestCopyWith<$Res> {
  _$BioUpdateRequestCopyWithImpl(this._self, this._then);

  final BioUpdateRequest _self;
  final $Res Function(BioUpdateRequest) _then;

/// Create a copy of BioUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bio = null,}) {
  return _then(_self.copyWith(
bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BioUpdateRequest].
extension BioUpdateRequestPatterns on BioUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BioUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BioUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BioUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _BioUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BioUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BioUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BioUpdateRequest() when $default != null:
return $default(_that.bio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bio)  $default,) {final _that = this;
switch (_that) {
case _BioUpdateRequest():
return $default(_that.bio);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bio)?  $default,) {final _that = this;
switch (_that) {
case _BioUpdateRequest() when $default != null:
return $default(_that.bio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BioUpdateRequest implements BioUpdateRequest {
  const _BioUpdateRequest({required this.bio});
  factory _BioUpdateRequest.fromJson(Map<String, dynamic> json) => _$BioUpdateRequestFromJson(json);

@override final  String bio;

/// Create a copy of BioUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BioUpdateRequestCopyWith<_BioUpdateRequest> get copyWith => __$BioUpdateRequestCopyWithImpl<_BioUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BioUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BioUpdateRequest&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio);

@override
String toString() {
  return 'BioUpdateRequest(bio: $bio)';
}


}

/// @nodoc
abstract mixin class _$BioUpdateRequestCopyWith<$Res> implements $BioUpdateRequestCopyWith<$Res> {
  factory _$BioUpdateRequestCopyWith(_BioUpdateRequest value, $Res Function(_BioUpdateRequest) _then) = __$BioUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String bio
});




}
/// @nodoc
class __$BioUpdateRequestCopyWithImpl<$Res>
    implements _$BioUpdateRequestCopyWith<$Res> {
  __$BioUpdateRequestCopyWithImpl(this._self, this._then);

  final _BioUpdateRequest _self;
  final $Res Function(_BioUpdateRequest) _then;

/// Create a copy of BioUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bio = null,}) {
  return _then(_BioUpdateRequest(
bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
