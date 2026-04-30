import 'dart:io';

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
        await ref.read(tokenManagerProvider).handleTokenExpired();
      }
    }
    return handler.next(err);
  }
}