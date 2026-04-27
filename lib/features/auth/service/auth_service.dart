import 'package:bing_web_frontend/core/network/bing_api_service.dart';
import 'package:bing_web_frontend/core/network/dio_provider.dart';
import 'package:bing_web_frontend/features/auth/dto/request/sign_up_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService extends BingApiService {
  // Prefix
  static const String _p = "/auth";

  AuthService(super.dio);

  Future<dynamic> signUp(SignUpRequest request) async {
    return safeApiCall(
          () => dio.post("${_p}/signup", data: request.toJson()),
      onSuccess: (data) => true,
    );
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio);
});