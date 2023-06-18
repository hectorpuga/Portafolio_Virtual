import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Circulos extends StatelessWidget {
  final Offset posicion;
  final double sizeCirculoSmall;
  final double sizeCirculoGrand;
  final bool fill;
  final Color fillColor;

  final bool circulos;

  const Circulos(
      {key,
      this.sizeCirculoSmall = 100,
      this.sizeCirculoGrand = 200,
      this.circulos = true,
      this.fill = false,
      required this.posicion,
      this.fillColor = const Color(0xFF2E2E48)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: CustomPaint(
            painter: _CirculosPainter(sizeCirculoSmall, circulos,
                sizeCirculoGrand, fill, posicion, fillColor),
          ),
        );
      },
    );
  }
}

class _CirculosPainter extends CustomPainter {
  final double sizeCirculoSmall;
  final double sizeCirculoGrand;
  final bool fill;
  final Offset posicion;
  final bool circulos;
  final Color fillColor;

  _CirculosPainter(this.sizeCirculoSmall, this.circulos, this.sizeCirculoGrand,
      this.fill, this.posicion, this.fillColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xFF2E2E48);

    paint.style = fill ? PaintingStyle.fill : PaintingStyle.stroke;

    paint.strokeWidth = 7;

    canvas.drawCircle(posicion, sizeCirculoGrand, paint);

// Circulo chico
    if (circulos) {
      final paint2 = Paint();

      paint2.color = fillColor;

      paint2.style = fill ? PaintingStyle.fill : PaintingStyle.stroke;

      paint2.strokeWidth = 7;
      canvas.drawCircle(posicion, sizeCirculoSmall, paint2);
    }
  }

  @override
  bool shouldRepaint(_CirculosPainter oldDelegate) => true;
}
