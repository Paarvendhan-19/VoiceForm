import 'package:json_annotation/json_annotation.dart';
import 'form_field.dart';
import 'image_data.dart';

part 'form_structure.g.dart';

/// Represents the complete structure of a scanned form
@JsonSerializable()
class FormStructure {
  /// Unique identifier for the form
  final String formId;

  /// List of fields extracted from the form
  final List<FormFieldModel> fields;

  /// Original scanned image of the form
  final ImageData originalImage;

  /// Timestamp when the form was scanned
  final DateTime scannedAt;

  const FormStructure({
    required this.formId,
    required this.fields,
    required this.originalImage,
    required this.scannedAt,
  });

  /// Create FormStructure from JSON
  factory FormStructure.fromJson(Map<String, dynamic> json) =>
      _$FormStructureFromJson(json);

  /// Convert FormStructure to JSON
  Map<String, dynamic> toJson() => _$FormStructureToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormStructure &&
          runtimeType == other.runtimeType &&
          formId == other.formId &&
          _listEquals(fields, other.fields) &&
          originalImage == other.originalImage &&
          scannedAt == other.scannedAt;

  @override
  int get hashCode =>
      formId.hashCode ^
      fields.hashCode ^
      originalImage.hashCode ^
      scannedAt.hashCode;

  /// Helper method to compare lists
  bool _listEquals(List<FormFieldModel> a, List<FormFieldModel> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
