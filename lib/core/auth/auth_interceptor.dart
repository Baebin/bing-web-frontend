import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../core/auth/token_manager.dart';

var logger = Logger(printer: PrettyPrinter());

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final _tokenManager = TokenManager();

  AuthInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenManager.getToken();
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      if (!err.requestOptions.path.contains('/login')) {
        logger.w("인증 만료 감지: ${err.requestOptions.path} 요청 실패. 토큰을 삭제합니다.");
        await _tokenManager.deleteToken();
      }
    }
    return handler.next(err);
  }
}