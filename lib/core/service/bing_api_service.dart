import 'dart:io';

import 'package:bing_web_frontend/core/dto/response/api_error_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter());

abstract class BingApiService {
  late final Dio dio;

  BingApiService() {
    final String baseUrl = dotenv.get("BING_API_URL");
    logger.d("baseUrl: ${baseUrl}");

    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        contentType: 'application/json',
      ),
    );
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<dynamic> safeApiCall(
      Future<Response> Function() request, {
        required dynamic Function(dynamic data) onSuccess,
      }) async {
    try {
      final response = await request();
      if (response.statusCode == HttpStatus.ok) {
        return onSuccess(response.data);
      }
      return ApiErrorResponse.unexpected(response);
    } on DioException catch (e) {
      return handleDioError(e);
    } catch (e) {
      logger.e("Client Critical Error: $e");
      return ApiErrorResponse.clientCritical();
    }
  }

  ApiErrorResponse handleDioError(DioException e) {
    if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
      try {
        return ApiErrorResponse.fromJson(e.response!.data);
      } catch (parseError) {
        logger.e("에러 응답 파싱 실패: $parseError");
        return ApiErrorResponse.parse();
      }
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return ApiErrorResponse.timeout();
    }
    if (e.error is SocketException) {
      return ApiErrorResponse.serverOffline();
    }
    return ApiErrorResponse.unknown();
  }
}