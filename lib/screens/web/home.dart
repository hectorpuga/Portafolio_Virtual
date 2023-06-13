import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../background/figuras.dart';
import '../../widgets/barra_navegacion.dart';

class HomeWeb extends StatelessWidget {
  final controller = SidebarXController(selectedIndex: 0, extended: false);
  HomeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return Row(
      children: [
        BarraDeNavegacion(controller: controller),
        Container(
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
    );
  }
}
