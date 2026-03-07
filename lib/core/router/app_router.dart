import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/survey/presentation/screens/survey_list_screen.dart';
import '../../features/survey/presentation/screens/create_survey_screen.dart';
import '../../features/survey/presentation/screens/scan_form_screen.dart';
import '../../features/survey/presentation/screens/voice_recording_screen.dart';
import '../../features/survey/presentation/screens/review_screen.dart';
import '../../features/survey/presentation/screens/pdf_preview_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/history/presentation/screens/history_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/surveys',
        builder: (context, state) => const SurveyListScreen(),
      ),
      GoRoute(
        path: '/create-survey',
        builder: (context, state) => const CreateSurveyScreen(),
      ),
      GoRoute(
        path: '/scan-form',
        builder: (context, state) => const ScanFormScreen(),
      ),
      GoRoute(
        path: '/voice-recording/:sessionId',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return VoiceRecordingScreen(sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/review/:sessionId',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return ReviewScreen(sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/pdf-preview/:sessionId',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return PDFPreviewScreen(sessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/history',
        builder: (context, state) => const HistoryScreen(),
      ),
    ],
  );
});
