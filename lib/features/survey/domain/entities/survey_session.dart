import 'package:freezed_annotation/freezed_annotation.dart';
import 'survey_response.dart';

part 'survey_session.freezed.dart';
part 'survey_session.g.dart';

@freezed
class SurveySession with _$SurveySession {
  const factory SurveySession({
    required String id,
    required String userId,
    required String title,
    required String description,
    required String language,
    required List<SurveyResponse> responses,
    required SessionStatus status,
    required DateTime createdAt,
    DateTime? completedAt,
    String? pdfUrl,
  }) = _SurveySession;

  factory SurveySession.fromJson(Map<String, dynamic> json) =>
      _$SurveySessionFromJson(json);
}

enum SessionStatus {
  created,
  scanning,
  recording,
  processing,
  completed,
  failed,
}
