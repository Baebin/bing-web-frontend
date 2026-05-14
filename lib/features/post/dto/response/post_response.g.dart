// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostResponse _$PostResponseFromJson(Map<String, dynamic> json) =>
    _PostResponse(
      idx: (json['idx'] as num).toInt(),
      authorIdx: (json['author_idx'] as num).toInt(),
      authorNickname: json['author_nickname'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      type: $enumDecode(_$PostTypeEnumMap, json['type']),
      viewCount: (json['view_count'] as num).toInt(),
      likeCount: (json['like_count'] as num).toInt(),
      commentCount: (json['comment_count'] as num).toInt(),
      isLiked: json['is_liked'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PostResponseToJson(_PostResponse instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'author_idx': instance.authorIdx,
      'author_nickname': instance.authorNickname,
      'title': instance.title,
      'content': instance.content,
      'type': _$PostTypeEnumMap[instance.type]!,
      'view_count': instance.viewCount,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'is_liked': instance.isLiked,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$PostTypeEnumMap = {
  PostType.notice: 'NOTICE',
  PostType.portfolio: 'PORTFOLIO',
  PostType.blog: 'BLOG',
  PostType.community: 'COMMUNITY',
};
