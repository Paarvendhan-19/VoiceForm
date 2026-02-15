import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

/// Custom JSON converter for Uint8List
/// Converts binary data to/from base64 encoded strings for JSON serialization
class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) {
    return base64Decode(json);
  }

  @override
  String toJson(Uint8List bytes) {
    return base64Encode(bytes);
  }
}
