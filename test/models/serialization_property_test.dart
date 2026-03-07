import 'dart:typed_data';
import 'dart:math';
import 'package:flutter/material.dart' hide FormField;
import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:vani_sahayak/models/models.dart';

/// **Validates: Requirements 1.3, 3.4**
/// 
/// Property: Serialization Round-Trip
/// For any model instance, serializing to JSON then deserializing 
/// produces an equivalent object
void main() {
  final faker = Faker();
  final random = Random();

  group('Property Test: Serialization Round-Trip', () {
    test('Language serialization round-trip property', () {
      for (int i = 0; i < 100; i++) {
        // Generate random Language instance
        final language = _generateRandomLanguage(faker);

        // Serialize to JSON
        final json = language.toJson();

        // Deserialize from JSON
        final deserialized = Language.fromJson(json);

        // Verify equivalence
        expect(deserialized, equals(language),
            reason: 'Language round-trip failed at iteration $i');
      }
    });

    test('User serialization round-trip property', () {
      for (int i = 0; i < 100; i++) {
        // Generate random User instance
        final user = _generateRandomUser(faker, random);

        // Serialize to JSON
        final json = user.toJson();

        // Deserialize from JSON
        final deserialized = User.fromJson(json);

        // Verify equivalence
        expect(deserialized, equals(user),
            reason: 'User round-trip failed at iteration $i');
      }
    });

    test('AudioData serialization round-trip property', () {
      for (int i = 0; i < 100; i++) {
        // Generate random AudioData instance
        final audioData = _generateRandomAudioData(random);

        // Serialize to JSON
        final json = audioData.toJson();

        // Deserialize from JSON
        final deserialized = AudioData.fromJson(json);

        // Verify equivalence
        expect(deserialized, equals(audioData),
            reason: 'AudioData round-trip failed at iteration $i');
      }
    });

    test('ImageData serialization round-trip property', () {
      for (int i = 0; i < 100; i++) {
        // Generate random ImageData instance
        final imageData = _generateRandomImageData(random);

        // Serialize to JSON
        final json = imageData.toJson();

        // Deserialize from JSON
        final deserialized = ImageData.fromJson(json);

        // Verify equivalence
        expect(deserialized, equals(imageData),
            reason: 'ImageData round-trip failed at iteration $i');
      }
    });

    test('FormFieldModel serialization round-trip property', () {
      for (int i = 0; i < 100; i++) {
        // Generate random FormFieldModel instance
        final formField = _generateRandomFormField(faker, random);

        // Serialize to JSON
        final json = formField.toJson();

        // Deserialize from JSON
        final deserialized = FormFieldModel.fromJson(json);

        // Verify equivalence
        expect(deserialized, equals(formField),
            reason: 'FormFieldModel round-trip failed at iteration $i');
      }
    });

    test('FormStructure serialization round-trip property', () {
      for (int i = 0; i < 100; i++) {
        // Generate random FormStructure instance
        final formStructure = _generateRandomFormStructure(faker, random);

        // Serialize to JSON
        final json = formStructure.toJson();

        // Deserialize from JSON
        final deserialized = FormStructure.fromJson(json);

        // Verify equivalence
        expect(deserialized, equals(formStructure),
            reason: 'FormStructure round-trip failed at iteration $i');
      }
    });

    test('Session serialization round-trip property', () {
      for (int i = 0; i < 100; i++) {
        // Generate random Session instance
        final session = _generateRandomSession(faker, random);

        // Serialize to JSON
        final json = session.toJson();

        // Deserialize from JSON
        final deserialized = Session.fromJson(json);

        // Verify equivalence
        expect(deserialized, equals(session),
            reason: 'Session round-trip failed at iteration $i');
      }
    });
  });
}

// ============================================================================
// Random Data Generators
// ============================================================================

Language _generateRandomLanguage(Faker faker) {
  final languages = [
    {'code': 'hi', 'name': 'Hindi', 'native': 'हिन्दी'},
    {'code': 'ta', 'name': 'Tamil', 'native': 'தமிழ்'},
    {'code': 'bn', 'name': 'Bengali', 'native': 'বাংলা'},
    {'code': 'te', 'name': 'Telugu', 'native': 'తెలుగు'},
    {'code': 'mr', 'name': 'Marathi', 'native': 'मराठी'},
    {'code': 'gu', 'name': 'Gujarati', 'native': 'ગુજરાતી'},
    {'code': 'kn', 'name': 'Kannada', 'native': 'ಕನ್ನಡ'},
    {'code': 'ml', 'name': 'Malayalam', 'native': 'മലയാളം'},
    {'code': 'pa', 'name': 'Punjabi', 'native': 'ਪੰਜਾਬੀ'},
    {'code': 'or', 'name': 'Odia', 'native': 'ଓଡ଼ିଆ'},
  ];

  final lang = faker.randomGenerator.element(languages);
  return Language(
    code: lang['code']!,
    name: lang['name']!,
    nativeName: lang['native']!,
  );
}

