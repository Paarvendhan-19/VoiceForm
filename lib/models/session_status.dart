import 'package:json_annotation/json_annotation.dart';

/// Enum representing the status of a form-filling session
@JsonEnum()
enum SessionStatus {
  scanning,
  filling,
  generating,
  completed,
  failed;
}
