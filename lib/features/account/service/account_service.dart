import 'dart:typed_data';

import 'package:bing_web_frontend/features/auth/dto/response/account_response.dart';
import 'package:bing_web_frontend/core/network/bing_api_service.dart';
import 'package:bing_web_frontend/core/network/dio_provider.dart';
import 'package:bing_web_frontend/features/account/dto/request/bio_update_request.dart';
import 'package:bing_web_frontend/features/account/dto/request/nickname_update_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountService extends BingApiService {
  // Prefix
  static const String _p = "/accounts";

  AccountService(super.dio);

  String _getUrl(String path) {
    String api = dotenv.get("BING_API_URL");
    return "$api$_p$path";
  }

  Future<dynamic> getMyProfile() async {
    return safeApiCall(
          () => dio.get("$_p/me"),
      onSuccess: (data) => AccountResponse.fromJson(data),
    );
  }

  String getAvatarUrl(int idx) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    var url = _getUrl("/$idx/avatar?t=$timestamp");
    return url;
  }

  Future<dynamic> updateAvatar(Uint8List fileBytes, String fileName) async {
    final multipartFile = MultipartFile.fromBytes(
      fileBytes,
      filename: fileName,
    );
    final formData = FormData.fromMap({
      'file': multipartFile,
    });
    return safeApiCall(
          () => dio.patch(
        "$_p/me/avatar",
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      ),
      onSuccess: (data) => true,
    );
  }

  Future<dynamic> updateNickname(NicknameUpdateRequest request) async {
    return safeApiCall(
          () => dio.patch("$_p/me/nickname", data: request.toJson()),
      onSuccess: (data) => true,
    );
  }

  Future<dynamic> updateBio(BioUpdateRequest request) async {
    return safeApiCall(
          () => dio.patch("$_p/me/bio", data: request.toJson()),
      onSuccess: (data) => true,
    );
  }
}

final accountServiceProvider = Provider<AccountService>((ref) {
  final dio = ref.watch(dioProvider);
  return AccountService(dio);
});