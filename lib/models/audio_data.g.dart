// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioData _$AudioDataFromJson(Map<String, dynamic> json) => AudioData(
  bytes: const Uint8ListConverter().fromJson(json['bytes'] as String),
  sampleRate: (json['sampleRate'] as num).toInt(),
  format: $enumDecode(_$AudioFormatEnumMap, json['format']),
);

Map<String, dynamic> _$AudioDataToJson(AudioData instance) => <String, dynamic>{
  'bytes': const Uint8ListConverter().toJson(instance.bytes),
  'sampleRate': instance.sampleRate,
  'format': _$AudioFormatEnumMap[instance.format]!,
};

const _$AudioFormatEnumMap = {
  AudioFormat.wav: 'wav',
  AudioFormat.mp3: 'mp3',
  AudioFormat.pcm: 'pcm',
};
