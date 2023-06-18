import 'dart:math';

import 'package:flutter/material.dart';

class Triangulo extends StatelessWidget {
  final double triangleSize;
  final Offset trianglePosition;
  final bool fill;
  final double strokewith;
  final double giro;

  const Triangulo(this.trianglePosition, this.triangleSize,
      {this.giro = 2, this.strokewith = 5, this.fill = true, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: CustomPaint(
            painter: TrianglePainter(
                fill, strokewith, triangleSize, trianglePosition, giro),
          ),
        );
      },
    );
  }
}

class TrianglePainter extends CustomPainter {
  final double triangleSize;
  final Offset trianglePosition;
  final bool fill;
  final double strokewith;
  final double giro;

  TrianglePainter(this.fill, this.strokewith, this.triangleSize,
      this.trianglePosition, this.giro);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = fill ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = strokewith;

    paint.color = const Color(0xFF3E3E61);

    final Path path = Path();
    path.moveTo(trianglePosition.dx + triangleSize / 2, trianglePosition.dy);
    path.lineTo(
        trianglePosition.dx + triangleSize, trianglePosition.dy + triangleSize);
    path.lineTo(trianglePosition.dx, trianglePosition.dy + triangleSize);
    path.close();

    canvas.save();
    canvas.translate(trianglePosition.dx, trianglePosition.dy);
    canvas.rotate(pi / giro); // Rotación de 45 grados (pi/4 radianes)
    canvas.translate(-trianglePosition.dx, -trianglePosition.dy);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
