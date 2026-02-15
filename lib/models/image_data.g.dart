// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
  bytes: const Uint8ListConverter().fromJson(json['bytes'] as String),
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
);

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
  'bytes': const Uint8ListConverter().toJson(instance.bytes),
  'width': instance.width,
  'height': instance.height,
};
