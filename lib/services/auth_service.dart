import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user.dart' as app_models;

/// Service for handling user authentication with Firebase Auth
abstract class AuthService {
  /// Sign in with Google account
  Future<app_models.User?> signInWithGoogle();

  /// Sign in with phone number
  /// Returns a Future that completes when verification is done
  Future<app_models.User?> signInWithPhone(String phoneNumber);

  /// Sign out the current user
  Future<void> signOut();

  /// Stream of authentication state changes
  Stream<app_models.User?> get authStateChanges;

  /// Get the current authenticated user
  app_models.User? get currentUser;
}

/// Implementation of AuthService using Firebase Auth
class FirebaseAuthService implements AuthService {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthService({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<app_models.User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final firebase_auth.UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Convert Firebase user to app User model
      return _convertFirebaseUser(userCredential.user);
    } catch (e) {
      // Log error and rethrow
      throw AuthException('Google sign-in failed: $e');
    }
  }

  @override
  Future<app_models.User?> signInWithPhone(String phoneNumber) async {
    try {
      // This is a simplified implementation
      // In a real app, you would need to handle SMS verification
      // For now, we'll throw an exception indicating this needs UI interaction
      throw AuthException(
        'Phone authentication is coming soon.',
      );
    } catch (e) {
      throw AuthException('Phone sign-in failed: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // Sign out from Google if signed in
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }

      // Sign out from Firebase
      await _firebaseAuth.signOut();
    } catch (e) {
      throw AuthException('Sign out failed: $e');
    }
  }

  @override
  Stream<app_models.User?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return _convertFirebaseUser(firebaseUser);
    });
  }

  @override
  app_models.User? get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return _convertFirebaseUser(firebaseUser);
  }

  /// Convert Firebase User to app User model
  app_models.User? _convertFirebaseUser(firebase_auth.User? firebaseUser) {
    if (firebaseUser == null) {
      return null;
    }

    final now = DateTime.now();

    return app_models.User(
      userId: firebaseUser.uid,
      email: firebaseUser.email,
      phoneNumber: firebaseUser.phoneNumber,
      preferredLanguage: 'en', // Default language, should be updated by user
      createdAt: firebaseUser.metadata.creationTime ?? now,
      lastActiveAt: now,
    );
  }
}

/// Custom exception for authentication errors
class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}
