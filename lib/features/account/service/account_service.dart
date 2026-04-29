import 'package:bing_web_frontend/core/dto/response/account_response.dart';
import 'package:bing_web_frontend/core/network/bing_api_service.dart';
import 'package:bing_web_frontend/core/network/dio_provider.dart';
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
}

final accountServiceProvider = Provider<AccountService>((ref) {
  final dio = ref.watch(dioProvider);
  return AccountService(dio);
});