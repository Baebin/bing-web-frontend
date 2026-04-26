import 'dart:io';

import 'package:dio/dio.dart';

class ApiErrorResponse {
  final String code;
  final String message;
  final int status;
  final String? timestamp;

  ApiErrorResponse({
    required this.code,
    required this.message,
    required this.status,
    String? timestamp,
  }) : timestamp = timestamp ?? DateTime.now().toIso8601String();

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
        code: json['code'] ?? "UNKNOWN",
        message: json['message'] ?? "알 수 없는 오류가 발생했습니다.",
        status: json['status'] ?? HttpStatus.badRequest,
        timestamp: json['timestamp']
    );
  }

  // Client
  static ApiErrorResponse clientCritical() => ApiErrorResponse(
    code: "CLIENT_CRITICAL",
    message: "앱 실행 중 오류가 발생했습니다.",
    status: HttpStatus.internalServerError,
  );
  static ApiErrorResponse parse() => ApiErrorResponse(
    code: "PARSE_ERROR",
    message: "응답 데이터를 처리하는 중 오류가 발생했습니다.",
    status: HttpStatus.internalServerError,
  );

  // Network
  static ApiErrorResponse serverOffline() => ApiErrorResponse(
    code: "SERVER_OFFLINE",
    message: "서버에 접속할 수 없습니다.",
    status: HttpStatus.serviceUnavailable,
  );
  static ApiErrorResponse timeout() => ApiErrorResponse(
    code: "TIMEOUT",
    message: "서버 연결 시간이 초과되었습니다.",
    status: HttpStatus.gatewayTimeout,
  );
  static ApiErrorResponse unknown() => ApiErrorResponse(
    code: "UNKNOWN_ERROR",
    message: "알 수 없는 통신 오류가 발생했습니다.",
    status: HttpStatus.internalServerError,
  );

  // Server
  static ApiErrorResponse unexpected(Response response) => ApiErrorResponse(
    code: "UNEXPECTED_${response.statusMessage ?? response.statusCode ?? 'UNKNOWN'}",
    message: "서버로부터 예상치 못한 응답을 받았습니다.",
    status: response.statusCode ?? HttpStatus.internalServerError,
  );
}