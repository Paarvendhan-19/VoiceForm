import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/data/firestore_service.dart';
import '../../data/repositories/survey_repository.dart';
import '../../domain/entities/survey_session.dart';

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final surveyRepositoryProvider = Provider<SurveyRepository>((ref) {
  final firestoreService = ref.watch(firestoreServiceProvider);
  return SurveyRepositoryImpl(firestoreService);
});

final currentSessionProvider = StateProvider<SurveySession?>((ref) => null);

final userSessionsProvider = FutureProvider.family<List<SurveySession>, String>(
  (ref, userId) async {
    final repository = ref.watch(surveyRepositoryProvider);
    final result = await repository.getUserSessions(userId);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (sessions) => sessions,
    );
  },
);
