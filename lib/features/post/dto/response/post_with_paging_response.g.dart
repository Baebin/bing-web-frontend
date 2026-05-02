// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_with_paging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostWithPagingResponse _$PostWithPagingResponseFromJson(
  Map<String, dynamic> json,
) => _PostWithPagingResponse(
  posts: (json['posts'] as List<dynamic>)
      .map((e) => PostListResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPages: (json['total_pages'] as num).toInt(),
  totalElements: (json['total_elements'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
  isLast: json['is_last'] as bool,
);

Map<String, dynamic> _$PostWithPagingResponseToJson(
  _PostWithPagingResponse instance,
) => <String, dynamic>{
  'posts': instance.posts,
  'total_pages': instance.totalPages,
  'total_elements': instance.totalElements,
  'current_page': instance.currentPage,
  'is_last': instance.isLast,
};
