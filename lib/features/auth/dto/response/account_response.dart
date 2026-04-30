import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_response.freezed.dart';
part 'account_response.g.dart';

@freezed
sealed class AccountResponse with _$AccountResponse {
  const factory AccountResponse({
    required String id,
    required int idx,
    required String nickname,
    required String email,
    required String bio,
    @JsonKey(name: "reg_date") required String regDate,
  }) = _AccountResponse;

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);
}