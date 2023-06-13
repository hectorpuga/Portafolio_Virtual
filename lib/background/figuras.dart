import 'dart:math';

import 'package:flutter/material.dart';

class Figura extends StatelessWidget {
  const Figura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: CustomPaint(
              painter: CuboRubik(),
            ),
          ),
        );
      },
    );
  }
}

class _PokeballPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xFF2E2E48);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 8;

    final double circleRadiusGrand = min(size.width, size.height) * 0.10;

    final Offset centerGrand = Offset(size.width / 3, size.height * 0.2);
    canvas.drawCircle(centerGrand, circleRadiusGrand, paint);

// Circulo chico

    final double circleRadius = min(size.width, size.height) * 0.015;

    final Offset center = Offset(size.width / 3, size.height * 0.2);
    canvas.drawCircle(center, circleRadius, paint);

    final double x1 = center.dx - circleRadiusGrand;
    final double y1 = center.dy;
    final double x2 = center.dx - circleRadiusGrand * 0.15;
    final double y2 = center.dy;

    canvas.drawLine(
      Offset(x1, y1),
      Offset(x2, y2),
      paint,
    );

    final double x1L2 = center.dx + circleRadiusGrand;
    final double y1L2 = center.dy;
    final double x2L2 = center.dx + circleRadiusGrand * 0.15;
    final double y2L2 = center.dy;

    canvas.drawLine(
      Offset(x1L2, y1L2),
      Offset(x2L2, y2L2),
      paint,
    );
  }

  @override
  bool shouldRepaint(_PokeballPainter oldDelegate) => true;
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _EsferaCuatroEstrellas()),
    );
  }
}

class _EsferaCuatroEstrellas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double circleRadius = min(size.width, size.height) * 0.1;
    final double starSize = circleRadius * 0.2;

    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xFF2E2E48);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 8;

    final Offset position = Offset(size.width * 0.8, size.height * 0.18);
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

class CuboRubik extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double circleRadiusGrand = min(size.width, size.height);
    final paint = Paint();

    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    final path = Path();

    //Dibujar con el path y el lapiz

    // Linea vertical perpendicular de esquina superior izquierda
    path.moveTo(circleRadiusGrand * 0.14, circleRadiusGrand * 0.2);
    path.lineTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.243);

    // Linea horizontal perpendicular de esquina inferior izquierda
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.215);
    path.moveTo(circleRadiusGrand * 0.14, circleRadiusGrand * 0.2);
    path.lineTo(circleRadiusGrand * 0.35, circleRadiusGrand * 0.177);
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.215);
    path.moveTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.243);
    path.lineTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.42);
    path.moveTo(circleRadiusGrand * 0.14, circleRadiusGrand * 0.2);
    path.lineTo(circleRadiusGrand * 0.14, circleRadiusGrand * 0.36);
    path.lineTo(circleRadiusGrand * 0.287, circleRadiusGrand * 0.417);
    path.moveTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.215);
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.38);
    path.lineTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.417);

    // // Lineas horizontales de la primera cara
    path.moveTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.3);
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.273);
    path.moveTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.36);
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.33);

    // // Lineas verticales de la primera cara
    path.moveTo(circleRadiusGrand * 0.36, circleRadiusGrand * 0.232);
    path.lineTo(circleRadiusGrand * 0.36, circleRadiusGrand * 0.403);
    path.moveTo(circleRadiusGrand * 0.43, circleRadiusGrand * 0.228);
    path.lineTo(circleRadiusGrand * 0.43, circleRadiusGrand * 0.39);

    // // Lineas horizontales de la segunda cara

    path.moveTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.3);
    path.lineTo(circleRadiusGrand * 0.14, circleRadiusGrand * 0.255);
    path.moveTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.36);
    path.lineTo(circleRadiusGrand * 0.14, circleRadiusGrand * 0.311);
    // // Lineas verticales de la segunda cara

    path.moveTo(circleRadiusGrand * 0.19, circleRadiusGrand * 0.216);
    path.lineTo(circleRadiusGrand * 0.19, circleRadiusGrand * 0.38);
    path.moveTo(circleRadiusGrand * 0.24, circleRadiusGrand * 0.226);
    path.lineTo(circleRadiusGrand * 0.24, circleRadiusGrand * 0.4);

    // // Lineas verticales superior de la cara 3

    path.moveTo(circleRadiusGrand * 0.355, circleRadiusGrand * 0.232);
    path.lineTo(circleRadiusGrand * 0.215, circleRadiusGrand * 0.19);
    path.moveTo(circleRadiusGrand * 0.43, circleRadiusGrand * 0.225);
    path.lineTo(circleRadiusGrand * 0.29, circleRadiusGrand * 0.185);

    // // Lineas horizontales superior de la cara 3

    path.moveTo(circleRadiusGrand * 0.19, circleRadiusGrand * 0.216);
    path.lineTo(circleRadiusGrand * 0.41, circleRadiusGrand * 0.194);
    path.moveTo(circleRadiusGrand * 0.24, circleRadiusGrand * 0.228);
    path.lineTo(circleRadiusGrand * 0.449, circleRadiusGrand * 0.205);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CuboRubik oldDelegate) => true;
}
