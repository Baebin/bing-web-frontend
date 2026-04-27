import 'package:bing_web_frontend/core/auth/token_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isBingJoinedProvider = FutureProvider<bool>((ref) async {
  return await TokenManager().hasToken();
});