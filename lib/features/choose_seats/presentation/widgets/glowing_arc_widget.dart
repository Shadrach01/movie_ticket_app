import 'package:flutter/material.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';

class GlowingArcWidget extends StatelessWidget {
  const GlowingArcWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.appHeight;
    return SizedBox(
      width: double.infinity,
      height: height * .14,
      child: CustomPaint(
        painter: GlowingArcPainter(),
      ),
    );
  }
}

class GlowingArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create a path for the arc
    final Path path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.5, // Control point x
      -size.height * 0.3, // Control point y (negative to curve upward)
      size.width, // End point x
      size.height * 0.5, // End point y
    );

    // Primary sharp arc (bright pink)
    final sharpPaint = Paint()
      ..color = const Color(0xFFF211A0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Draw the main sharp arc
    canvas.drawPath(path, sharpPaint);

    // Add a very subtle glow
    final glowPaint = Paint()
      ..color = const Color(0xFFF211A0).withOpacity(.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    // Draw the subtle glow around the main arc
    canvas.drawPath(path, glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
