import 'package:flutter/material.dart';

class CuboRubick extends StatelessWidget {
  final double left;
  final double top;
  const CuboRubick(this.left, this.top, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;

    return Positioned(
      height: sized.height,
      width: sized.width,
      top: top,
      left: left,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: CustomPaint(
              painter: _CuboRubik(),
            ),
          );
        },
      ),
    );
  }
}

class _CuboRubik extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double circleRadiusGrand = size.width / 4;
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xFF3E3E61);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    final path = Path();

    //Dibujar con el path y el lapiz

    // Linea vertical perpendicular de esquina superior izquierda
    //primera linea
    path.moveTo(circleRadiusGrand * 0.15, circleRadiusGrand * 0.199);
    path.lineTo(circleRadiusGrand * 0.32, circleRadiusGrand * 0.29);

    // // Linea horizontal perpendicular de esquina inferior izquierda
    // segunda linea
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.19);
    path.moveTo(circleRadiusGrand * 0.15, circleRadiusGrand * 0.2);
    //tercera linea
    path.lineTo(circleRadiusGrand * 0.34, circleRadiusGrand * 0.11);
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.19);
    path.moveTo(circleRadiusGrand * 0.32, circleRadiusGrand * 0.285);
    path.lineTo(circleRadiusGrand * 0.32, circleRadiusGrand * 0.48);
    path.moveTo(circleRadiusGrand * 0.15, circleRadiusGrand * 0.195);
    path.lineTo(circleRadiusGrand * 0.15, circleRadiusGrand * 0.39);
    path.lineTo(circleRadiusGrand * 0.324, circleRadiusGrand * 0.48);
    path.moveTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.19);
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.38);
    path.lineTo(circleRadiusGrand * 0.32, circleRadiusGrand * 0.48);

    // // // Lineas horizontales de la primera cara
    path.moveTo(circleRadiusGrand * 0.32, circleRadiusGrand * 0.36);
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.26);
    path.moveTo(circleRadiusGrand * 0.32, circleRadiusGrand * 0.42);
    path.lineTo(circleRadiusGrand * 0.5, circleRadiusGrand * 0.32);

    // // // Lineas verticales de la primera cara
    const lh1px = 0.38;

    path.moveTo(circleRadiusGrand * lh1px, circleRadiusGrand * 0.26);
    path.lineTo(circleRadiusGrand * lh1px, circleRadiusGrand * 0.44);
    path.moveTo(circleRadiusGrand * 0.44, circleRadiusGrand * 0.228);
    path.lineTo(circleRadiusGrand * 0.44, circleRadiusGrand * 0.41);

    // // // Lineas horizontales de la segunda cara

    path.moveTo(circleRadiusGrand * 0.32, circleRadiusGrand * 0.36);
    path.lineTo(circleRadiusGrand * 0.15, circleRadiusGrand * 0.268);
    path.moveTo(circleRadiusGrand * 0.32, circleRadiusGrand * 0.42);
    path.lineTo(circleRadiusGrand * 0.153, circleRadiusGrand * 0.33);
    // // // Lineas verticales de la segunda cara

    path.moveTo(circleRadiusGrand * 0.205, circleRadiusGrand * 0.23);
    path.lineTo(circleRadiusGrand * 0.205, circleRadiusGrand * 0.42);
    path.moveTo(circleRadiusGrand * 0.26, circleRadiusGrand * 0.262);
    path.lineTo(circleRadiusGrand * 0.26, circleRadiusGrand * 0.45);

    // // // Lineas verticales superior de la cara 3

    path.moveTo(circleRadiusGrand * 0.384, circleRadiusGrand * 0.26);
    path.lineTo(circleRadiusGrand * 0.21, circleRadiusGrand * 0.17);
    path.moveTo(circleRadiusGrand * 0.435, circleRadiusGrand * 0.225);
    path.lineTo(circleRadiusGrand * 0.275, circleRadiusGrand * 0.139);

    // // // Lineas horizontales superior de la cara 3

    path.moveTo(circleRadiusGrand * 0.2, circleRadiusGrand * 0.23);
    path.lineTo(circleRadiusGrand * 0.39, circleRadiusGrand * 0.14);
    path.moveTo(circleRadiusGrand * 0.26, circleRadiusGrand * 0.26);
    path.lineTo(circleRadiusGrand * 0.449, circleRadiusGrand * 0.165);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CuboRubik oldDelegate) => true;
}
