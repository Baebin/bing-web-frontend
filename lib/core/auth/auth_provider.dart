import 'package:bing_web_frontend/core/auth/token_manager.dart';
import 'package:bing_web_frontend/features/auth/dto/response/account_response.dart';
import 'package:bing_web_frontend/features/account/service/account_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isBingJoinedProvider = FutureProvider<bool>((ref) async {
  return await ref.watch(tokenManagerProvider).hasToken();
});

final userProfileProvider = FutureProvider<AccountResponse?>((ref) async {
  final isJoined = await ref.watch(isBingJoinedProvider.future);
  if (!isJoined) return null;

  final accountService = ref.read(accountServiceProvider);
  final result = await accountService.getMyProfile();
  if (result is AccountResponse) return result;
  return null;
});