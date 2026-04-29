import 'package:bing_web_frontend/core/dto/response/account_response.dart';
import 'package:bing_web_frontend/core/network/bing_api_service.dart';
import 'package:bing_web_frontend/core/network/dio_provider.dart';
import 'package:bing_web_frontend/features/account/dto/request/bio_update_request.dart';
import 'package:bing_web_frontend/features/account/dto/request/nickname_update_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountService extends BingApiService {
  // Prefix
  static const String _p = "/accounts";

  AccountService(super.dio);

  Future<dynamic> getMyProfile() async {
    return safeApiCall(
          () => dio.get("${_p}/me"),
      onSuccess: (data) => AccountResponse.fromJson(data),
    );
  }

  Future<dynamic> updateNickname(NicknameUpdateRequest request) async {
    return safeApiCall(
          () => dio.patch("${_p}/me/nickname", data: request.toJson()),
      onSuccess: (data) => true,
    );
  }

  Future<dynamic> updateBio(BioUpdateRequest request) async {
    return safeApiCall(
          () => dio.patch("${_p}/me/bio", data: request.toJson()),
      onSuccess: (data) => true,
    );
  }
}

final accountServiceProvider = Provider<AccountService>((ref) {
  final dio = ref.watch(dioProvider);
  return AccountService(dio);
});