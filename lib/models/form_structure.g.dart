// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormStructure _$FormStructureFromJson(Map<String, dynamic> json) =>
    FormStructure(
      formId: json['formId'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => FormFieldModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalImage: ImageData.fromJson(
        json['originalImage'] as Map<String, dynamic>,
      ),
      scannedAt: DateTime.parse(json['scannedAt'] as String),
    );

Map<String, dynamic> _$FormStructureToJson(FormStructure instance) =>
    <String, dynamic>{
      'formId': instance.formId,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'originalImage': instance.originalImage.toJson(),
      'scannedAt': instance.scannedAt.toIso8601String(),
    };
