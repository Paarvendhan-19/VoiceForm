import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
part 'voice_recording_controller.g.dart';

enum RecordingState {
  idle,
  recording,
  processing,
  completed,
  error,
}

class VoiceRecordingStateData {
  final RecordingState state;
  final String? audioPath;
  final String? transcription;
  final double? sentimentScore;
  final String? errorMessage;

  VoiceRecordingStateData({
    required this.state,
    this.audioPath,
    this.transcription,
    this.sentimentScore,
    this.errorMessage,
  });

  VoiceRecordingStateData copyWith({
    RecordingState? state,
    String? audioPath,
    String? transcription,
    double? sentimentScore,
    String? errorMessage,
  }) {
    return VoiceRecordingStateData(
      state: state ?? this.state,
      audioPath: audioPath ?? this.audioPath,
      transcription: transcription ?? this.transcription,
      sentimentScore: sentimentScore ?? this.sentimentScore,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

@riverpod
class VoiceRecordingController extends _$VoiceRecordingController {
  late final AudioRecorder _audioRecorder;

  @override
  VoiceRecordingStateData build() {
    _audioRecorder = AudioRecorder();
    ref.onDispose(() {
      _audioRecorder.dispose();
    });
    return VoiceRecordingStateData(state: RecordingState.idle);
  }

  Future<void> startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        state = state.copyWith(state: RecordingState.recording);
        
        final tempDir = await getTemporaryDirectory();
        final path = '${tempDir.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
        
        await _audioRecorder.start(
          const RecordConfig(encoder: AudioEncoder.aacLc), 
          path: path
        );
      } else {
        state = state.copyWith(
          state: RecordingState.error,
          errorMessage: 'Microphone permission denied',
        );
      }
    } catch (e) {
      state = state.copyWith(
        state: RecordingState.error,
        errorMessage: 'Failed to start recording: $e',
      );
    }
  }

  Future<void> stopRecording() async {
    state = state.copyWith(state: RecordingState.processing);
    
    try {
      final path = await _audioRecorder.stop();
      
      // Here you would typically upload the file to Firebase Storage
      // and send it to an AI service for transcription and sentiment analysis.
      
      // Simulate processing for now
      await Future.delayed(const Duration(seconds: 2));
      
      state = state.copyWith(
        state: RecordingState.completed,
        audioPath: path,
        transcription: 'Sample transcription of the voice recording (Mocked for now)',
        sentimentScore: 0.85,
      );
    } catch (e) {
      state = state.copyWith(
        state: RecordingState.error,
        errorMessage: 'Failed to stop recording: $e',
      );
    }
  }

  void reset() {
    state = VoiceRecordingStateData(state: RecordingState.idle);
  }
}
