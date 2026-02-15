# Vani-Sahayak Project Structure

This document describes the organization of the Vani-Sahayak Flutter project.

## Directory Structure

```
vani_sahayak/
├── lib/
│   ├── main.dart                 # App entry point with Riverpod and theme setup
│   ├── models/                   # Data models (Task 2)
│   │   ├── form_structure.dart
│   │   ├── form_field.dart
│   │   ├── session.dart
│   │   ├── user.dart
│   │   └── audio_data.dart
│   ├── services/                 # Business logic and API clients
│   │   ├── auth_service.dart     # Firebase Auth wrapper (Task 3)
│   │   ├── session_service.dart  # Session management (Task 4)
│   │   ├── bhashini_service.dart # Voice interface API (Task 6)
│   │   ├── gemini_vision_service.dart  # Form scanning (Task 7)
│   │   ├── gemini_conversation_service.dart  # Conversation engine (Task 9)
│   │   ├── lambda_service.dart   # PDF generation (Task 12)
│   │   └── sync_service.dart     # Offline sync (Task 10)
│   ├── providers/                # Riverpod state providers
│   │   ├── auth_provider.dart    # Auth state (Task 3)
│   │   ├── session_provider.dart # Session state (Task 4)
│   │   ├── language_provider.dart # Language selection (Task 6)
│   │   └── conversation_provider.dart # Conversation state (Task 9)
│   ├── screens/                  # UI screens
│   │   ├── home_screen.dart      # Main screen (Task 16)
│   │   ├── login_screen.dart     # Authentication (Task 3)
│   │   ├── scan_screen.dart      # Form scanning (Task 7)
│   │   ├── conversation_screen.dart # Voice interaction (Task 9)
│   │   ├── review_screen.dart    # Form review (Task 15)
│   │   ├── pdf_view_screen.dart  # PDF preview (Task 13)
│   │   └── history_screen.dart   # Form history (Task 14)
│   ├── widgets/                  # Reusable UI components
│   │   ├── voice_button.dart     # Voice input button (Task 17)
│   │   ├── form_field_card.dart  # Field display card (Task 17)
│   │   ├── language_selector.dart # Language picker (Task 17)
│   │   └── loading_indicator.dart # Progress indicator (Task 17)
│   └── utils/                    # Utilities and constants
│       ├── theme_constants.dart  # Indian Flag color theme ✓
│       ├── firebase_options.dart # Firebase config ✓
│       └── error_handler.dart    # Error handling utilities (Task 18)
├── test/                         # Unit and widget tests
│   └── widget_test.dart          # Basic app test ✓
├── android/                      # Android-specific files
├── ios/                          # iOS-specific files
├── pubspec.yaml                  # Dependencies ✓
├── FIREBASE_SETUP.md             # Firebase setup guide ✓
└── PROJECT_STRUCTURE.md          # This file ✓
```

## Completed Setup (Task 1)

### ✓ Flutter Project Created
- Material 3 configuration enabled
- Organization: com.vanisahayak
- Project name: vani_sahayak

### ✓ Dependencies Configured

**State Management:**
- flutter_riverpod: ^2.6.1
- riverpod_annotation: ^2.6.1

**Firebase:**
- firebase_core: ^3.8.1
- firebase_auth: ^5.3.4
- cloud_firestore: ^5.5.2
- firebase_storage: ^12.3.8

**Camera:**
- camera: ^0.11.0+2

**HTTP:**
- http: ^1.2.2

**Local Storage:**
- hive: ^2.2.3
- hive_flutter: ^1.1.0
- path_provider: ^2.1.5

**Code Generation:**
- build_runner: ^2.4.14
- riverpod_generator: ^2.6.2
- json_serializable: ^6.9.2

### ✓ Theme Configuration

Indian Flag color palette implemented in `lib/utils/theme_constants.dart`:
- Saffron (#FF9933) - AppBar and primary headers
- White (#FFFFFF) - Background and card surfaces
- Green (#128807) - Action buttons and success states
- Navy Blue (#000080) - Icons and text emphasis

### ✓ Project Structure

All required directories created:
- lib/models - Data models
- lib/services - Business logic and API clients
- lib/providers - Riverpod state providers
- lib/screens - UI screens
- lib/widgets - Reusable components
- lib/utils - Utilities and constants

### ✓ Main App Setup

`lib/main.dart` configured with:
- Riverpod ProviderScope wrapper
- Hive initialization for local storage
- Material 3 theme with Indian Flag colors
- Placeholder home screen for testing

### ✓ Firebase Placeholder

Firebase configuration structure created with setup instructions in `FIREBASE_SETUP.md`.
To activate Firebase:
1. Run `flutterfire configure`
2. Uncomment Firebase initialization in `main.dart`

## Requirements Satisfied

Task 1 satisfies the following requirements:

- **7.1**: Material 3 design system implemented
- **7.2**: Saffron color for AppBar and headers
- **7.3**: White color for backgrounds and cards
- **7.4**: Green color for action buttons
- **7.5**: Navy Blue color for icons and text
- **8.1**: Riverpod configured for state management

## Next Steps

The project is now ready for feature implementation:

1. **Task 2**: Implement data models with JSON serialization
2. **Task 3**: Implement authentication module
3. **Task 4**: Implement session management
4. Continue with remaining tasks as per the implementation plan

## Running the App

```bash
# Get dependencies
flutter pub get

# Run analysis
flutter analyze

# Run tests
flutter test

# Run the app (requires a device/emulator)
flutter run
```

## Code Generation

When implementing models with code generation:

```bash
# Generate code for Riverpod and JSON serialization
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes and regenerate automatically
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Notes

- All code follows Flutter best practices
- Material 3 design guidelines are applied throughout
- Indian Flag color palette is consistently used
- The project structure supports modular development
- Each directory corresponds to specific tasks in the implementation plan
