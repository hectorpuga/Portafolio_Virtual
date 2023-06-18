import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portafolio_virtual/provider/changeapp.dart';
import '../../background/background.dart';
import '../../utils/responsive.dart';
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
              width: sized.width * 0.934,
              height: sized.height,
              child: Background(
                body: Padding(
                  padding: EdgeInsets.only(left: sized.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello! I\´ m\nHéctor Puga',
                          style: TextStyle(
                              fontSize: Responsive.of(context).wp(7),
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: sized.height * 0.05,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Contactame"),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
