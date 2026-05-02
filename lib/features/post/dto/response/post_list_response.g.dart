// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostListResponse _$PostListResponseFromJson(Map<String, dynamic> json) =>
    _PostListResponse(
      idx: (json['idx'] as num).toInt(),
      authorIdx: (json['author_idx'] as num).toInt(),
      authorNickname: json['author_nickname'] as String,
      title: json['title'] as String,
      viewCount: (json['view_count'] as num).toInt(),
      commentCount: (json['comment_count'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PostListResponseToJson(_PostListResponse instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'author_idx': instance.authorIdx,
      'author_nickname': instance.authorNickname,
      'title': instance.title,
      'view_count': instance.viewCount,
      'comment_count': instance.commentCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
