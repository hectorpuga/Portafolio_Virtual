import 'package:flutter/material.dart';
import 'package:portafolio_virtual/provider/changeapp.dart';

import '../../background/figuras.dart';
import '../../widgets/barra_navegacion.dart';

class HomeWeb extends StatelessWidget {
  final ChangeApp changeApp;
  const HomeWeb(this.changeApp, {super.key});

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BarraDeNavegacion(controller: changeApp.controllerSideNav),
          SizedBox(
            width: sized.width * 0.8,
            height: sized.height,
            child: Stack(
              children: [
                Figura(),
                Center(
                  child: SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '''
                        Hello! I ' m
                        Héctor Puga
                        ''',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Contactame"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
