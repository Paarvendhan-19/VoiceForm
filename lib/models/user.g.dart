// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  userId: json['userId'] as String,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  preferredLanguage: json['preferredLanguage'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastActiveAt: DateTime.parse(json['lastActiveAt'] as String),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'userId': instance.userId,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'preferredLanguage': instance.preferredLanguage,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastActiveAt': instance.lastActiveAt.toIso8601String(),
};
