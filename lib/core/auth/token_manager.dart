import 'dart:async';

import 'package:bing_web_frontend/core/auth/auth_provider.dart';
import 'package:bing_web_frontend/core/dto/response/token_response.dart';
import 'package:bing_web_frontend/core/router/bing_route.dart';
import 'package:bing_web_frontend/core/router/bing_router.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

var logger = Logger(printer: PrettyPrinter());

class TokenManager {
  static const String _accessTokenKey = "access_key";
  static const String _expireTimeKey = "expire_time";

  final Ref _ref;
  Timer? _refreshTimer;

  TokenManager(this._ref);

  Future<void> saveToken(TokenResponse response) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_accessTokenKey, response.accessToken);

      // 토큰 만료 60초 전 사전 감지용 여유 시간 설정
      final expireTime = DateTime.now().add(Duration(seconds: response.expiresIn - 0));
      await prefs.setString(_expireTimeKey, expireTime.toIso8601String());

      _startExpiryTimer(response.expiresIn - 0);
      logger.i("토큰 저장 완료, 만료 시각: ${expireTime}");
    } catch (e) {
      logger.e("토큰 저장 실패: $e");
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  Future<bool> hasToken() async {
    String? token = await getToken();
    return token?.isNotEmpty ?? false;
  }

  Future<bool> isExpired() async {
    final prefs = await SharedPreferences.getInstance();
    final expireTimeStr = prefs.getString(_expireTimeKey);
    if (expireTimeStr == null) return true;

    final expireTime = DateTime.parse(expireTimeStr);
    return DateTime.now().isAfter(expireTime);
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_expireTimeKey);

    logger.i("토큰 삭제 완료");
  }

  Future<void> handleTokenExpired() async {
    logger.i("handleTokenExpired()");
    _refreshTimer?.cancel();

    await deleteToken();
    Future.microtask(() {
      _ref.invalidate(isBingJoinedProvider);
    });

    final String currentLoc = BingRouter.router.routeInformationProvider.value.uri.toString();
    final location = Uri(path: BingRoute.login, queryParameters: {"from": currentLoc}).toString();

    final context = navigatorKey.currentContext;
    if (context == null || !context.mounted) {
      BingRouter.router.go(location);
      return;
    }
    context.showAlert(
        title: "세션이 만료되었어요!",
        content: "보안을 위해 다시 로그인이 필요해요.\n빙구단원이 맞는지 한 번 더 확인해 볼까요? 😊",
        onConfirm: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
          BingRouter.router.go(location);
        }
    );
  }

  void _startExpiryTimer(int seconds) {
    _refreshTimer?.cancel();
    _refreshTimer = Timer(Duration(seconds: seconds), () {
      handleTokenExpired();
    });
  }
}

final tokenManagerProvider = Provider((ref) {
  return TokenManager(ref);
});