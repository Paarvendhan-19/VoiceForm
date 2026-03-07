import 'dart:io';
// import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class VoiceService {
  // final AudioRecorder _recorder = AudioRecorder();
  String? _currentRecordingPath;

  Future<bool> hasPermission() async {
    // return await _recorder.hasPermission();
    return true; // Mock for now
  }

  Future<void> startRecording() async {
    if (await hasPermission()) {
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      _currentRecordingPath = '${directory.path}/recording_$timestamp.m4a';

      // await _recorder.start(
      //   const RecordConfig(
      //     encoder: AudioEncoder.aacLc,
      //     bitRate: 128000,
      //     sampleRate: 44100,
      //   ),
      //   path: _currentRecordingPath!,
      // );
    }
  }

  Future<String?> stopRecording() async {
    // final path = await _recorder.stop();
    // return path;
    return _currentRecordingPath; // Mock for now
  }

  Future<void> pauseRecording() async {
    // await _recorder.pause();
  }

  Future<void> resumeRecording() async {
    // await _recorder.resume();
  }

  Future<bool> isRecording() async {
    // return await _recorder.isRecording();
    return false; // Mock for now
  }

  void dispose() {
    // _recorder.dispose();
  }
}
