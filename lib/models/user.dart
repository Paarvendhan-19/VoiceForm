import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// Represents a user of the application
@JsonSerializable()
class User {
  /// Unique identifier for the user
  final String userId;

  /// User's email address
  final String? email;

  /// User's phone number
  final String? phoneNumber;

  /// User's preferred language code (e.g., "hi", "ta", "bn")
  final String preferredLanguage;

  /// Timestamp when the user account was created
  final DateTime createdAt;

  /// Timestamp of the user's last activity
  final DateTime lastActiveAt;

  const User({
    required this.userId,
    this.email,
    this.phoneNumber,
    required this.preferredLanguage,
    required this.createdAt,
    required this.lastActiveAt,
  });

  /// Create User from JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Convert User to JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Create a copy of this user with updated fields
  User copyWith({
    String? userId,
    String? email,
    String? phoneNumber,
    String? preferredLanguage,
    DateTime? createdAt,
    DateTime? lastActiveAt,
  }) {
    return User(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      createdAt: createdAt ?? this.createdAt,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          preferredLanguage == other.preferredLanguage &&
          createdAt == other.createdAt &&
          lastActiveAt == other.lastActiveAt;

  @override
  int get hashCode =>
      userId.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      preferredLanguage.hashCode ^
      createdAt.hashCode ^
      lastActiveAt.hashCode;
}
