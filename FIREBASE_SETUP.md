# Firebase Setup Instructions for Vani-Sahayak

This document provides step-by-step instructions to configure Firebase for the Vani-Sahayak application.

## Prerequisites

- Flutter SDK installed
- Firebase CLI installed (`npm install -g firebase-tools`)
- FlutterFire CLI installed (`dart pub global activate flutterfire_cli`)
- A Google account

## Setup Steps

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Add project"
3. Enter project name: `vani-sahayak`
4. Follow the setup wizard (you can disable Google Analytics for development)

### 2. Configure Firebase for Flutter

Run the FlutterFire configuration command:

```bash
flutterfire configure
```

This will:
- Prompt you to select your Firebase project
- Generate `lib/firebase_options.dart` with your project configuration
- Create/update Firebase configuration files for Android and iOS

### 3. Enable Firebase Services

In the Firebase Console, enable the following services:

#### Authentication
1. Go to Authentication → Sign-in method
2. Enable "Google" sign-in provider
3. Enable "Phone" sign-in provider

#### Firestore Database
1. Go to Firestore Database
2. Click "Create database"
3. Start in **test mode** for development (update security rules later)
4. Choose a location close to your users (e.g., asia-south1 for India)

#### Firebase Storage
1. Go to Storage
2. Click "Get started"
3. Start in **test mode** for development (update security rules later)

### 4. Update Security Rules (Production)

Before deploying to production, update your security rules:

#### Firestore Rules
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Sessions belong to users
    match /sessions/{sessionId} {
      allow read, write: if request.auth != null && 
        resource.data.userId == request.auth.uid;
    }
  }
}
```

#### Storage Rules
```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    // Users can only access their own files
    match /users/{userId}/{allPaths=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Filled forms are accessible by their owners
    match /filled-forms/{sessionId}.pdf {
      allow read: if request.auth != null;
      allow write: if false; // Only Lambda can write
    }
  }
}
```

### 5. Update main.dart

After running `flutterfire configure`, uncomment the Firebase initialization code in `lib/main.dart`:

```dart
import 'utils/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  
  // Uncomment this:
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const ProviderScope(child: VaniSahayakApp()));
}
```

### 6. Test Firebase Connection

Run the app to verify Firebase is properly configured:

```bash
flutter run
```

Check the console for any Firebase initialization errors.

## Android-Specific Setup

### Update AndroidManifest.xml

Add required permissions in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

### Update build.gradle

Ensure minimum SDK version is 21 or higher in `android/app/build.gradle.kts`:

```kotlin
android {
    defaultConfig {
        minSdk = 21
        targetSdk = 34
    }
}
```

## iOS-Specific Setup

### Update Info.plist

Add required permissions in `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>Camera access is required to scan forms</string>
<key>NSMicrophoneUsageDescription</key>
<string>Microphone access is required for voice input</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Photo library access is required to save filled forms</string>
```

## Troubleshooting

### Common Issues

1. **"Firebase not initialized" error**
   - Ensure `flutterfire configure` was run successfully
   - Check that `firebase_options.dart` exists and is imported

2. **"Google Services file missing" error**
   - Re-run `flutterfire configure`
   - Verify `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) exist

3. **Permission denied errors**
   - Update Firestore and Storage security rules
   - Ensure user is authenticated before accessing Firebase services

## Next Steps

After Firebase is configured:
1. Test authentication flows (Task 3)
2. Test Firestore read/write operations (Task 4)
3. Test Firebase Storage uploads (Task 12)

## Resources

- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com)
- [Firebase Security Rules](https://firebase.google.com/docs/rules)
