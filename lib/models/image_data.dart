import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';
import 'converters.dart';

part 'image_data.g.dart';

/// Represents image data with dimensions
@JsonSerializable()
class ImageData {
  /// Image bytes
  @Uint8ListConverter()
  final Uint8List bytes;

  /// Image width in pixels
  final int width;

  /// Image height in pixels
  final int height;

  const ImageData({
    required this.bytes,
    required this.width,
    required this.height,
  });

  /// Create ImageData from JSON
  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  /// Convert ImageData to JSON
  Map<String, dynamic> toJson() => _$ImageDataToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageData &&
          runtimeType == other.runtimeType &&
          _listEquals(bytes, other.bytes) &&
          width == other.width &&
          height == other.height;

  @override
  int get hashCode => bytes.hashCode ^ width.hashCode ^ height.hashCode;

  /// Helper method to compare Uint8List
  bool _listEquals(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
