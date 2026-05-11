import 'package:bing_web_frontend/core/network/bing_api_service.dart';
import 'package:bing_web_frontend/core/network/dio_provider.dart';
import 'package:bing_web_frontend/features/post/dto/request/comment_request.dart';
import 'package:bing_web_frontend/features/post/dto/response/comment_response.dart';
import 'package:bing_web_frontend/features/post/dto/response/comment_with_paging_response.dart';
import 'package:bing_web_frontend/features/post/dto/response/post_with_paging_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentService extends BingApiService {
  // Prefix
  static const String _p = "/posts";

  CommentService(super.dio);

  Future<dynamic> get(int postIdx, int commentIdx) async {
    return safeApiCall(
          () => dio.get("$_p/$postIdx/comments/$commentIdx"),
      onSuccess: (data) => CommentResponse.fromJson(data),
    );
  }

  Future<dynamic> getList(int postIdx, {int? lastParentIdx}) async {
    return safeApiCall(
          () => dio.get(
          "$_p/$postIdx/comments",
          queryParameters: {
            "last-parent-idx": lastParentIdx,
          }
      ),
      onSuccess: (data) => CommentWithPagingResponse.fromJson(data),
    );
  }

  Future<dynamic> create(int postIdx, CommentRequest request) async {
    return safeApiCall(
          () => dio.post("$_p/$postIdx/comments", data: request.toJson()),
      onSuccess: (data) => true,
    );
  }
}

final commentServiceProvider = Provider<CommentService>((ref) {
  final dio = ref.watch(dioProvider);
  return CommentService(dio);
});