User _generateRandomUser(Faker faker, Random random) {
  final now = DateTime.now();
  final createdAt = now.subtract(Duration(days: random.nextInt(365)));
  final lastActiveAt = createdAt.add(Duration(days: random.nextInt(365)));

  // Generate 10-digit phone number
  final phoneNumber = random.nextBool() 
      ? '+91${random.nextInt(900000000) + 1000000000}' 
      : null;

  return User(
    userId: faker.guid.guid(),
    email: random.nextBool() ? faker.internet.email() : null,
    phoneNumber: phoneNumber,
    preferredLanguage: faker.randomGenerator.element(['hi', 'ta', 'bn', 'te', 'mr']),
    createdAt: createdAt,
    lastActiveAt: lastActiveAt,
  );
}

AudioData _generateRandomAudioData(Random random) {
  final length = random.nextInt(10000) + 100;
  final bytes = Uint8List.fromList(
    List.generate(length, (_) => random.nextInt(256)),
  );

  return AudioData(
    bytes: bytes,
    sampleRate: random.nextBool() ? 44100 : 16000,
    format: AudioFormat.values[random.nextInt(AudioFormat.values.length)],
  );
}

ImageData _generateRandomImageData(Random random) {
  final length = random.nextInt(5000) + 100;
  final bytes = Uint8List.fromList(
    List.generate(length, (_) => random.nextInt(256)),
  );

  return ImageData(
    bytes: bytes,
    width: random.nextInt(3840) + 640,
    height: random.nextInt(2160) + 480,
  );
}

FormFieldModel _generateRandomFormField(Faker faker, Random random) {
  return FormFieldModel(
    id: faker.guid.guid(),
    label: faker.lorem.words(random.nextInt(3) + 1).join(' '),
    type: FieldType.values[random.nextInt(FieldType.values.length)],
    coordinates: Rect.fromLTWH(
      random.nextDouble() * 500,
      random.nextDouble() * 700,
      random.nextDouble() * 200 + 50,
      random.nextDouble() * 50 + 20,
    ),
    isRequired: random.nextBool(),
    hint: random.nextBool() ? faker.lorem.sentence() : null,
  );
}

FormStructure _generateRandomFormStructure(Faker faker, Random random) {
  final fieldCount = random.nextInt(15) + 1;
  final fields = List.generate(
    fieldCount,
    (_) => _generateRandomFormField(faker, random),
  );

  return FormStructure(
    formId: faker.guid.guid(),
    fields: fields,
    originalImage: _generateRandomImageData(random),
    scannedAt: DateTime.now().subtract(Duration(minutes: random.nextInt(10000))),
  );
}

Session _generateRandomSession(Faker faker, Random random) {
  final formStructure = _generateRandomFormStructure(faker, random);
  final now = DateTime.now();
  final createdAt = now.subtract(Duration(minutes: random.nextInt(1000)));

  // Generate filled data for some fields
  final filledData = <String, dynamic>{};
  for (var field in formStructure.fields) {
    if (random.nextBool()) {
      filledData[field.id] = _generateFieldValue(field.type, faker, random);
    }
  }

  final status = SessionStatus.values[random.nextInt(SessionStatus.values.length)];
  final isCompleted = status == SessionStatus.completed;

  return Session(
    id: faker.guid.guid(),
    userId: faker.guid.guid(),
    form: formStructure,
    filledData: filledData,
    status: status,
    createdAt: createdAt,
    completedAt: isCompleted ? createdAt.add(Duration(minutes: random.nextInt(60))) : null,
    pdfUrl: isCompleted && random.nextBool() ? faker.internet.httpsUrl() : null,
  );
}

dynamic _generateFieldValue(FieldType type, Faker faker, Random random) {
  switch (type) {
    case FieldType.text:
      return faker.lorem.words(random.nextInt(5) + 1).join(' ');
    case FieldType.number:
      return random.nextInt(10000).toString();
    case FieldType.date:
      return faker.date.dateTime().toIso8601String();
    case FieldType.email:
      return faker.internet.email();
    case FieldType.phone:
      return '+91${random.nextInt(900000000) + 1000000000}';
    case FieldType.checkbox:
      return random.nextBool().toString();
    case FieldType.signature:
      return 'signature_${faker.guid.guid()}';
  }
}
