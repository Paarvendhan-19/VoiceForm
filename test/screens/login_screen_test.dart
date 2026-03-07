import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vani_sahayak/screens/login_screen.dart';
import 'package:vani_sahayak/utils/theme_constants.dart';

/// Unit tests for LoginScreen UI
/// Validates: Requirements 1.1, 7.1, 7.2, 7.3, 7.4, 7.5
void main() {
  group('LoginScreen UI Tests', () {
    testWidgets('should display app logo and title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      // Wait for animations to complete
      await tester.pumpAndSettle();

      // Verify app title is displayed
      expect(find.text('Vani-Sahayak'), findsOneWidget);
      expect(find.text('Your Voice Assistant for Forms'), findsOneWidget);

      // Verify logo icon is displayed
      expect(find.byIcon(Icons.mic_rounded), findsOneWidget);
    });

    testWidgets('should display welcome message', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Welcome!'), findsOneWidget);
      expect(
        find.text('Fill forms using your voice in Indian languages'),
        findsOneWidget,
      );
    });

    testWidgets('should display Google sign-in button with green color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find the Google sign-in button
      final googleButton = find.text('Continue with Google');
      expect(googleButton, findsOneWidget);

      // Verify button color is green
      final elevatedButton = tester.widget<ElevatedButton>(
        find.ancestor(
          of: googleButton,
          matching: find.byType(ElevatedButton),
        ),
      );

      final buttonStyle = elevatedButton.style;
      final backgroundColor = buttonStyle?.backgroundColor?.resolve({});
      expect(backgroundColor, equals(ThemeConstants.green));
    });

    testWidgets('should display phone authentication option',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find the phone authentication button
      expect(find.text('Continue with Phone'), findsOneWidget);
      expect(find.byIcon(Icons.phone_rounded), findsOneWidget);
    });

    testWidgets('should display OR divider between auth options',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('OR'), findsOneWidget);
    });

    testWidgets('should display terms and privacy policy text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.textContaining('By continuing, you agree to our Terms of Service'),
        findsOneWidget,
      );
    });

    testWidgets('should show dialog when phone auth button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap the phone authentication button
      await tester.tap(find.text('Continue with Phone'));
      await tester.pumpAndSettle();

      // Verify dialog is shown
      expect(find.text('Phone Authentication'), findsOneWidget);
      expect(
        find.textContaining('Phone authentication will be available soon'),
        findsOneWidget,
      );

      // Close dialog
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
    });

    testWidgets('should use Indian Flag color gradient in background',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find the container with gradient
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byType(Container),
        ).first,
      );

      final decoration = container.decoration as BoxDecoration;
      final gradient = decoration.gradient as LinearGradient;

      // Verify gradient uses Indian Flag colors
      expect(gradient.colors.length, equals(3));
      expect(gradient.colors[0], equals(ThemeConstants.saffron.withValues(alpha: 0.1)));
      expect(gradient.colors[1], equals(ThemeConstants.white));
      expect(gradient.colors[2], equals(ThemeConstants.green.withValues(alpha: 0.1)));
    });

    testWidgets('should display loading indicator when signing in',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Note: This test would need a mock AuthService to properly test loading state
      // For now, we just verify the button exists and can be tapped
      final googleButton = find.text('Continue with Google');
      expect(googleButton, findsOneWidget);
    });
  });
}
