// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyResponseImpl _$$SurveyResponseImplFromJson(Map<String, dynamic> json) =>
    _$SurveyResponseImpl(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      questionId: json['questionId'] as String,
      question: json['question'] as String,
      audioUrl: json['audioUrl'] as String,
      transcription: json['transcription'] as String,
      sentimentScore: (json['sentimentScore'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      sentiment: json['sentiment'] as String?,
    );

Map<String, dynamic> _$$SurveyResponseImplToJson(
  _$SurveyResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sessionId': instance.sessionId,
  'questionId': instance.questionId,
  'question': instance.question,
  'audioUrl': instance.audioUrl,
  'transcription': instance.transcription,
  'sentimentScore': instance.sentimentScore,
  'timestamp': instance.timestamp.toIso8601String(),
  'sentiment': instance.sentiment,
};
