import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_response.freezed.dart';
part 'token_response.g.dart';

@freezed
sealed class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    @JsonKey(name: "grant_type") required String grantType,
    @JsonKey(name: "access_token") required String accessToken,
    @JsonKey(name: "expires_in") required int expiresIn,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
}
