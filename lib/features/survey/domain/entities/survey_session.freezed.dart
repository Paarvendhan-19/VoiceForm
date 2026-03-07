// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SurveySession _$SurveySessionFromJson(Map<String, dynamic> json) {
  return _SurveySession.fromJson(json);
}

/// @nodoc
mixin _$SurveySession {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  List<SurveyResponse> get responses => throw _privateConstructorUsedError;
  SessionStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get pdfUrl => throw _privateConstructorUsedError;

  /// Serializes this SurveySession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SurveySession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveySessionCopyWith<SurveySession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveySessionCopyWith<$Res> {
  factory $SurveySessionCopyWith(
    SurveySession value,
    $Res Function(SurveySession) then,
  ) = _$SurveySessionCopyWithImpl<$Res, SurveySession>;
  @useResult
  $Res call({
    String id,
    String userId,
    String title,
    String description,
    String language,
    List<SurveyResponse> responses,
    SessionStatus status,
    DateTime createdAt,
    DateTime? completedAt,
    String? pdfUrl,
  });
}

/// @nodoc
class _$SurveySessionCopyWithImpl<$Res, $Val extends SurveySession>
    implements $SurveySessionCopyWith<$Res> {
  _$SurveySessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SurveySession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? language = null,
    Object? responses = null,
    Object? status = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? pdfUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            responses: null == responses
                ? _value.responses
                : responses // ignore: cast_nullable_to_non_nullable
                      as List<SurveyResponse>,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as SessionStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            pdfUrl: freezed == pdfUrl
                ? _value.pdfUrl
                : pdfUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SurveySessionImplCopyWith<$Res>
    implements $SurveySessionCopyWith<$Res> {
  factory _$$SurveySessionImplCopyWith(
    _$SurveySessionImpl value,
    $Res Function(_$SurveySessionImpl) then,
  ) = __$$SurveySessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String title,
    String description,
    String language,
    List<SurveyResponse> responses,
    SessionStatus status,
    DateTime createdAt,
    DateTime? completedAt,
    String? pdfUrl,
  });
}

/// @nodoc
class __$$SurveySessionImplCopyWithImpl<$Res>
    extends _$SurveySessionCopyWithImpl<$Res, _$SurveySessionImpl>
    implements _$$SurveySessionImplCopyWith<$Res> {
  __$$SurveySessionImplCopyWithImpl(
    _$SurveySessionImpl _value,
    $Res Function(_$SurveySessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SurveySession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? language = null,
    Object? responses = null,
    Object? status = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? pdfUrl = freezed,
  }) {
    return _then(
      _$SurveySessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        responses: null == responses
            ? _value._responses
            : responses // ignore: cast_nullable_to_non_nullable
                  as List<SurveyResponse>,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SessionStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pdfUrl: freezed == pdfUrl
            ? _value.pdfUrl
            : pdfUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveySessionImpl implements _SurveySession {
  const _$SurveySessionImpl({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.language,
    required final List<SurveyResponse> responses,
    required this.status,
    required this.createdAt,
    this.completedAt,
    this.pdfUrl,
  }) : _responses = responses;

  factory _$SurveySessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveySessionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String language;
  final List<SurveyResponse> _responses;
  @override
  List<SurveyResponse> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  @override
  final SessionStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;
  @override
  final String? pdfUrl;

  @override
  String toString() {
    return 'SurveySession(id: $id, userId: $userId, title: $title, description: $description, language: $language, responses: $responses, status: $status, createdAt: $createdAt, completedAt: $completedAt, pdfUrl: $pdfUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveySessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(
              other._responses,
              _responses,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    title,
    description,
    language,
    const DeepCollectionEquality().hash(_responses),
    status,
    createdAt,
    completedAt,
    pdfUrl,
  );

  /// Create a copy of SurveySession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveySessionImplCopyWith<_$SurveySessionImpl> get copyWith =>
      __$$SurveySessionImplCopyWithImpl<_$SurveySessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveySessionImplToJson(this);
  }
}

abstract class _SurveySession implements SurveySession {
  const factory _SurveySession({
    required final String id,
    required final String userId,
    required final String title,
    required final String description,
    required final String language,
    required final List<SurveyResponse> responses,
    required final SessionStatus status,
    required final DateTime createdAt,
    final DateTime? completedAt,
    final String? pdfUrl,
  }) = _$SurveySessionImpl;

  factory _SurveySession.fromJson(Map<String, dynamic> json) =
      _$SurveySessionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get language;
  @override
  List<SurveyResponse> get responses;
  @override
  SessionStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  String? get pdfUrl;

  /// Create a copy of SurveySession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveySessionImplCopyWith<_$SurveySessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
