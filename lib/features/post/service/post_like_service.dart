import 'package:bing_web_frontend/core/network/bing_api_service.dart';
import 'package:bing_web_frontend/core/network/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostLikeService extends BingApiService {
  // Prefix
  static const String _p = "/posts";

  PostLikeService(super.dio);

  Future<dynamic> toggle(int idx) async {
    return safeApiCall(
          () => dio.post("$_p/$idx/like"),
      onSuccess: (data) => data,
    );
  }
}

final postLikeServiceProvider = Provider<PostLikeService>((ref) {
  final dio = ref.watch(dioProvider);
  return PostLikeService(dio);
});