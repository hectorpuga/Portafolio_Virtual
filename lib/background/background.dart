import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/responsive.dart';
import 'background_import.dart';

class Background extends StatelessWidget {
  final Widget body;
  const Background({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    double auxX = 0.2;
    double auxY = 0.1;
    double tama = min(sized.height, sized.width);
    return Stack(
      children: [
        CuboRubick(sized.width * 0.22, sized.width * 0.62),
        CuboRubick(sized.width * 0.73, sized.height * 0.23),
        Estrella(sized.width * 0.09, sized.height / 1.15),
        Estrella(sized.width * 0.5, sized.height / 3.3),
        Triangulo(
            Offset(
              sized.width * 0.2,
              sized.height * 0.85,
            ),
            sized.width * 0.05),
        Triangulo(
          Offset(
            tama * 0.6,
            tama * 0.87,
          ),
          Responsive.of(context).dp(8),
          fill: false,
          giro: 2.84,
          strokewith: 14,
        ),
        Triangulo(
          Offset(
            sized.width * 0.27,
            sized.height * 0.18,
          ),
          Responsive.of(context).wp(4),
          fill: false,
          giro: 2.8,
          strokewith: 8,
        ),
        Triangulo(
          Offset(
            sized.width * 0.87,
            sized.height * 0.28,
          ),
          sized.width * 0.16,
          giro: 0.499,
          strokewith: 8,
        ),
        Triangulo(
          Offset(
            sized.width * 0.5,
            sized.height * -0.04,
          ),
          sized.width * 0.042,
          giro: 0.04997,
          fill: false,
          strokewith: 5,
        ),
        Circulos(
          posicion: Offset(sized.width * 0.85, sized.height * 0.13),
          sizeCirculoGrand: tama * 0.06,
          sizeCirculoSmall: tama * 0.04,
        ),
        Circulos(
          posicion: Offset(sized.width * 0.7, sized.height * 0.58),
          sizeCirculoGrand: tama * 0.12,
          sizeCirculoSmall: tama * 0.1,
        ),
        Circulos(
          posicion: Offset(sized.width * 0.9, sized.height * 0.95),
          sizeCirculoGrand: tama * 0.08,
          fill: true,
          circulos: false,
        ),
        const PokeBall(),
        const EsferaCuatroEstrellas(),
        body,
        Triangulo(
            Offset(
              sized.width * 0.805,
              sized.height * 0.565,
            ),
            sized.width * 0.07),
        Triangulo(
          Offset(
            tama * 1.1,
            tama * 0.67,
          ),
          tama * 0.22,
          giro: 2.1,
          fill: false,
        ),
        Circulos(
          posicion: Offset(tama * 0.86, tama * 0.83),
          sizeCirculoGrand: tama * 0.07,
          fillColor: Colors.white,
          sizeCirculoSmall: tama * 0.06,
          fill: true,
        ),
        Triangulo(
            fill: false,
            Offset(
              sized.width * 0.59,
              sized.height * 0.42,
            ),
            giro: 2.9,
            strokewith: 7,
            sized.width * 0.035),
        Circulos(
          posicion: Offset(sized.width * 0.56, sized.height * 0.95),
          sizeCirculoGrand: tama * 0.018,
          circulos: false,
        ),
        for (int j = 0; j < 3; j++)
          for (int i = 0; i < 3; i++)
            Circulos(
              posicion: Offset(
                  sized.width * (i == 0 ? auxX = 0.105 : auxX += 0.02),
                  sized.height * (i != 0 ? auxY : (auxY += 0.038))),
              sizeCirculoGrand: tama * 0.012,
              circulos: false,
              fill: true,
            ),
        Circulos(
          posicion: Offset(sized.width * 0.73, sized.height * 0.82),
          sizeCirculoGrand: tama * 0.018,
          circulos: false,
          fill: true,
        ),
        // Lineas()
      ],
    );
  }
}
