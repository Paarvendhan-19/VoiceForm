import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vani_sahayak/main.dart';

void main() {
  testWidgets('App launches and displays placeholder home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const ProviderScope(child: VaniSahayakApp()));

    // Verify that the app title is displayed
    expect(find.text('Vani-Sahayak'), findsWidgets);

    // Verify that the placeholder content is displayed
    expect(find.text('Multilingual AI-powered form filling assistant'), findsOneWidget);
    expect(find.text('Setup Complete'), findsOneWidget);

    // Verify that the mic icon is displayed
    expect(find.byIcon(Icons.mic), findsOneWidget);
  });
}
