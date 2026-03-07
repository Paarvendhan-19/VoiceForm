import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_response.freezed.dart';
part 'survey_response.g.dart';

@freezed
class SurveyResponse with _$SurveyResponse {
  const factory SurveyResponse({
    required String id,
    required String sessionId,
    required String questionId,
    required String question,
    required String audioUrl,
    required String transcription,
    required double sentimentScore,
    required DateTime timestamp,
    String? sentiment,
  }) = _SurveyResponse;

  factory SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseFromJson(json);
}
