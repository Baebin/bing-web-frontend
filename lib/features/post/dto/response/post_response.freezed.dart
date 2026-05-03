// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostResponse {

 int get idx; int get authorIdx; String get authorNickname; String get title; String get content; PostType get type; String get createdAt; String get updatedAt;
/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostResponseCopyWith<PostResponse> get copyWith => _$PostResponseCopyWithImpl<PostResponse>(this as PostResponse, _$identity);

  /// Serializes this PostResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostResponse&&(identical(other.idx, idx) || other.idx == idx)&&(identical(other.authorIdx, authorIdx) || other.authorIdx == authorIdx)&&(identical(other.authorNickname, authorNickname) || other.authorNickname == authorNickname)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idx,authorIdx,authorNickname,title,content,type,createdAt,updatedAt);

@override
String toString() {
  return 'PostResponse(idx: $idx, authorIdx: $authorIdx, authorNickname: $authorNickname, title: $title, content: $content, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PostResponseCopyWith<$Res>  {
  factory $PostResponseCopyWith(PostResponse value, $Res Function(PostResponse) _then) = _$PostResponseCopyWithImpl;
@useResult
$Res call({
 int idx, int authorIdx, String authorNickname, String title, String content, PostType type, String createdAt, String updatedAt
});




}
/// @nodoc
class _$PostResponseCopyWithImpl<$Res>
    implements $PostResponseCopyWith<$Res> {
  _$PostResponseCopyWithImpl(this._self, this._then);

  final PostResponse _self;
  final $Res Function(PostResponse) _then;

/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idx = null,Object? authorIdx = null,Object? authorNickname = null,Object? title = null,Object? content = null,Object? type = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
idx: null == idx ? _self.idx : idx // ignore: cast_nullable_to_non_nullable
as int,authorIdx: null == authorIdx ? _self.authorIdx : authorIdx // ignore: cast_nullable_to_non_nullable
as int,authorNickname: null == authorNickname ? _self.authorNickname : authorNickname // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PostType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PostResponse].
extension PostResponsePatterns on PostResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostResponse value)  $default,){
final _that = this;
switch (_that) {
case _PostResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int idx,  int authorIdx,  String authorNickname,  String title,  String content,  PostType type,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
return $default(_that.idx,_that.authorIdx,_that.authorNickname,_that.title,_that.content,_that.type,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int idx,  int authorIdx,  String authorNickname,  String title,  String content,  PostType type,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PostResponse():
return $default(_that.idx,_that.authorIdx,_that.authorNickname,_that.title,_that.content,_that.type,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int idx,  int authorIdx,  String authorNickname,  String title,  String content,  PostType type,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PostResponse() when $default != null:
return $default(_that.idx,_that.authorIdx,_that.authorNickname,_that.title,_that.content,_that.type,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PostResponse implements PostResponse {
  const _PostResponse({required this.idx, required this.authorIdx, required this.authorNickname, required this.title, required this.content, required this.type, required this.createdAt, required this.updatedAt});
  factory _PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);

@override final  int idx;
@override final  int authorIdx;
@override final  String authorNickname;
@override final  String title;
@override final  String content;
@override final  PostType type;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostResponseCopyWith<_PostResponse> get copyWith => __$PostResponseCopyWithImpl<_PostResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostResponse&&(identical(other.idx, idx) || other.idx == idx)&&(identical(other.authorIdx, authorIdx) || other.authorIdx == authorIdx)&&(identical(other.authorNickname, authorNickname) || other.authorNickname == authorNickname)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idx,authorIdx,authorNickname,title,content,type,createdAt,updatedAt);

@override
String toString() {
  return 'PostResponse(idx: $idx, authorIdx: $authorIdx, authorNickname: $authorNickname, title: $title, content: $content, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PostResponseCopyWith<$Res> implements $PostResponseCopyWith<$Res> {
  factory _$PostResponseCopyWith(_PostResponse value, $Res Function(_PostResponse) _then) = __$PostResponseCopyWithImpl;
@override @useResult
$Res call({
 int idx, int authorIdx, String authorNickname, String title, String content, PostType type, String createdAt, String updatedAt
});




}
/// @nodoc
class __$PostResponseCopyWithImpl<$Res>
    implements _$PostResponseCopyWith<$Res> {
  __$PostResponseCopyWithImpl(this._self, this._then);

  final _PostResponse _self;
  final $Res Function(_PostResponse) _then;

/// Create a copy of PostResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idx = null,Object? authorIdx = null,Object? authorNickname = null,Object? title = null,Object? content = null,Object? type = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_PostResponse(
idx: null == idx ? _self.idx : idx // ignore: cast_nullable_to_non_nullable
as int,authorIdx: null == authorIdx ? _self.authorIdx : authorIdx // ignore: cast_nullable_to_non_nullable
as int,authorNickname: null == authorNickname ? _self.authorNickname : authorNickname // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PostType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
