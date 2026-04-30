// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    _AccountResponse(
      id: json['id'] as String,
      idx: (json['idx'] as num).toInt(),
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
      regDate: json['reg_date'] as String,
    );

Map<String, dynamic> _$AccountResponseToJson(_AccountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idx': instance.idx,
      'nickname': instance.nickname,
      'email': instance.email,
      'bio': instance.bio,
      'reg_date': instance.regDate,
    };
