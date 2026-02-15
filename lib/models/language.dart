import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

/// Represents a supported language in the application
@JsonSerializable()
class Language {
  /// Language code (e.g., "hi", "ta", "bn")
  final String code;

  /// English name of the language (e.g., "Hindi", "Tamil")
  final String name;

  /// Native name of the language (e.g., "हिन्दी", "தமிழ்")
  final String nativeName;

  const Language({
    required this.code,
    required this.name,
    required this.nativeName,
  });

  /// Create Language from JSON
  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  /// Convert Language to JSON
  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Language &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name &&
          nativeName == other.nativeName;

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ nativeName.hashCode;
}
