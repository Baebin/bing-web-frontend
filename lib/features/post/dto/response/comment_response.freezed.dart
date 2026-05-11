// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentResponse {

 int get idx; int? get parentIdx; int get authorIdx; String get authorNickname; String get authorAvatarUrl; String get content; String get createdAt; String get updatedAt; List<CommentResponse> get children;
/// Create a copy of CommentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentResponseCopyWith<CommentResponse> get copyWith => _$CommentResponseCopyWithImpl<CommentResponse>(this as CommentResponse, _$identity);

  /// Serializes this CommentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentResponse&&(identical(other.idx, idx) || other.idx == idx)&&(identical(other.parentIdx, parentIdx) || other.parentIdx == parentIdx)&&(identical(other.authorIdx, authorIdx) || other.authorIdx == authorIdx)&&(identical(other.authorNickname, authorNickname) || other.authorNickname == authorNickname)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.children, children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idx,parentIdx,authorIdx,authorNickname,authorAvatarUrl,content,createdAt,updatedAt,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'CommentResponse(idx: $idx, parentIdx: $parentIdx, authorIdx: $authorIdx, authorNickname: $authorNickname, authorAvatarUrl: $authorAvatarUrl, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, children: $children)';
}


}

/// @nodoc
abstract mixin class $CommentResponseCopyWith<$Res>  {
  factory $CommentResponseCopyWith(CommentResponse value, $Res Function(CommentResponse) _then) = _$CommentResponseCopyWithImpl;
@useResult
$Res call({
 int idx, int? parentIdx, int authorIdx, String authorNickname, String authorAvatarUrl, String content, String createdAt, String updatedAt, List<CommentResponse> children
});




}
/// @nodoc
class _$CommentResponseCopyWithImpl<$Res>
    implements $CommentResponseCopyWith<$Res> {
  _$CommentResponseCopyWithImpl(this._self, this._then);

  final CommentResponse _self;
  final $Res Function(CommentResponse) _then;

/// Create a copy of CommentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idx = null,Object? parentIdx = freezed,Object? authorIdx = null,Object? authorNickname = null,Object? authorAvatarUrl = null,Object? content = null,Object? createdAt = null,Object? updatedAt = null,Object? children = null,}) {
  return _then(_self.copyWith(
idx: null == idx ? _self.idx : idx // ignore: cast_nullable_to_non_nullable
as int,parentIdx: freezed == parentIdx ? _self.parentIdx : parentIdx // ignore: cast_nullable_to_non_nullable
as int?,authorIdx: null == authorIdx ? _self.authorIdx : authorIdx // ignore: cast_nullable_to_non_nullable
as int,authorNickname: null == authorNickname ? _self.authorNickname : authorNickname // ignore: cast_nullable_to_non_nullable
as String,authorAvatarUrl: null == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<CommentResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentResponse].
extension CommentResponsePatterns on CommentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentResponse value)  $default,){
final _that = this;
switch (_that) {
case _CommentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CommentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int idx,  int? parentIdx,  int authorIdx,  String authorNickname,  String authorAvatarUrl,  String content,  String createdAt,  String updatedAt,  List<CommentResponse> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentResponse() when $default != null:
return $default(_that.idx,_that.parentIdx,_that.authorIdx,_that.authorNickname,_that.authorAvatarUrl,_that.content,_that.createdAt,_that.updatedAt,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int idx,  int? parentIdx,  int authorIdx,  String authorNickname,  String authorAvatarUrl,  String content,  String createdAt,  String updatedAt,  List<CommentResponse> children)  $default,) {final _that = this;
switch (_that) {
case _CommentResponse():
return $default(_that.idx,_that.parentIdx,_that.authorIdx,_that.authorNickname,_that.authorAvatarUrl,_that.content,_that.createdAt,_that.updatedAt,_that.children);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int idx,  int? parentIdx,  int authorIdx,  String authorNickname,  String authorAvatarUrl,  String content,  String createdAt,  String updatedAt,  List<CommentResponse> children)?  $default,) {final _that = this;
switch (_that) {
case _CommentResponse() when $default != null:
return $default(_that.idx,_that.parentIdx,_that.authorIdx,_that.authorNickname,_that.authorAvatarUrl,_that.content,_that.createdAt,_that.updatedAt,_that.children);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CommentResponse implements CommentResponse {
  const _CommentResponse({required this.idx, this.parentIdx, required this.authorIdx, required this.authorNickname, required this.authorAvatarUrl, required this.content, required this.createdAt, required this.updatedAt, final  List<CommentResponse> children = const []}): _children = children;
  factory _CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);

@override final  int idx;
@override final  int? parentIdx;
@override final  int authorIdx;
@override final  String authorNickname;
@override final  String authorAvatarUrl;
@override final  String content;
@override final  String createdAt;
@override final  String updatedAt;
 final  List<CommentResponse> _children;
@override@JsonKey() List<CommentResponse> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of CommentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentResponseCopyWith<_CommentResponse> get copyWith => __$CommentResponseCopyWithImpl<_CommentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentResponse&&(identical(other.idx, idx) || other.idx == idx)&&(identical(other.parentIdx, parentIdx) || other.parentIdx == parentIdx)&&(identical(other.authorIdx, authorIdx) || other.authorIdx == authorIdx)&&(identical(other.authorNickname, authorNickname) || other.authorNickname == authorNickname)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idx,parentIdx,authorIdx,authorNickname,authorAvatarUrl,content,createdAt,updatedAt,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'CommentResponse(idx: $idx, parentIdx: $parentIdx, authorIdx: $authorIdx, authorNickname: $authorNickname, authorAvatarUrl: $authorAvatarUrl, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, children: $children)';
}


}

/// @nodoc
abstract mixin class _$CommentResponseCopyWith<$Res> implements $CommentResponseCopyWith<$Res> {
  factory _$CommentResponseCopyWith(_CommentResponse value, $Res Function(_CommentResponse) _then) = __$CommentResponseCopyWithImpl;
@override @useResult
$Res call({
 int idx, int? parentIdx, int authorIdx, String authorNickname, String authorAvatarUrl, String content, String createdAt, String updatedAt, List<CommentResponse> children
});




}
/// @nodoc
class __$CommentResponseCopyWithImpl<$Res>
    implements _$CommentResponseCopyWith<$Res> {
  __$CommentResponseCopyWithImpl(this._self, this._then);

  final _CommentResponse _self;
  final $Res Function(_CommentResponse) _then;

/// Create a copy of CommentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idx = null,Object? parentIdx = freezed,Object? authorIdx = null,Object? authorNickname = null,Object? authorAvatarUrl = null,Object? content = null,Object? createdAt = null,Object? updatedAt = null,Object? children = null,}) {
  return _then(_CommentResponse(
idx: null == idx ? _self.idx : idx // ignore: cast_nullable_to_non_nullable
as int,parentIdx: freezed == parentIdx ? _self.parentIdx : parentIdx // ignore: cast_nullable_to_non_nullable
as int?,authorIdx: null == authorIdx ? _self.authorIdx : authorIdx // ignore: cast_nullable_to_non_nullable
as int,authorNickname: null == authorNickname ? _self.authorNickname : authorNickname // ignore: cast_nullable_to_non_nullable
as String,authorAvatarUrl: null == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<CommentResponse>,
  ));
}


}

// dart format on
