import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

/// Provider for the AuthService instance
/// This allows dependency injection and easy testing
final authServiceProvider = Provider<AuthService>((ref) {
  return FirebaseAuthService();
});

/// StreamProvider that exposes the authentication state changes
/// This provider listens to Firebase Auth state changes and provides
/// the current user or null if not authenticated
/// 
/// Validates: Requirements 1.2, 8.2
final authStateProvider = StreamProvider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
});

/// Provider that exposes the current authenticated user synchronously
/// Returns null if no user is authenticated
/// 
/// Validates: Requirements 1.2
final currentUserProvider = Provider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.currentUser;
});
