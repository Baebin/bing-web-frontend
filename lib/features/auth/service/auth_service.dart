import 'package:bing_web_frontend/core/service/bing_api_service.dart';
import 'package:bing_web_frontend/features/auth/dto/request/sign_up_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService extends BingApiService {
  // Prefix
  static const String _p = "/auth";

  Future<dynamic> signUp(SignUpRequest request) async {
    return safeApiCall(
          () => dio.post("${_p}/signup", data: request.toJson()),
      onSuccess: (data) {
        logger.i("회원가입 성공: $data");
        return true;
      },
    );
  }
}

final authServiceProvider = Provider((ref) => AuthService());