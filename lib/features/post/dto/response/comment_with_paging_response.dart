import 'package:bing_web_frontend/features/post/dto/response/comment_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_with_paging_response.freezed.dart';
part 'comment_with_paging_response.g.dart';

@freezed
sealed class CommentWithPagingResponse with _$CommentWithPagingResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CommentWithPagingResponse({
    required List<CommentResponse> comments,
    int? lastParentIdx,
    required bool isLast,
  }) = _CommentWithPagingResponse;

  factory CommentWithPagingResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentWithPagingResponseFromJson(json);
}