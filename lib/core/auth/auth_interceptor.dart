import 'dart:io';

import 'package:bing_web_frontend/core/auth/auth_provider.dart';
import 'package:bing_web_frontend/core/router/bing_route.dart';
import 'package:bing_web_frontend/core/router/bing_router.dart';
import 'package:bing_web_frontend/core/utils/extensions/build_context_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../../core/auth/token_manager.dart';

var logger = Logger(printer: PrettyPrinter());

class AuthInterceptor extends Interceptor {
  final Ref ref;
  final Dio dio;

  AuthInterceptor(this.ref, this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await ref.read(tokenManagerProvider).getToken();
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      if (!err.requestOptions.path.contains('/login')) {
        await _handleTokenExpired(err);
      }
    }
    return handler.next(err);
  }

  Future<void> _handleTokenExpired(DioException err) async {
    logger.w("인증 만료 감지: ${err.requestOptions.path} 요청 실패. 토큰을 삭제합니다.");
    await ref.read(tokenManagerProvider).deleteToken();

    var context = navigatorKey.currentContext;
    if (context == null || !context.mounted) return;

    ref.invalidate(isBingJoinedProvider);
    context.showAlert(
      title: "세션이 만료되었어요!",
      content: "보안을 위해 다시 로그인이 필요해요.\n빙구단원이 맞는지 한 번 더 확인해 볼까요? 😊",
      onConfirm: () {
        if (navigatorKey.currentState?.canPop() ?? false) {
          navigatorKey.currentState?.pop();
        }
        BingRouter.router.go(BingRoute.login);
      }
    );
  }
}