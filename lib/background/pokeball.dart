import 'dart:math';

import 'package:flutter/cupertino.dart';

class PokeBall extends StatelessWidget {
  const PokeBall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: CustomPaint(
              painter: _PokeballPainter(),
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

    final double circleRadiusGrand = min(size.width, size.height) * 0.08;

    final Offset centerGrand = Offset(size.width / 2.4, size.height * 0.13);
    canvas.drawCircle(centerGrand, circleRadiusGrand, paint);

// Circulo chico

    final double circleRadius = min(size.width, size.height) * 0.015;

    final Offset center = Offset(size.width / 2.4, size.height * 0.13);
    canvas.drawCircle(center, circleRadius, paint);

    double x1 = center.dx - circleRadiusGrand;
    double y1 = center.dy;
    double x2 = center.dx - circleRadiusGrand * 0.15;
    double y2 = center.dy;

    canvas.drawLine(
      Offset(x1, y1),
      Offset(x2, y2),
      paint,
    );

    x1 = center.dx + circleRadiusGrand;
    y1 = center.dy;
    x2 = center.dx + circleRadiusGrand * 0.15;
    y2 = center.dy;

    canvas.drawLine(
      Offset(x1, y1),
      Offset(x2, y2),
      paint,
    );
  }

  @override
  bool shouldRepaint(_PokeballPainter oldDelegate) => true;
}
