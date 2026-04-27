import 'package:bing_web_frontend/core/auth/token_manager.dart';
import 'package:bing_web_frontend/core/dto/response/account_response.dart';
import 'package:bing_web_frontend/features/auth/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isBingJoinedProvider = FutureProvider<bool>((ref) async {
  return await TokenManager().hasToken();
});

final userProfileProvider = FutureProvider<AccountResponse?>((ref) async {
  final isJoined = await ref.watch(isBingJoinedProvider.future);
  if (!isJoined) return null;

  final authService = ref.read(authServiceProvider);
  final result = await authService.getMyProfile();
  if (result is AccountResponse) return result;
  return null;
});