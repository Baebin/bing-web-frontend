import 'package:bing_web_frontend/core/auth/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.get("BING_API_URL"),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      contentType: 'application/json',
    ),
  );
  dio.interceptors.addAll([
    AuthInterceptor(ref, dio),
    LogInterceptor(requestBody: true, responseBody: true),
  ]);
  return dio;
});