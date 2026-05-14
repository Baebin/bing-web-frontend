import 'package:bing_web_frontend/features/post/common/post_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_response.freezed.dart';
part 'post_response.g.dart';

@freezed
sealed class PostResponse with _$PostResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PostResponse({
    required int idx,
    required int authorIdx,
    required String authorNickname,
    required String title,
    required String content,
    required PostType type,
    required int viewCount,
    required int likeCount,
    required int commentCount,
    required bool isLiked,
    required String createdAt,
    required String updatedAt,
  }) = _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
}