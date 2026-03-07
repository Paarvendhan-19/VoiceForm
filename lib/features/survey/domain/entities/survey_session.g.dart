// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveySessionImpl _$$SurveySessionImplFromJson(Map<String, dynamic> json) =>
    _$SurveySessionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      responses: (json['responses'] as List<dynamic>)
          .map((e) => SurveyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$SessionStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      pdfUrl: json['pdfUrl'] as String?,
    );

Map<String, dynamic> _$$SurveySessionImplToJson(_$SurveySessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'language': instance.language,
      'responses': instance.responses,
      'status': _$SessionStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'pdfUrl': instance.pdfUrl,
    };

const _$SessionStatusEnumMap = {
  SessionStatus.created: 'created',
  SessionStatus.scanning: 'scanning',
  SessionStatus.recording: 'recording',
  SessionStatus.processing: 'processing',
  SessionStatus.completed: 'completed',
  SessionStatus.failed: 'failed',
};
