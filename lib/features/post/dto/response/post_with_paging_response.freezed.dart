// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_with_paging_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostWithPagingResponse {

 List<PostListResponse> get posts; int get totalPages; int get totalElements; int get currentPage; bool get isLast;
/// Create a copy of PostWithPagingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostWithPagingResponseCopyWith<PostWithPagingResponse> get copyWith => _$PostWithPagingResponseCopyWithImpl<PostWithPagingResponse>(this as PostWithPagingResponse, _$identity);

  /// Serializes this PostWithPagingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostWithPagingResponse&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLast, isLast) || other.isLast == isLast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(posts),totalPages,totalElements,currentPage,isLast);

@override
String toString() {
  return 'PostWithPagingResponse(posts: $posts, totalPages: $totalPages, totalElements: $totalElements, currentPage: $currentPage, isLast: $isLast)';
}


}

/// @nodoc
abstract mixin class $PostWithPagingResponseCopyWith<$Res>  {
  factory $PostWithPagingResponseCopyWith(PostWithPagingResponse value, $Res Function(PostWithPagingResponse) _then) = _$PostWithPagingResponseCopyWithImpl;
@useResult
$Res call({
 List<PostListResponse> posts, int totalPages, int totalElements, int currentPage, bool isLast
});




}
/// @nodoc
class _$PostWithPagingResponseCopyWithImpl<$Res>
    implements $PostWithPagingResponseCopyWith<$Res> {
  _$PostWithPagingResponseCopyWithImpl(this._self, this._then);

  final PostWithPagingResponse _self;
  final $Res Function(PostWithPagingResponse) _then;

/// Create a copy of PostWithPagingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,Object? totalPages = null,Object? totalElements = null,Object? currentPage = null,Object? isLast = null,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostListResponse>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLast: null == isLast ? _self.isLast : isLast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostWithPagingResponse].
extension PostWithPagingResponsePatterns on PostWithPagingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostWithPagingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostWithPagingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostWithPagingResponse value)  $default,){
final _that = this;
switch (_that) {
case _PostWithPagingResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostWithPagingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PostWithPagingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PostListResponse> posts,  int totalPages,  int totalElements,  int currentPage,  bool isLast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostWithPagingResponse() when $default != null:
return $default(_that.posts,_that.totalPages,_that.totalElements,_that.currentPage,_that.isLast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PostListResponse> posts,  int totalPages,  int totalElements,  int currentPage,  bool isLast)  $default,) {final _that = this;
switch (_that) {
case _PostWithPagingResponse():
return $default(_that.posts,_that.totalPages,_that.totalElements,_that.currentPage,_that.isLast);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PostListResponse> posts,  int totalPages,  int totalElements,  int currentPage,  bool isLast)?  $default,) {final _that = this;
switch (_that) {
case _PostWithPagingResponse() when $default != null:
return $default(_that.posts,_that.totalPages,_that.totalElements,_that.currentPage,_that.isLast);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PostWithPagingResponse implements PostWithPagingResponse {
  const _PostWithPagingResponse({required final  List<PostListResponse> posts, required this.totalPages, required this.totalElements, required this.currentPage, required this.isLast}): _posts = posts;
  factory _PostWithPagingResponse.fromJson(Map<String, dynamic> json) => _$PostWithPagingResponseFromJson(json);

 final  List<PostListResponse> _posts;
@override List<PostListResponse> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override final  int totalPages;
@override final  int totalElements;
@override final  int currentPage;
@override final  bool isLast;

/// Create a copy of PostWithPagingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostWithPagingResponseCopyWith<_PostWithPagingResponse> get copyWith => __$PostWithPagingResponseCopyWithImpl<_PostWithPagingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostWithPagingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostWithPagingResponse&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLast, isLast) || other.isLast == isLast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),totalPages,totalElements,currentPage,isLast);

@override
String toString() {
  return 'PostWithPagingResponse(posts: $posts, totalPages: $totalPages, totalElements: $totalElements, currentPage: $currentPage, isLast: $isLast)';
}


}

/// @nodoc
abstract mixin class _$PostWithPagingResponseCopyWith<$Res> implements $PostWithPagingResponseCopyWith<$Res> {
  factory _$PostWithPagingResponseCopyWith(_PostWithPagingResponse value, $Res Function(_PostWithPagingResponse) _then) = __$PostWithPagingResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PostListResponse> posts, int totalPages, int totalElements, int currentPage, bool isLast
});




}
/// @nodoc
class __$PostWithPagingResponseCopyWithImpl<$Res>
    implements _$PostWithPagingResponseCopyWith<$Res> {
  __$PostWithPagingResponseCopyWithImpl(this._self, this._then);

  final _PostWithPagingResponse _self;
  final $Res Function(_PostWithPagingResponse) _then;

/// Create a copy of PostWithPagingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? totalPages = null,Object? totalElements = null,Object? currentPage = null,Object? isLast = null,}) {
  return _then(_PostWithPagingResponse(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostListResponse>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLast: null == isLast ? _self.isLast : isLast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
