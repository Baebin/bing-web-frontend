import 'package:freezed_annotation/freezed_annotation.dart';

part 'bio_update_request.freezed.dart';
part 'bio_update_request.g.dart';

@freezed
sealed class BioUpdateRequest with _$BioUpdateRequest {
  const factory BioUpdateRequest({
    required String bio,
  }) = _BioUpdateRequest;

  factory BioUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$BioUpdateRequestFromJson(json);
}