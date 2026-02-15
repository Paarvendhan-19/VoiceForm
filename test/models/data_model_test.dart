import 'dart:typed_data';
import 'package:flutter/material.dart' hide FormField;
import 'package:flutter_test/flutter_test.dart';
import 'package:vani_sahayak/models/models.dart';

void main() {
  group('Data Model JSON Serialization Tests', () {
    test('Language model serialization', () {
      final language = Language(
        code: 'hi',
        name: 'Hindi',
        nativeName: 'हनद',
      );

      final json = language.toJson();
      final deserialized = Language.fromJson(json);

      expect(deserialized, equals(language));
      expect(deserialized.code, equals('hi'));
      expect(deserialized.name, equals('Hindi'));
      expect(deserialized.nativeName, equals('हनद'));
    });

    test('User model serialization', () {
      final now = DateTime.now();
      final user = User(
        userId: 'user123',
        email: 'test@example.com',
        phoneNumber: '+919876543210',
        preferredLanguage: 'hi',
        createdAt: now,
        lastActiveAt: now,
      );

      final json = user.toJson();
      final deserialized = User.fromJson(json);

      expect(deserialized, equals(user));
      expect(deserialized.userId, equals('user123'));
      expect(deserialized.email, equals('test@example.com'));
      expect(deserialized.phoneNumber, equals('+919876543210'));
      expect(deserialized.preferredLanguage, equals('hi'));
    });

    test('AudioData model serialization', () {
      final audioBytes = Uint8List.fromList([1, 2, 3, 4, 5]);
      final audioData = AudioData(
        bytes: audioBytes,
        sampleRate: 44100,
        format: AudioFormat.wav,
      );

      final json = audioData.toJson();
      final deserialized = AudioData.fromJson(json);

      expect(deserialized, equals(audioData));
      expect(deserialized.sampleRate, equals(44100));
      expect(deserialized.format, equals(AudioFormat.wav));
      expect(deserialized.bytes.length, equals(5));
    });

    test('ImageData model serialization', () {
      final imageBytes = Uint8List.fromList([10, 20, 30, 40, 50]);
      final imageData = ImageData(
        bytes: imageBytes,
        width: 1920,
        height: 1080,
      );

      final json = imageData.toJson();
      final deserialized = ImageData.fromJson(json);

      expect(deserialized, equals(imageData));
      expect(deserialized.width, equals(1920));
      expect(deserialized.height, equals(1080));
      expect(deserialized.bytes.length, equals(5));
    });

    test('FormFieldModel serialization', () {
      final formField = FormFieldModel(
        id: 'field1',
        label: 'Name',
        type: FieldType.text,
        coordinates: const Rect.fromLTWH(10, 20, 100, 30),
        isRequired: true,
        hint: 'Enter your full name',
      );

      final json = formField.toJson();
      final deserialized = FormFieldModel.fromJson(json);

      expect(deserialized, equals(formField));
      expect(deserialized.id, equals('field1'));
      expect(deserialized.label, equals('Name'));
      expect(deserialized.type, equals(FieldType.text));
      expect(deserialized.isRequired, equals(true));
      expect(deserialized.hint, equals('Enter your full name'));
      expect(deserialized.coordinates.left, equals(10));
      expect(deserialized.coordinates.top, equals(20));
      expect(deserialized.coordinates.width, equals(100));
      expect(deserialized.coordinates.height, equals(30));
    });

    test('FormStructure model serialization', () {
      final imageBytes = Uint8List.fromList([1, 2, 3]);
      final now = DateTime.now();

      final formStructure = FormStructure(
        formId: 'form123',
        fields: [
          FormFieldModel(
            id: 'field1',
            label: 'Name',
            type: FieldType.text,
            coordinates: const Rect.fromLTWH(10, 20, 100, 30),
            isRequired: true,
          ),
          FormFieldModel(
            id: 'field2',
            label: 'Age',
            type: FieldType.number,
            coordinates: const Rect.fromLTWH(10, 60, 50, 30),
            isRequired: false,
          ),
        ],
        originalImage: ImageData(
          bytes: imageBytes,
          width: 800,
          height: 600,
        ),
        scannedAt: now,
      );

      final json = formStructure.toJson();
      final deserialized = FormStructure.fromJson(json);

      expect(deserialized, equals(formStructure));
      expect(deserialized.formId, equals('form123'));
      expect(deserialized.fields.length, equals(2));
      expect(deserialized.fields[0].label, equals('Name'));
      expect(deserialized.fields[1].label, equals('Age'));
      expect(deserialized.originalImage.width, equals(800));
    });

    test('Session model serialization', () {
      final imageBytes = Uint8List.fromList([1, 2, 3]);
      final now = DateTime.now();

      final session = Session(
        id: 'session123',
        userId: 'user123',
        form: FormStructure(
          formId: 'form123',
          fields: [
            FormFieldModel(
              id: 'field1',
              label: 'Name',
              type: FieldType.text,
              coordinates: const Rect.fromLTWH(10, 20, 100, 30),
              isRequired: true,
            ),
          ],
          originalImage: ImageData(
            bytes: imageBytes,
            width: 800,
            height: 600,
          ),
          scannedAt: now,
        ),
        filledData: {'field1': 'John Doe'},
        status: SessionStatus.filling,
        createdAt: now,
        completedAt: null,
        pdfUrl: null,
      );

      final json = session.toJson();
      final deserialized = Session.fromJson(json);

      expect(deserialized, equals(session));
      expect(deserialized.id, equals('session123'));
      expect(deserialized.userId, equals('user123'));
      expect(deserialized.status, equals(SessionStatus.filling));
      expect(deserialized.filledData['field1'], equals('John Doe'));
      expect(deserialized.completedAt, isNull);
      expect(deserialized.pdfUrl, isNull);
    });

    test('Session copyWith method', () {
      final imageBytes = Uint8List.fromList([1, 2, 3]);
      final now = DateTime.now();

      final session = Session(
        id: 'session123',
        userId: 'user123',
        form: FormStructure(
          formId: 'form123',
          fields: [],
          originalImage: ImageData(
            bytes: imageBytes,
            width: 800,
            height: 600,
          ),
          scannedAt: now,
        ),
        filledData: {},
        status: SessionStatus.filling,
        createdAt: now,
      );

      final updatedSession = session.copyWith(
        status: SessionStatus.completed,
        pdfUrl: 'https://example.com/pdf.pdf',
      );

      expect(updatedSession.id, equals(session.id));
      expect(updatedSession.status, equals(SessionStatus.completed));
      expect(updatedSession.pdfUrl, equals('https://example.com/pdf.pdf'));
    });

    test('User copyWith method', () {
      final now = DateTime.now();
      final user = User(
        userId: 'user123',
        email: 'test@example.com',
        preferredLanguage: 'hi',
        createdAt: now,
        lastActiveAt: now,
      );

      final updatedUser = user.copyWith(
        preferredLanguage: 'ta',
        phoneNumber: '+919876543210',
      );

      expect(updatedUser.userId, equals(user.userId));
      expect(updatedUser.preferredLanguage, equals('ta'));
      expect(updatedUser.phoneNumber, equals('+919876543210'));
    });
  });
}
