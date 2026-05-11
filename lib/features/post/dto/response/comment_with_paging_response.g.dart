// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_with_paging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentWithPagingResponse _$CommentWithPagingResponseFromJson(
  Map<String, dynamic> json,
) => _CommentWithPagingResponse(
  comments: (json['comments'] as List<dynamic>)
      .map((e) => CommentResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastParentIdx: (json['last_parent_idx'] as num?)?.toInt(),
  isLast: json['is_last'] as bool,
);

Map<String, dynamic> _$CommentWithPagingResponseToJson(
  _CommentWithPagingResponse instance,
) => <String, dynamic>{
  'comments': instance.comments,
  'last_parent_idx': instance.lastParentIdx,
  'is_last': instance.isLast,
};
