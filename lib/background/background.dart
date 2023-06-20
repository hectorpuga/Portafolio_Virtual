import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portafolio_virtual/background/triangulo_circulo.dart';

import '../provider/changeapp.dart';
import '../utils/responsive.dart';
import '../widgets/barra_navegacion.dart';
import 'background_import.dart';

class Background extends StatelessWidget {
  final Widget body;
  final ChangeApp changeApp;

  const Background({super.key, required this.body, required this.changeApp});

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    double auxX = 0.2;
    double auxY = 0.1;
    double tama = min(sized.height, sized.width);
    double tamax = max(sized.height, sized.width);

    return Stack(
      children: [
        CuboRubick(
            Responsive.of(context).dp(21), Responsive.of(context).hm(60)!),
        CuboRubick(
            Responsive.of(context).wp(70), Responsive.of(context).hm(23)!),
        Estrella(Responsive.of(context).wp(5), Responsive.of(context).hm(90)!),
        Estrella(Responsive.of(context).wp(48), Responsive.of(context).hm(30)!),
        Triangulo(
            Offset(
              Responsive.of(context).wp(20),
              Responsive.of(context).hm(80)!,
            ),
            Responsive.of(context).dp(4)),
        Triangulo(
          Offset(
            Responsive.of(context).wp(35),
            Responsive.of(context).hm(85)!,
          ),
          Responsive.of(context).dp(8),
          fill: false,
          giro: 2.84,
          strokewith: 14,
        ),
        Triangulo(
          Offset(
            Responsive.of(context).wp(27),
            Responsive.of(context).hm(18)!,
          ),
          Responsive.of(context).dp(4),
          fill: false,
          giro: 2.8,
          strokewith: 8,
        ),
        TrianguloDos(),
        // Triangulo(
        //   Offset(
        //     Responsive.of(context).wp(80),
        //     Responsive.of(context).hm(28)!,
        //   ),
        //   Responsive.of(context).wp(30),
        //   giro: 0.5,
        //   strokewith: 8,
        // ),
        Triangulo(
          Offset(
            Responsive.of(context).wp(50),
            Responsive.of(context).hm(-4)!,
          ),
          Responsive.of(context).dp(5),
          giro: 0.04997,
          fill: false,
          strokewith: 5,
        ),
        Circulos(
          posicion: Offset(
              Responsive.of(context).wp(80), Responsive.of(context).hm(13)!),
          sizeCirculoGrand: Responsive.of(context).dp(3),
          sizeCirculoSmall: Responsive.of(context).dp(2),
        ),
        Circulos(
          posicion: Offset(
              Responsive.of(context).wp(70), Responsive.of(context).hm(58)!),
          sizeCirculoGrand: Responsive.of(context).dp(6),
          sizeCirculoSmall: Responsive.of(context).dp(5),
        ),
        Circulos(
          posicion: Offset(
              Responsive.of(context).wp(88.7), Responsive.of(context).hm(94)!),
          sizeCirculoGrand: Responsive.of(context).dp(5),
          fill: true,
          circulos: false,
        ),
        const PokeBall(),
        const EsferaCuatroEstrellas(),
        body,
        Triangulo(
            Offset(
                Responsive.of(context).wp(82), Responsive.of(context).hm(56)!),
            Responsive.of(context).dp(7)),
        // Triangulo(
        //   Offset(
        //     Responsive.of(context).wp(59),
        //     Responsive.of(context).hm(68)!,
        //   ),
        //   Responsive.of(context).dp(10),
        //   giro: 2.1,
        //   fill: false,
        // ),

        // Circulos(
        //   posicion: Offset(
        //       Responsive.of(context).wp(46), Responsive.of(context).hm(83)!),
        //   sizeCirculoGrand: Responsive.of(context).dp(3.3),
        //   fillColor: Colors.white,
        //   sizeCirculoSmall: Responsive.of(context).dp(2.9),
        //   fill: true,
        // ),
        Triangulo(
            fill: false,
            Offset(
                Responsive.of(context).wp(56), Responsive.of(context).hm(40)!),
            giro: 2.9,
            strokewith: 7,
            Responsive.of(context).dp(3)),
        Circulos(
          posicion: Offset(
              Responsive.of(context).wp(54), Responsive.of(context).hm(93)!),
          sizeCirculoGrand: Responsive.of(context).dp(1),
          circulos: false,
        ),
        // for (int j = 0; j < 3; j++)
        //   for (int i = 0; i < 3; i++)
        //     Circulos(
        //       posicion: Offset(
        //           sized.width * (i == 0 ? auxX = 0.105 : auxX += 0.02),
        //           sized.height * (i != 0 ? auxY : (auxY += 0.038))),
        //       sizeCirculoGrand: tama * 0.012,
        //       circulos: false,
        //       fill: true,
        //     ),
        // Circulos(
        //   posicion: Offset(sized.width * 0.73, sized.height * 0.82),
        //   sizeCirculoGrand: tama * 0.018,
        //   circulos: false,
        //   fill: true,
        // ),
        // // Lineas()
      ],
    );
  }
}
