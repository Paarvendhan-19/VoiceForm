import 'package:flutter/material.dart';
import 'dart:math' as math;

class VoiceWaveAnimation extends StatefulWidget {
  final bool isActive;
  final Color color;

  const VoiceWaveAnimation({
    super.key,
    required this.isActive,
    this.color = const Color(0xFFFF9933),
  });

  @override
  State<VoiceWaveAnimation> createState() => _VoiceWaveAnimationState();
}

class _VoiceWaveAnimationState extends State<VoiceWaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    if (widget.isActive) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(VoiceWaveAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.isActive && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(200, 80),
          painter: WaveformPainter(
            animation: _controller.value,
            color: widget.color,
            isActive: widget.isActive,
          ),
        );
      },
    );
  }
}

class WaveformPainter extends CustomPainter {
  final double animation;
  final Color color;
  final bool isActive;

  WaveformPainter({
    required this.animation,
    required this.color,
    required this.isActive,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final barCount = 30;
    final barWidth = size.width / barCount;

    for (int i = 0; i < barCount; i++) {
      final x = i * barWidth + barWidth / 2;
      final normalizedIndex = i / barCount;
      final phase = (animation + normalizedIndex) % 1.0;
      
      final height = isActive
          ? size.height * 0.2 +
              size.height * 0.6 * math.sin(phase * 2 * math.pi)
          : size.height * 0.1;

      final y1 = size.height / 2 - height / 2;
      final y2 = size.height / 2 + height / 2;

      canvas.drawLine(Offset(x, y1), Offset(x, y2), paint);
    }
  }

  @override
  bool shouldRepaint(WaveformPainter oldDelegate) => true;
}
