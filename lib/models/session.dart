import 'package:json_annotation/json_annotation.dart';
import 'form_structure.dart';
import 'session_status.dart';

part 'session.g.dart';

/// Represents a form-filling session
@JsonSerializable(explicitToJson: true)
class Session {
  /// Unique identifier for the session
  final String id;

  /// User ID who owns this session
  final String userId;

  /// The form structure being filled
  final FormStructure form;

  /// Map of field IDs to their filled values
  final Map<String, dynamic> filledData;

  /// Current status of the session
  final SessionStatus status;

  /// Timestamp when the session was created
  final DateTime createdAt;

  /// Timestamp when the session was completed (if applicable)
  final DateTime? completedAt;

  /// URL to the generated PDF (if completed)
  final String? pdfUrl;

  const Session({
    required this.id,
    required this.userId,
    required this.form,
    required this.filledData,
    required this.status,
    required this.createdAt,
    this.completedAt,
    this.pdfUrl,
  });

  /// Create Session from JSON
  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  /// Convert Session to JSON
  Map<String, dynamic> toJson() => _$SessionToJson(this);

  /// Create a copy of this session with updated fields
  Session copyWith({
    String? id,
    String? userId,
    FormStructure? form,
    Map<String, dynamic>? filledData,
    SessionStatus? status,
    DateTime? createdAt,
    DateTime? completedAt,
    String? pdfUrl,
  }) {
    return Session(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      form: form ?? this.form,
      filledData: filledData ?? this.filledData,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      pdfUrl: pdfUrl ?? this.pdfUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Session &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          form == other.form &&
          _mapEquals(filledData, other.filledData) &&
          status == other.status &&
          createdAt == other.createdAt &&
          completedAt == other.completedAt &&
          pdfUrl == other.pdfUrl;

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      form.hashCode ^
      filledData.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      completedAt.hashCode ^
      pdfUrl.hashCode;

  /// Helper method to compare maps
  bool _mapEquals(Map<String, dynamic> a, Map<String, dynamic> b) {
    if (a.length != b.length) return false;
    for (var key in a.keys) {
      if (!b.containsKey(key) || a[key] != b[key]) return false;
    }
    return true;
  }
}
