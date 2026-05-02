import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_response.freezed.dart';
part 'post_list_response.g.dart';

@freezed
sealed class PostListResponse with _$PostListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PostListResponse({
    required int idx,
    required int authorIdx,
    required String authorNickname,
    required String title,
    required int viewCount,
    required int commentCount,
    required String createdAt,
    required String updatedAt,
  }) = _PostListResponse;

  factory PostListResponse.fromJson(Map<String, dynamic> json) =>
      _$PostListResponseFromJson(json);
}