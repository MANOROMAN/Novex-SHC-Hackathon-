import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final List<Color> colors;
  final Widget child;

  const AnimatedGradientBackground({
    required this.colors,
    required this.child,
    super.key,
  }) : assert(colors.length >= 2, 'At least two colors required.');

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState
    extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
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
        final colors = List<Color>.from(widget.colors);
        final shift = (_controller.value * (colors.length - 1)).round();
        final rotated = [
          ...colors.sublist(shift),
          ...colors.sublist(0, shift),
        ];

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: rotated,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class BubbleBackground extends StatelessWidget {
  final Widget child;
  final int bubbleCount;
  final Color bubbleColor;

  const BubbleBackground({
    required this.child,
    this.bubbleCount = 10,
    this.bubbleColor = Colors.white24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BubblePainter(
        bubbleCount: bubbleCount,
        color: bubbleColor,
      ),
      child: child,
    );
  }
}

class _BubblePainter extends CustomPainter {
  final int bubbleCount;
  final Color color;
  final Random _random = Random();

  _BubblePainter({
    required this.bubbleCount,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    for (var i = 0; i < bubbleCount; i++) {
      final radius = _random.nextDouble() * 60 + 20;
      final dx = _random.nextDouble() * size.width;
      final dy = _random.nextDouble() * size.height;
      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


