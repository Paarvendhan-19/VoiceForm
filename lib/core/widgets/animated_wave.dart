import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedWave extends StatefulWidget {
  final double height;
  final double speed;
  final Color color;

  const AnimatedWave({
    super.key,
    this.height = 180,
    this.speed = 1.0,
    this.color = const Color(0xFFFF9933),
  });

  @override
  State<AnimatedWave> createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (3000 / widget.speed).round()),
    )..repeat();
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
          size: Size(double.infinity, widget.height),
          painter: WavePainter(
            animation: _controller.value,
            color: widget.color,
          ),
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final double animation;
  final Color color;

  WavePainter({required this.animation, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.3),
          color.withOpacity(0.1),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight = size.height * 0.2;
    final waveLength = size.width;

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.5);

    for (double i = 0; i <= size.width; i++) {
      final x = i;
      final y = size.height * 0.5 +
          waveHeight *
              math.sin((i / waveLength * 2 * math.pi) + (animation * 2 * math.pi));
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;
}
