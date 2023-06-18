import 'dart:math';

import 'package:flutter/material.dart';

class EsferaCuatroEstrellas extends StatelessWidget {
  const EsferaCuatroEstrellas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: CustomPaint(
              painter: _EsferaCuatroEstrellas(),
            ),
          ),
        );
      },
    );
  }
}

class _EsferaCuatroEstrellas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double circleRadius = min(size.width, size.height) * 0.12;
    final double starSize = circleRadius * 0.2;

    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xFF3E3E61);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 8;

    final Offset position = Offset(size.width * 0.69, size.height * 0.25);
    canvas.drawCircle(position, circleRadius, paint);

    const double starAngle = 2 * pi / 4;
    final double innerRadius = circleRadius * 0.5;

    for (int i = 0; i < 4; i++) {
      final double x = position.dx + cos(i * starAngle) * innerRadius;
      final double y = position.dy + sin(i * starAngle) * innerRadius;
      final Offset starCenter = Offset(x, y);

      final Path starPath = createStarPath(starCenter, starSize);
      canvas.drawPath(starPath, paint);
    }
  }

  Path createStarPath(Offset center, double size) {
    final double radius = size / 2;
    final double halfRadius = radius / 2;
    const double angle = 2 * pi / 5;

    final Path path = Path();

    for (int i = 0; i < 5; i++) {
      final double x = center.dx + cos(i * angle) * radius;
      final double y = center.dy + sin(i * angle) * radius;
      final Offset point = Offset(x, y);

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }

      final double innerX =
          center.dx + cos((i * angle) + angle / 2) * halfRadius;
      final double innerY =
          center.dy + sin((i * angle) + angle / 2) * halfRadius;
      final Offset innerPoint = Offset(innerX, innerY);

      path.lineTo(innerPoint.dx, innerPoint.dy);
    }

    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CubePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cubeSize = size.width * 0.4;
    final Paint cubePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final Offset center = Offset(size.width / 2, size.height / 2);

    final Path cubePath = Path()
      ..moveTo(center.dx - cubeSize / 2, center.dy - cubeSize / 2)
      ..lineTo(center.dx + cubeSize / 2, center.dy - cubeSize / 2)
      ..lineTo(center.dx + cubeSize / 2, center.dy + cubeSize / 2)
      ..lineTo(center.dx - cubeSize / 2, center.dy + cubeSize / 2)
      ..close();

    canvas.drawPath(cubePath, cubePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
