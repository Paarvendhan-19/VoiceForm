// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormFieldModel _$FormFieldModelFromJson(Map<String, dynamic> json) =>
    FormFieldModel(
      id: json['id'] as String,
      label: json['label'] as String,
      type: $enumDecode(_$FieldTypeEnumMap, json['type']),
      coordinates: const RectConverter().fromJson(
        json['coordinates'] as Map<String, dynamic>,
      ),
      isRequired: json['isRequired'] as bool,
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$FormFieldModelToJson(FormFieldModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'coordinates': const RectConverter().toJson(instance.coordinates),
      'isRequired': instance.isRequired,
      'hint': instance.hint,
    };

const _$FieldTypeEnumMap = {
  FieldType.text: 'text',
  FieldType.number: 'number',
  FieldType.date: 'date',
  FieldType.email: 'email',
  FieldType.phone: 'phone',
  FieldType.checkbox: 'checkbox',
  FieldType.signature: 'signature',
};
