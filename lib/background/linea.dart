import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lineas extends StatelessWidget {
  final Offset position;
  final double strokedWith;
  final double radius;
  const Lineas(
    this.position, {
    this.radius = 1,
    this.strokedWith = 10,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: CustomPaint(
            painter: _LineasPainter(position, strokedWith, radius),
          ),
        );
      },
    );
  }
}

class _LineasPainter extends CustomPainter {
  final Offset position;
  final double strokedWith;
  final double radius;
  const _LineasPainter(this.position, this.strokedWith, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xFF2E2E48);

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = strokedWith;
    double lineLength = min(size.width, size.height) / 2;

    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(radius);

    Offset startPoint = Offset(0, -lineLength / 6);
    Offset endPoint = Offset(0, lineLength / 6);
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(_LineasPainter oldDelegate) => true;
}
