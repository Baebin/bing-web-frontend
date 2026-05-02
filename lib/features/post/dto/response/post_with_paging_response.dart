import 'package:freezed_annotation/freezed_annotation.dart';
import 'post_list_response.dart';

part 'post_with_paging_response.freezed.dart';
part 'post_with_paging_response.g.dart';

@freezed
sealed class PostWithPagingResponse with _$PostWithPagingResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PostWithPagingResponse({
    required List<PostListResponse> posts,

    required int totalPages,
    required int totalElements,
    required int currentPage,
    required bool isLast,
  }) = _PostWithPagingResponse;

  factory PostWithPagingResponse.fromJson(Map<String, dynamic> json) =>
      _$PostWithPagingResponseFromJson(json);
}