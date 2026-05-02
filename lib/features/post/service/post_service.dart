import 'package:bing_web_frontend/core/network/bing_api_service.dart';
import 'package:bing_web_frontend/core/network/dio_provider.dart';
import 'package:bing_web_frontend/features/post/common/post_type.dart';
import 'package:bing_web_frontend/features/post/dto/request/post_request.dart';
import 'package:bing_web_frontend/features/post/dto/response/post_response.dart';
import 'package:bing_web_frontend/features/post/dto/response/post_with_paging_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostService extends BingApiService {
  // Prefix
  static const String _p = "/posts";

  PostService(super.dio);

  Future<dynamic> get(int idx) async {
    return safeApiCall(
          () => dio.get("$_p/$idx"),
      onSuccess: (data) => PostResponse.fromJson(data),
    );
  }

  Future<dynamic> getList(PostType type, {int? page, int? size = 5}) async {
    return safeApiCall(
          () => dio.get(
          _p,
          queryParameters: {
            "type": type.name.toUpperCase(),
            "page": page,
            "size": size,
          }
      ),
      onSuccess: (data) => PostWithPagingResponse.fromJson(data),
    );
  }

  Future<dynamic> upload(PostRequest request) async {
    return safeApiCall(
          () => dio.post(_p, data: request.toJson()),
      onSuccess: (data) => true,
    );
  }
}

final postServiceProvider = Provider<PostService>((ref) {
  final dio = ref.watch(dioProvider);
  return PostService(dio);
});