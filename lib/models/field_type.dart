import 'package:json_annotation/json_annotation.dart';

/// Enum representing different types of form fields
@JsonEnum()
enum FieldType {
  text,
  number,
  date,
  email,
  phone,
  checkbox,
  signature;
}
