// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
  id: json['id'] as String,
  userId: json['userId'] as String,
  form: FormStructure.fromJson(json['form'] as Map<String, dynamic>),
  filledData: json['filledData'] as Map<String, dynamic>,
  status: $enumDecode(_$SessionStatusEnumMap, json['status']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  pdfUrl: json['pdfUrl'] as String?,
);

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'form': instance.form.toJson(),
  'filledData': instance.filledData,
  'status': _$SessionStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'pdfUrl': instance.pdfUrl,
};

const _$SessionStatusEnumMap = {
  SessionStatus.scanning: 'scanning',
  SessionStatus.filling: 'filling',
  SessionStatus.generating: 'generating',
  SessionStatus.completed: 'completed',
  SessionStatus.failed: 'failed',
};
