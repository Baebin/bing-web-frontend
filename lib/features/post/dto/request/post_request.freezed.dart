// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostRequest {

 String get title; String get content; PostType get type;
/// Create a copy of PostRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostRequestCopyWith<PostRequest> get copyWith => _$PostRequestCopyWithImpl<PostRequest>(this as PostRequest, _$identity);

  /// Serializes this PostRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,type);

@override
String toString() {
  return 'PostRequest(title: $title, content: $content, type: $type)';
}


}

/// @nodoc
abstract mixin class $PostRequestCopyWith<$Res>  {
  factory $PostRequestCopyWith(PostRequest value, $Res Function(PostRequest) _then) = _$PostRequestCopyWithImpl;
@useResult
$Res call({
 String title, String content, PostType type
});




}
/// @nodoc
class _$PostRequestCopyWithImpl<$Res>
    implements $PostRequestCopyWith<$Res> {
  _$PostRequestCopyWithImpl(this._self, this._then);

  final PostRequest _self;
  final $Res Function(PostRequest) _then;

/// Create a copy of PostRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,Object? type = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PostType,
  ));
}

}


/// Adds pattern-matching-related methods to [PostRequest].
extension PostRequestPatterns on PostRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostRequest value)  $default,){
final _that = this;
switch (_that) {
case _PostRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PostRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String content,  PostType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostRequest() when $default != null:
return $default(_that.title,_that.content,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String content,  PostType type)  $default,) {final _that = this;
switch (_that) {
case _PostRequest():
return $default(_that.title,_that.content,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String content,  PostType type)?  $default,) {final _that = this;
switch (_that) {
case _PostRequest() when $default != null:
return $default(_that.title,_that.content,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostRequest implements PostRequest {
  const _PostRequest({required this.title, required this.content, required this.type});
  factory _PostRequest.fromJson(Map<String, dynamic> json) => _$PostRequestFromJson(json);

@override final  String title;
@override final  String content;
@override final  PostType type;

/// Create a copy of PostRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostRequestCopyWith<_PostRequest> get copyWith => __$PostRequestCopyWithImpl<_PostRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,type);

@override
String toString() {
  return 'PostRequest(title: $title, content: $content, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PostRequestCopyWith<$Res> implements $PostRequestCopyWith<$Res> {
  factory _$PostRequestCopyWith(_PostRequest value, $Res Function(_PostRequest) _then) = __$PostRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String content, PostType type
});




}
/// @nodoc
class __$PostRequestCopyWithImpl<$Res>
    implements _$PostRequestCopyWith<$Res> {
  __$PostRequestCopyWithImpl(this._self, this._then);

  final _PostRequest _self;
  final $Res Function(_PostRequest) _then;

/// Create a copy of PostRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,Object? type = null,}) {
  return _then(_PostRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PostType,
  ));
}


}

// dart format on
