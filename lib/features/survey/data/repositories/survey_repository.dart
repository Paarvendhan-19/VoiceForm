import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/data/firestore_service.dart';
import '../../domain/entities/survey_session.dart';
import '../../domain/entities/survey_response.dart';

abstract class SurveyRepository {
  Future<Either<Failure, SurveySession>> createSession(SurveySession session);
  Future<Either<Failure, SurveySession>> getSession(String sessionId);
  Future<Either<Failure, List<SurveySession>>> getUserSessions(String userId);
  Future<Either<Failure, void>> updateSession(SurveySession session);
  Future<Either<Failure, void>> addResponse(String sessionId, SurveyResponse response);
  Future<Either<Failure, void>> deleteSession(String sessionId);
}

class SurveyRepositoryImpl implements SurveyRepository {
  final FirestoreService _firestoreService;

  SurveyRepositoryImpl(this._firestoreService);

  @override
  Future<Either<Failure, SurveySession>> createSession(SurveySession session) async {
    return await _firestoreService.create<SurveySession>(
      collection: 'sessions',
      docId: session.id,
      data: session.toJson(),
      fromJson: SurveySession.fromJson,
    );
  }

  @override
  Future<Either<Failure, SurveySession>> getSession(String sessionId) async {
    return await _firestoreService.read<SurveySession>(
      collection: 'sessions',
      docId: sessionId,
      fromJson: SurveySession.fromJson,
    );
  }

  @override
  Future<Either<Failure, List<SurveySession>>> getUserSessions(String userId) async {
    return await _firestoreService.readAll<SurveySession>(
      collection: 'sessions',
      fromJson: SurveySession.fromJson,
      queryBuilder: (ref) => ref.where('userId', isEqualTo: userId),
    );
  }

  @override
  Future<Either<Failure, void>> updateSession(SurveySession session) async {
    return await _firestoreService.update(
      collection: 'sessions',
      docId: session.id,
      data: session.toJson(),
    );
  }

  @override
  Future<Either<Failure, void>> addResponse(
    String sessionId,
    SurveyResponse response,
  ) async {
    try {
      final sessionResult = await getSession(sessionId);
      return sessionResult.fold(
        (failure) => Left(failure),
        (session) async {
          final updatedSession = session.copyWith(
            responses: [...session.responses, response],
          );
          return await updateSession(updatedSession);
        },
      );
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSession(String sessionId) async {
    return await _firestoreService.delete(
      collection: 'sessions',
      docId: sessionId,
    );
  }
}
