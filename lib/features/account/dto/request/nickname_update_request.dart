import 'package:freezed_annotation/freezed_annotation.dart';

part 'nickname_update_request.freezed.dart';
part 'nickname_update_request.g.dart';

@freezed
sealed class NicknameUpdateRequest with _$NicknameUpdateRequest {
  const factory NicknameUpdateRequest({
    required String nickname,
  }) = _NicknameUpdateRequest;

  factory NicknameUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$NicknameUpdateRequestFromJson(json);
}