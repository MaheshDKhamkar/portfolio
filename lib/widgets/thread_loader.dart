import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Custom animated loader with thread-like animation
class ThreadLoader extends StatefulWidget {
  final double size;
  final Color? color;

  const ThreadLoader({super.key, this.size = 60, this.color});

  @override
  State<ThreadLoader> createState() => _ThreadLoaderState();
}

class _ThreadLoaderState extends State<ThreadLoader>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat();

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loaderColor = widget.color ?? Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer rotating circle
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller1.value * 2 * math.pi,
                child: CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: ThreadPainter(
                    color: loaderColor.withOpacity(0.3),
                    progress: _controller1.value,
                    strokeWidth: 3,
                  ),
                ),
              );
            },
          ),
          // Middle rotating circle (opposite direction)
          AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Transform.rotate(
                angle: -_controller2.value * 2 * math.pi,
                child: CustomPaint(
                  size: Size(widget.size * 0.7, widget.size * 0.7),
                  painter: ThreadPainter(
                    color: loaderColor.withOpacity(0.5),
                    progress: _controller2.value,
                    strokeWidth: 3.5,
                  ),
                ),
              );
            },
          ),
          // Inner pulsing circle
          AnimatedBuilder(
            animation: _controller3,
            builder: (context, child) {
              final scale = 0.3 + (_controller3.value * 0.2);
              return Transform.scale(
                scale: scale,
                child: Container(
                  width: widget.size * 0.4,
                  height: widget.size * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: loaderColor.withOpacity(0.7),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Custom painter for thread-like arcs
class ThreadPainter extends CustomPainter {
  final Color color;
  final double progress;
  final double strokeWidth;

  ThreadPainter({
    required this.color,
    required this.progress,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw multiple arcs to create thread effect
    for (int i = 0; i < 3; i++) {
      final startAngle = (progress * 2 * math.pi) + (i * math.pi / 1.5);
      final sweepAngle = math.pi / 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - (i * 2)),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ThreadPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
