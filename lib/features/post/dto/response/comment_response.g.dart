// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    _CommentResponse(
      idx: (json['idx'] as num).toInt(),
      parentIdx: (json['parent_idx'] as num?)?.toInt(),
      authorIdx: (json['author_idx'] as num).toInt(),
      authorNickname: json['author_nickname'] as String,
      authorAvatarUrl: json['author_avatar_url'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      children:
          (json['children'] as List<dynamic>?)
              ?.map((e) => CommentResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CommentResponseToJson(_CommentResponse instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'parent_idx': instance.parentIdx,
      'author_idx': instance.authorIdx,
      'author_nickname': instance.authorNickname,
      'author_avatar_url': instance.authorAvatarUrl,
      'content': instance.content,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'children': instance.children,
    };
