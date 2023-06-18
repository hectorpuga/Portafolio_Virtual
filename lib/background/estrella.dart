import 'dart:math' as math;
import 'package:flutter/material.dart';

class Estrella extends StatelessWidget {
  final double x;
  final double y;
  const Estrella(this.x, this.y, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: CustomPaint(
              painter: _Estrella(x, y),
            ),
          ),
        );
      },
    );
  }
}

class _Estrella extends CustomPainter {
  double x;
  double y;
  _Estrella(this.x, this.y);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    paint.color = const Color(0xFF3E3E61);

    final double radius = size.width / 60;
    final double innerRadius = radius / 2.5;
    const int numPoints = 5;

    const double startAngle = math.pi * 2.3;

    final Path path = Path();
    path.moveTo(
        x + radius * math.cos(startAngle), y + radius * math.sin(startAngle));

    for (int i = 1; i <= numPoints * 2.5; i++) {
      final double currentAngle = startAngle + i * math.pi / numPoints;
      final double currentRadius = i % 2 == 0 ? radius : innerRadius;
      final double x = this.x + currentRadius * math.cos(currentAngle);
      final double y = this.y + currentRadius * math.sin(currentAngle);
      path.lineTo(x, y);
    }
// path.lineTo(size.width * -0.2, size.height * 0.14);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
