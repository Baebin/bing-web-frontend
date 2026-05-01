import 'package:json_annotation/json_annotation.dart';

enum PostType {
  @JsonValue('NOTICE')
  notice("공지사항"),

  @JsonValue('PORTFOLIO')
  portfolio("포트폴리오"),

  @JsonValue('BLOG')
  blog("블로그"),

  @JsonValue('COMMUNITY')
  community("커뮤니티");

  final String description;
  const PostType(this.description);
}