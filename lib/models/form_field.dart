import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'field_type.dart';

part 'form_field.g.dart';

/// Represents an individual input field on a physical form
@JsonSerializable()
class FormFieldModel {
  /// Unique identifier for the field
  final String id;

  /// Label text of the field
  final String label;

  /// Type of the field (text, number, date, etc.)
  final FieldType type;

  /// Position and size of the field on the form
  @RectConverter()
  final Rect coordinates;

  /// Whether this field is required to be filled
  final bool isRequired;

  /// Optional hint text for the field
  final String? hint;

  const FormFieldModel({
    required this.id,
    required this.label,
    required this.type,
    required this.coordinates,
    required this.isRequired,
    this.hint,
  });

  /// Create FormFieldModel from JSON
  factory FormFieldModel.fromJson(Map<String, dynamic> json) =>
      _$FormFieldModelFromJson(json);

  /// Convert FormFieldModel to JSON
  Map<String, dynamic> toJson() => _$FormFieldModelToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormFieldModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          type == other.type &&
          coordinates == other.coordinates &&
          isRequired == other.isRequired &&
          hint == other.hint;

  @override
  int get hashCode =>
      id.hashCode ^
      label.hashCode ^
      type.hashCode ^
      coordinates.hashCode ^
      isRequired.hashCode ^
      hint.hashCode;
}

/// Custom JSON converter for Rect
class RectConverter implements JsonConverter<Rect, Map<String, dynamic>> {
  const RectConverter();

  @override
  Rect fromJson(Map<String, dynamic> json) {
    return Rect.fromLTWH(
      (json['x'] as num).toDouble(),
      (json['y'] as num).toDouble(),
      (json['width'] as num).toDouble(),
      (json['height'] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson(Rect rect) {
    return {
      'x': rect.left,
      'y': rect.top,
      'width': rect.width,
      'height': rect.height,
    };
  }
}
