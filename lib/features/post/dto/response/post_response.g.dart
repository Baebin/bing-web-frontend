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
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$PostTypeEnumMap = {
  PostType.notice: 'NOTICE',
  PostType.portfolio: 'PORTFOLIO',
  PostType.blog: 'BLOG',
  PostType.community: 'COMMUNITY',
};
