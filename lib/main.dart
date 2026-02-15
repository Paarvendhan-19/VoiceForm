import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'utils/theme_constants.dart';

/// Main entry point for Vani-Sahayak application
/// 
/// Initializes:
/// - Hive for local storage (Requirements 8.4, 8.5)
/// - Riverpod for state management (Requirement 8.1)
/// - Material 3 theme with Indian Flag colors (Requirements 7.1-7.5)
/// 
/// Note: Firebase initialization is commented out until Firebase is configured.
/// Uncomment the Firebase initialization code after running `flutterfire configure`.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  await Hive.initFlutter();

  // TODO: Uncomment after running `flutterfire configure`
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    // Wrap app with ProviderScope for Riverpod state management
    const ProviderScope(
      child: VaniSahayakApp(),
    ),
  );
}

class VaniSahayakApp extends StatelessWidget {
  const VaniSahayakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vani-Sahayak',
      theme: ThemeConstants.lightTheme,
      home: const PlaceholderHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Placeholder home screen for initial setup
/// Will be replaced with actual HomeScreen in later tasks
class PlaceholderHomeScreen extends StatelessWidget {
  const PlaceholderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vani-Sahayak'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mic,
              size: 80,
              color: ThemeConstants.green,
            ),
            const SizedBox(height: 24),
            Text(
              'Vani-Sahayak',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ThemeConstants.navyBlue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Multilingual AI-powered form filling assistant',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ThemeConstants.navyBlue.withValues(alpha: 0.7),
                    ),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Project setup complete! Ready for feature implementation.'),
                  ),
                );
              },
              icon: const Icon(Icons.check_circle),
              label: const Text('Setup Complete'),
            ),
          ],
        ),
      ),
    );
  }
}
