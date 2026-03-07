import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_button.dart';
import 'dart:math' as math;

class VoiceRecordingScreen extends ConsumerStatefulWidget {
  final String sessionId;

  const VoiceRecordingScreen({super.key, required this.sessionId});

  @override
  ConsumerState<VoiceRecordingScreen> createState() => _VoiceRecordingScreenState();
}

class _VoiceRecordingScreenState extends ConsumerState<VoiceRecordingScreen>
    with TickerProviderStateMixin {
  bool _isRecording = false;
  bool _isProcessing = false;
  int _currentQuestion = 1;
  final int _totalQuestions = 5;
  late AnimationController _pulseController;
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
      if (!_isRecording) {
        _processRecording();
      }
    });
  }

  Future<void> _processRecording() async {
    setState(() => _isProcessing = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isProcessing = false;
        if (_currentQuestion < _totalQuestions) {
          _currentQuestion++;
        } else {
          context.push('/review/${widget.sessionId}');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question $_currentQuestion of $_totalQuestions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => context.go('/home'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.saffron.withOpacity(0.05),
              AppTheme.green.withOpacity(0.05),
            ],
          ),
        ),
        child: Column(
          children: [
            // Progress Bar
            Padding(
              padding: const EdgeInsets.all(24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _currentQuestion / _totalQuestions,
                  minHeight: 8,
                  backgroundColor: AppTheme.navyBlue.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.saffron),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Question Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.help_outline_rounded,
                              size: 40,
                              color: AppTheme.saffron,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'What is your overall satisfaction with our product?',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.navyBlue,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Recording Button
                    _buildRecordingButton(),
                    const SizedBox(height: 24),
                    if (_isRecording)
                      const Text(
                        'Listening...',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.saffron,
                        ),
                      )
                    else if (_isProcessing)
                      const Text(
                        'Processing your response...',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.green,
                        ),
                      )
                    else
                      const Text(
                        'Tap to start recording',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.navyBlue,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Bottom Actions
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _currentQuestion > 1
                          ? () => setState(() => _currentQuestion--)
                          : null,
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text('Previous'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(
                          color: AppTheme.navyBlue.withOpacity(0.2),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GradientButton(
                      text: 'Skip',
                      onPressed: () {
                        if (_currentQuestion < _totalQuestions) {
                          setState(() => _currentQuestion++);
                        } else {
                          context.push('/review/${widget.sessionId}');
                        }
                      },
                      icon: Icons.arrow_forward_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordingButton() {
    return GestureDetector(
      onTap: _isProcessing ? null : _toggleRecording,
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              if (_isRecording) ...[
                // Outer pulse ring
                Container(
                  width: 180 + (_pulseController.value * 40),
                  height: 180 + (_pulseController.value * 40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.saffron.withOpacity(0.3 * (1 - _pulseController.value)),
                        AppTheme.saffron.withOpacity(0),
                      ],
                    ),
                  ),
                ),
                // Middle pulse ring
                Container(
                  width: 160 + (_pulseController.value * 30),
                  height: 160 + (_pulseController.value * 30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.saffron.withOpacity(0.4 * (1 - _pulseController.value)),
                        AppTheme.saffron.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ],
              // Main button
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  gradient: _isRecording
                      ? AppTheme.primaryGradient
                      : _isProcessing
                          ? AppTheme.secondaryGradient
                          : AppTheme.accentGradient,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (_isRecording ? AppTheme.saffron : AppTheme.green)
                          .withOpacity(0.4),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Icon(
                  _isRecording
                      ? Icons.stop_rounded
                      : _isProcessing
                          ? Icons.hourglass_empty_rounded
                          : Icons.mic_rounded,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
