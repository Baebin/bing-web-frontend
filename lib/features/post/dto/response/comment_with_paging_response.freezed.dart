// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_with_paging_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentWithPagingResponse {

 List<CommentResponse> get comments; int? get lastParentIdx; bool get isLast;
/// Create a copy of CommentWithPagingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentWithPagingResponseCopyWith<CommentWithPagingResponse> get copyWith => _$CommentWithPagingResponseCopyWithImpl<CommentWithPagingResponse>(this as CommentWithPagingResponse, _$identity);

  /// Serializes this CommentWithPagingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentWithPagingResponse&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.lastParentIdx, lastParentIdx) || other.lastParentIdx == lastParentIdx)&&(identical(other.isLast, isLast) || other.isLast == isLast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(comments),lastParentIdx,isLast);

@override
String toString() {
  return 'CommentWithPagingResponse(comments: $comments, lastParentIdx: $lastParentIdx, isLast: $isLast)';
}


}

/// @nodoc
abstract mixin class $CommentWithPagingResponseCopyWith<$Res>  {
  factory $CommentWithPagingResponseCopyWith(CommentWithPagingResponse value, $Res Function(CommentWithPagingResponse) _then) = _$CommentWithPagingResponseCopyWithImpl;
@useResult
$Res call({
 List<CommentResponse> comments, int? lastParentIdx, bool isLast
});




}
/// @nodoc
class _$CommentWithPagingResponseCopyWithImpl<$Res>
    implements $CommentWithPagingResponseCopyWith<$Res> {
  _$CommentWithPagingResponseCopyWithImpl(this._self, this._then);

  final CommentWithPagingResponse _self;
  final $Res Function(CommentWithPagingResponse) _then;

/// Create a copy of CommentWithPagingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comments = null,Object? lastParentIdx = freezed,Object? isLast = null,}) {
  return _then(_self.copyWith(
comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentResponse>,lastParentIdx: freezed == lastParentIdx ? _self.lastParentIdx : lastParentIdx // ignore: cast_nullable_to_non_nullable
as int?,isLast: null == isLast ? _self.isLast : isLast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentWithPagingResponse].
extension CommentWithPagingResponsePatterns on CommentWithPagingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentWithPagingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentWithPagingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentWithPagingResponse value)  $default,){
final _that = this;
switch (_that) {
case _CommentWithPagingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentWithPagingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CommentWithPagingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CommentResponse> comments,  int? lastParentIdx,  bool isLast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentWithPagingResponse() when $default != null:
return $default(_that.comments,_that.lastParentIdx,_that.isLast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CommentResponse> comments,  int? lastParentIdx,  bool isLast)  $default,) {final _that = this;
switch (_that) {
case _CommentWithPagingResponse():
return $default(_that.comments,_that.lastParentIdx,_that.isLast);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CommentResponse> comments,  int? lastParentIdx,  bool isLast)?  $default,) {final _that = this;
switch (_that) {
case _CommentWithPagingResponse() when $default != null:
return $default(_that.comments,_that.lastParentIdx,_that.isLast);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CommentWithPagingResponse implements CommentWithPagingResponse {
  const _CommentWithPagingResponse({required final  List<CommentResponse> comments, this.lastParentIdx, required this.isLast}): _comments = comments;
  factory _CommentWithPagingResponse.fromJson(Map<String, dynamic> json) => _$CommentWithPagingResponseFromJson(json);

 final  List<CommentResponse> _comments;
@override List<CommentResponse> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  int? lastParentIdx;
@override final  bool isLast;

/// Create a copy of CommentWithPagingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentWithPagingResponseCopyWith<_CommentWithPagingResponse> get copyWith => __$CommentWithPagingResponseCopyWithImpl<_CommentWithPagingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentWithPagingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentWithPagingResponse&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.lastParentIdx, lastParentIdx) || other.lastParentIdx == lastParentIdx)&&(identical(other.isLast, isLast) || other.isLast == isLast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments),lastParentIdx,isLast);

@override
String toString() {
  return 'CommentWithPagingResponse(comments: $comments, lastParentIdx: $lastParentIdx, isLast: $isLast)';
}


}

/// @nodoc
abstract mixin class _$CommentWithPagingResponseCopyWith<$Res> implements $CommentWithPagingResponseCopyWith<$Res> {
  factory _$CommentWithPagingResponseCopyWith(_CommentWithPagingResponse value, $Res Function(_CommentWithPagingResponse) _then) = __$CommentWithPagingResponseCopyWithImpl;
@override @useResult
$Res call({
 List<CommentResponse> comments, int? lastParentIdx, bool isLast
});




}
/// @nodoc
class __$CommentWithPagingResponseCopyWithImpl<$Res>
    implements _$CommentWithPagingResponseCopyWith<$Res> {
  __$CommentWithPagingResponseCopyWithImpl(this._self, this._then);

  final _CommentWithPagingResponse _self;
  final $Res Function(_CommentWithPagingResponse) _then;

/// Create a copy of CommentWithPagingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comments = null,Object? lastParentIdx = freezed,Object? isLast = null,}) {
  return _then(_CommentWithPagingResponse(
comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentResponse>,lastParentIdx: freezed == lastParentIdx ? _self.lastParentIdx : lastParentIdx // ignore: cast_nullable_to_non_nullable
as int?,isLast: null == isLast ? _self.isLast : isLast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
