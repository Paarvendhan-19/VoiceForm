// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SurveyResponse _$SurveyResponseFromJson(Map<String, dynamic> json) {
  return _SurveyResponse.fromJson(json);
}

/// @nodoc
mixin _$SurveyResponse {
  String get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get audioUrl => throw _privateConstructorUsedError;
  String get transcription => throw _privateConstructorUsedError;
  double get sentimentScore => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get sentiment => throw _privateConstructorUsedError;

  /// Serializes this SurveyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SurveyResponseCopyWith<SurveyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyResponseCopyWith<$Res> {
  factory $SurveyResponseCopyWith(
    SurveyResponse value,
    $Res Function(SurveyResponse) then,
  ) = _$SurveyResponseCopyWithImpl<$Res, SurveyResponse>;
  @useResult
  $Res call({
    String id,
    String sessionId,
    String questionId,
    String question,
    String audioUrl,
    String transcription,
    double sentimentScore,
    DateTime timestamp,
    String? sentiment,
  });
}

/// @nodoc
class _$SurveyResponseCopyWithImpl<$Res, $Val extends SurveyResponse>
    implements $SurveyResponseCopyWith<$Res> {
  _$SurveyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? questionId = null,
    Object? question = null,
    Object? audioUrl = null,
    Object? transcription = null,
    Object? sentimentScore = null,
    Object? timestamp = null,
    Object? sentiment = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            questionId: null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                      as String,
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            audioUrl: null == audioUrl
                ? _value.audioUrl
                : audioUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            transcription: null == transcription
                ? _value.transcription
                : transcription // ignore: cast_nullable_to_non_nullable
                      as String,
            sentimentScore: null == sentimentScore
                ? _value.sentimentScore
                : sentimentScore // ignore: cast_nullable_to_non_nullable
                      as double,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            sentiment: freezed == sentiment
                ? _value.sentiment
                : sentiment // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SurveyResponseImplCopyWith<$Res>
    implements $SurveyResponseCopyWith<$Res> {
  factory _$$SurveyResponseImplCopyWith(
    _$SurveyResponseImpl value,
    $Res Function(_$SurveyResponseImpl) then,
  ) = __$$SurveyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String sessionId,
    String questionId,
    String question,
    String audioUrl,
    String transcription,
    double sentimentScore,
    DateTime timestamp,
    String? sentiment,
  });
}

/// @nodoc
class __$$SurveyResponseImplCopyWithImpl<$Res>
    extends _$SurveyResponseCopyWithImpl<$Res, _$SurveyResponseImpl>
    implements _$$SurveyResponseImplCopyWith<$Res> {
  __$$SurveyResponseImplCopyWithImpl(
    _$SurveyResponseImpl _value,
    $Res Function(_$SurveyResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? questionId = null,
    Object? question = null,
    Object? audioUrl = null,
    Object? transcription = null,
    Object? sentimentScore = null,
    Object? timestamp = null,
    Object? sentiment = freezed,
  }) {
    return _then(
      _$SurveyResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        questionId: null == questionId
            ? _value.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String,
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        audioUrl: null == audioUrl
            ? _value.audioUrl
            : audioUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        transcription: null == transcription
            ? _value.transcription
            : transcription // ignore: cast_nullable_to_non_nullable
                  as String,
        sentimentScore: null == sentimentScore
            ? _value.sentimentScore
            : sentimentScore // ignore: cast_nullable_to_non_nullable
                  as double,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        sentiment: freezed == sentiment
            ? _value.sentiment
            : sentiment // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyResponseImpl implements _SurveyResponse {
  const _$SurveyResponseImpl({
    required this.id,
    required this.sessionId,
    required this.questionId,
    required this.question,
    required this.audioUrl,
    required this.transcription,
    required this.sentimentScore,
    required this.timestamp,
    this.sentiment,
  });

  factory _$SurveyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionId;
  @override
  final String questionId;
  @override
  final String question;
  @override
  final String audioUrl;
  @override
  final String transcription;
  @override
  final double sentimentScore;
  @override
  final DateTime timestamp;
  @override
  final String? sentiment;

  @override
  String toString() {
    return 'SurveyResponse(id: $id, sessionId: $sessionId, questionId: $questionId, question: $question, audioUrl: $audioUrl, transcription: $transcription, sentimentScore: $sentimentScore, timestamp: $timestamp, sentiment: $sentiment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.transcription, transcription) ||
                other.transcription == transcription) &&
            (identical(other.sentimentScore, sentimentScore) ||
                other.sentimentScore == sentimentScore) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    questionId,
    question,
    audioUrl,
    transcription,
    sentimentScore,
    timestamp,
    sentiment,
  );

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyResponseImplCopyWith<_$SurveyResponseImpl> get copyWith =>
      __$$SurveyResponseImplCopyWithImpl<_$SurveyResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyResponseImplToJson(this);
  }
}

abstract class _SurveyResponse implements SurveyResponse {
  const factory _SurveyResponse({
    required final String id,
    required final String sessionId,
    required final String questionId,
    required final String question,
    required final String audioUrl,
    required final String transcription,
    required final double sentimentScore,
    required final DateTime timestamp,
    final String? sentiment,
  }) = _$SurveyResponseImpl;

  factory _SurveyResponse.fromJson(Map<String, dynamic> json) =
      _$SurveyResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionId;
  @override
  String get questionId;
  @override
  String get question;
  @override
  String get audioUrl;
  @override
  String get transcription;
  @override
  double get sentimentScore;
  @override
  DateTime get timestamp;
  @override
  String? get sentiment;

  /// Create a copy of SurveyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SurveyResponseImplCopyWith<_$SurveyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
