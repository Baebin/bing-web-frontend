import 'dart:io';

import 'package:bing_web_frontend/core/dto/response/api_error_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter());

abstract class BingApiService {
  final Dio dio;

  BingApiService(this.dio);

  Future<dynamic> safeApiCall(
      Future<Response> Function() request, {
        required dynamic Function(dynamic data) onSuccess,
      }) async {
    try {
      final response = await request();
      if (response.statusCode == HttpStatus.ok) {
        logger.i("Api Success: ${response.requestOptions.method} ${response.requestOptions.path}");
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
        logger.e("Parsing Error: Path: ${e.requestOptions.path} | Error: $parseError");
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