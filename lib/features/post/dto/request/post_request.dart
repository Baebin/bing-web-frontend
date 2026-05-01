import 'package:bing_web_frontend/features/post/common/post_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_request.freezed.dart';
part 'post_request.g.dart';

@freezed
sealed class PostRequest with _$PostRequest {
  const factory PostRequest({
    required String title,
    required String content,
    required PostType type,
  }) = _PostRequest;

  factory PostRequest.fromJson(Map<String, dynamic> json) =>
      _$PostRequestFromJson(json);
}
