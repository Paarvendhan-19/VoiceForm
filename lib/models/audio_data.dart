import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';
import 'converters.dart';

part 'audio_data.g.dart';

/// Enum representing audio format types
@JsonEnum()
enum AudioFormat {
  wav,
  mp3,
  pcm;
}

/// Represents audio data with metadata
@JsonSerializable()
class AudioData {
  /// Audio bytes
  @Uint8ListConverter()
  final Uint8List bytes;

  /// Sample rate in Hz (e.g., 44100, 16000)
  final int sampleRate;

  /// Audio format
  final AudioFormat format;

  const AudioData({
    required this.bytes,
    required this.sampleRate,
    required this.format,
  });

  /// Create AudioData from JSON
  factory AudioData.fromJson(Map<String, dynamic> json) =>
      _$AudioDataFromJson(json);

  /// Convert AudioData to JSON
  Map<String, dynamic> toJson() => _$AudioDataToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioData &&
          runtimeType == other.runtimeType &&
          _listEquals(bytes, other.bytes) &&
          sampleRate == other.sampleRate &&
          format == other.format;

  @override
  int get hashCode => bytes.hashCode ^ sampleRate.hashCode ^ format.hashCode;

  /// Helper method to compare Uint8List
  bool _listEquals(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
