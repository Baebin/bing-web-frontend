import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_response.freezed.dart';
part 'comment_response.g.dart';

@freezed
sealed class CommentResponse with _$CommentResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CommentResponse({
    required int idx,
    int? parentIdx,
    required int authorIdx,
    required String authorNickname,
    required String authorAvatarUrl,
    required String content,
    required String createdAt,
    required String updatedAt,
    @Default([]) List<CommentResponse> children,
  }) = _CommentResponse;

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);
}