// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostRequest _$PostRequestFromJson(Map<String, dynamic> json) => _PostRequest(
  title: json['title'] as String,
  content: json['content'] as String,
  type: $enumDecode(_$PostTypeEnumMap, json['type']),
);

Map<String, dynamic> _$PostRequestToJson(_PostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'type': _$PostTypeEnumMap[instance.type]!,
    };

const _$PostTypeEnumMap = {
  PostType.notice: 'NOTICE',
  PostType.portfolio: 'PORTFOLIO',
  PostType.blog: 'BLOG',
  PostType.community: 'COMMUNITY',
};
