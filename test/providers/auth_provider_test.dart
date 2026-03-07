import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vani_sahayak/models/user.dart';
import 'package:vani_sahayak/providers/auth_provider.dart';
import 'package:vani_sahayak/services/auth_service.dart';

/// Mock AuthService for testing
class MockAuthService implements AuthService {
  User? _currentUser;
  final _authStateController = StreamController<User?>.broadcast();
  bool _isClosed = false;

  MockAuthService({User? initialUser}) : _currentUser = initialUser {
    // Emit initial state synchronously to avoid timing issues
    _emitState(initialUser);
  }

  void _emitState(User? user) {
    if (!_isClosed) {
      _authStateController.add(user);
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    _currentUser = User(
      userId: 'test-google-user',
      email: 'test@gmail.com',
      phoneNumber: null,
      preferredLanguage: 'en',
      createdAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
    );
    _emitState(_currentUser);
    return _currentUser;
  }

  @override
  Future<User?> signInWithPhone(String phoneNumber) async {
    _currentUser = User(
      userId: 'test-phone-user',
      email: null,
      phoneNumber: phoneNumber,
      preferredLanguage: 'en',
      createdAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
    );
    _emitState(_currentUser);
    return _currentUser;
  }

  @override
  Future<void> signOut() async {
    _currentUser = null;
    _emitState(null);
  }

  @override
  Stream<User?> get authStateChanges => _authStateController.stream;

  @override
  User? get currentUser => _currentUser;

  void dispose() {
    _isClosed = true;
    _authStateController.close();
  }
}

void main() {
  group('AuthStateProvider', () {
    late ProviderContainer container;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      container = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(mockAuthService),
        ],
      );
    });

    tearDown(() {
      mockAuthService.dispose();
      container.dispose();
    });

    test('initially provides null when no user is authenticated', () async {
      // Listen to the auth state stream
      final subscription = container.listen(
        authStateProvider,
        (previous, next) {},
      );

      // Wait for the stream to emit
      await Future.delayed(Duration(milliseconds: 100));

      // Verify initial state is null (no user)
      expect(subscription.read().value, isNull);
    });

    test('emits user when sign in occurs', () async {
      // Create a list to track emitted values
      final emittedValues = <AsyncValue<User?>>[];

      // Listen to auth state changes
      container.listen(
        authStateProvider,
        (previous, next) {
          emittedValues.add(next);
        },
      );

      // Trigger sign in
      await mockAuthService.signInWithGoogle();

      // Wait for stream to propagate
      await Future.delayed(Duration(milliseconds: 100));

      // Verify we received the user
      final lastValue = container.read(authStateProvider);
      expect(lastValue.hasValue, isTrue);
      expect(lastValue.value, isNotNull);
      expect(lastValue.value?.userId, equals('test-google-user'));
      expect(lastValue.value?.email, equals('test@gmail.com'));
    });

    test('emits null when sign out occurs', () async {
      // Listen to auth state changes to ensure we catch all emissions
      final states = <User?>[];
      final subscription = container.listen(
        authStateProvider,
        (previous, next) {
          if (next.hasValue) {
            states.add(next.value);
          }
        },
      );

      // First sign in
      await mockAuthService.signInWithGoogle();
      
      // Wait for the stream to emit
      await Future.delayed(Duration(milliseconds: 300));

      // Verify we received the signed-in user
      expect(states, isNotEmpty);
      expect(states.last, isNotNull);
      expect(states.last?.userId, equals('test-google-user'));

      // Now sign out
      await mockAuthService.signOut();
      await Future.delayed(Duration(milliseconds: 300));

      // Verify we received the null state after sign out
      expect(states.last, isNull);
    });

    test('handles multiple auth state changes', () async {
      final emittedValues = <User?>[];

      // Listen to auth state changes
      container.listen(
        authStateProvider,
        (previous, next) {
          if (next.hasValue) {
            emittedValues.add(next.value);
          }
        },
      );

      // Perform multiple auth operations
      await mockAuthService.signInWithGoogle();
      await Future.delayed(Duration(milliseconds: 100));

      await mockAuthService.signOut();
      await Future.delayed(Duration(milliseconds: 100));

      await mockAuthService.signInWithPhone('+1234567890');
      await Future.delayed(Duration(milliseconds: 100));

      // Verify we received all state changes
      expect(emittedValues.length, greaterThanOrEqualTo(2));
      expect(emittedValues.last?.phoneNumber, equals('+1234567890'));
    });
  });

  group('CurrentUserProvider', () {
    late ProviderContainer container;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      container = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(mockAuthService),
        ],
      );
    });

    tearDown(() {
      mockAuthService.dispose();
      container.dispose();
    });

    test('returns null when no user is authenticated', () {
      final currentUser = container.read(currentUserProvider);
      expect(currentUser, isNull);
    });

    test('returns current user after sign in', () async {
      // Sign in
      await mockAuthService.signInWithGoogle();

      // Read current user
      final currentUser = container.read(currentUserProvider);

      expect(currentUser, isNotNull);
      expect(currentUser?.userId, equals('test-google-user'));
      expect(currentUser?.email, equals('test@gmail.com'));
    });

    test('returns null after sign out', () async {
      // Sign in first
      await mockAuthService.signInWithGoogle();
      
      // Refresh the container to get updated state
      container.invalidate(currentUserProvider);
      expect(container.read(currentUserProvider), isNotNull);

      // Sign out
      await mockAuthService.signOut();
      
      // Refresh the container to get updated state
      container.invalidate(currentUserProvider);

      // Verify current user is null
      final currentUser = container.read(currentUserProvider);
      expect(currentUser, isNull);
    });
  });

  group('AuthServiceProvider', () {
    test('can be overridden for testing', () {
      final mockService = MockAuthService();
      final container = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(mockService),
        ],
      );

      final authService = container.read(authServiceProvider);
      expect(authService, equals(mockService));

      mockService.dispose();
      container.dispose();
    });
  });
}
