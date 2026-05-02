// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostListResponse {

 int get idx; int get authorIdx; String get authorNickname; String get title; int get viewCount; int get commentCount; String get createdAt; String get updatedAt;
/// Create a copy of PostListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostListResponseCopyWith<PostListResponse> get copyWith => _$PostListResponseCopyWithImpl<PostListResponse>(this as PostListResponse, _$identity);

  /// Serializes this PostListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostListResponse&&(identical(other.idx, idx) || other.idx == idx)&&(identical(other.authorIdx, authorIdx) || other.authorIdx == authorIdx)&&(identical(other.authorNickname, authorNickname) || other.authorNickname == authorNickname)&&(identical(other.title, title) || other.title == title)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idx,authorIdx,authorNickname,title,viewCount,commentCount,createdAt,updatedAt);

@override
String toString() {
  return 'PostListResponse(idx: $idx, authorIdx: $authorIdx, authorNickname: $authorNickname, title: $title, viewCount: $viewCount, commentCount: $commentCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PostListResponseCopyWith<$Res>  {
  factory $PostListResponseCopyWith(PostListResponse value, $Res Function(PostListResponse) _then) = _$PostListResponseCopyWithImpl;
@useResult
$Res call({
 int idx, int authorIdx, String authorNickname, String title, int viewCount, int commentCount, String createdAt, String updatedAt
});




}
/// @nodoc
class _$PostListResponseCopyWithImpl<$Res>
    implements $PostListResponseCopyWith<$Res> {
  _$PostListResponseCopyWithImpl(this._self, this._then);

  final PostListResponse _self;
  final $Res Function(PostListResponse) _then;

/// Create a copy of PostListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idx = null,Object? authorIdx = null,Object? authorNickname = null,Object? title = null,Object? viewCount = null,Object? commentCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
idx: null == idx ? _self.idx : idx // ignore: cast_nullable_to_non_nullable
as int,authorIdx: null == authorIdx ? _self.authorIdx : authorIdx // ignore: cast_nullable_to_non_nullable
as int,authorNickname: null == authorNickname ? _self.authorNickname : authorNickname // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PostListResponse].
extension PostListResponsePatterns on PostListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostListResponse value)  $default,){
final _that = this;
switch (_that) {
case _PostListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PostListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int idx,  int authorIdx,  String authorNickname,  String title,  int viewCount,  int commentCount,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostListResponse() when $default != null:
return $default(_that.idx,_that.authorIdx,_that.authorNickname,_that.title,_that.viewCount,_that.commentCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int idx,  int authorIdx,  String authorNickname,  String title,  int viewCount,  int commentCount,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PostListResponse():
return $default(_that.idx,_that.authorIdx,_that.authorNickname,_that.title,_that.viewCount,_that.commentCount,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int idx,  int authorIdx,  String authorNickname,  String title,  int viewCount,  int commentCount,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PostListResponse() when $default != null:
return $default(_that.idx,_that.authorIdx,_that.authorNickname,_that.title,_that.viewCount,_that.commentCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PostListResponse implements PostListResponse {
  const _PostListResponse({required this.idx, required this.authorIdx, required this.authorNickname, required this.title, required this.viewCount, required this.commentCount, required this.createdAt, required this.updatedAt});
  factory _PostListResponse.fromJson(Map<String, dynamic> json) => _$PostListResponseFromJson(json);

@override final  int idx;
@override final  int authorIdx;
@override final  String authorNickname;
@override final  String title;
@override final  int viewCount;
@override final  int commentCount;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of PostListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostListResponseCopyWith<_PostListResponse> get copyWith => __$PostListResponseCopyWithImpl<_PostListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostListResponse&&(identical(other.idx, idx) || other.idx == idx)&&(identical(other.authorIdx, authorIdx) || other.authorIdx == authorIdx)&&(identical(other.authorNickname, authorNickname) || other.authorNickname == authorNickname)&&(identical(other.title, title) || other.title == title)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idx,authorIdx,authorNickname,title,viewCount,commentCount,createdAt,updatedAt);

@override
String toString() {
  return 'PostListResponse(idx: $idx, authorIdx: $authorIdx, authorNickname: $authorNickname, title: $title, viewCount: $viewCount, commentCount: $commentCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PostListResponseCopyWith<$Res> implements $PostListResponseCopyWith<$Res> {
  factory _$PostListResponseCopyWith(_PostListResponse value, $Res Function(_PostListResponse) _then) = __$PostListResponseCopyWithImpl;
@override @useResult
$Res call({
 int idx, int authorIdx, String authorNickname, String title, int viewCount, int commentCount, String createdAt, String updatedAt
});




}
/// @nodoc
class __$PostListResponseCopyWithImpl<$Res>
    implements _$PostListResponseCopyWith<$Res> {
  __$PostListResponseCopyWithImpl(this._self, this._then);

  final _PostListResponse _self;
  final $Res Function(_PostListResponse) _then;

/// Create a copy of PostListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idx = null,Object? authorIdx = null,Object? authorNickname = null,Object? title = null,Object? viewCount = null,Object? commentCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_PostListResponse(
idx: null == idx ? _self.idx : idx // ignore: cast_nullable_to_non_nullable
as int,authorIdx: null == authorIdx ? _self.authorIdx : authorIdx // ignore: cast_nullable_to_non_nullable
as int,authorNickname: null == authorNickname ? _self.authorNickname : authorNickname // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
