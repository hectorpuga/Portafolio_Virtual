import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portafolio_virtual/utils/responsive.dart';

class TrianguloDos extends StatelessWidget {
  const TrianguloDos({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: CustomPaint(
            painter: TrianglePainter(context),
          ),
        );
      },
    );
  }
}

class TrianglePainter extends CustomPainter {
  final BuildContext context;
  TrianglePainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.stroke;

    final path = Path();

    paint.color = const Color(0xFF3E3E61);
    paint.strokeWidth = 5;

    path.moveTo(
        Responsive.of(context).wp(50.4), Responsive.of(context).hm(68)!);
    path.lineTo(Responsive.of(context).wp(61), Responsive.of(context).hm(76)!);
    path.lineTo(Responsive.of(context).wp(53), Responsive.of(context).hm(82)!);
    path.lineTo(
        Responsive.of(context).wp(50.5), Responsive.of(context).hm(68)!);

    canvas.drawPath(path, paint);

    canvas.drawCircle(
        Offset(Responsive.of(context).wp(50.5), Responsive.of(context).hm(77)!),
        Responsive.of(context).dp(2),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
