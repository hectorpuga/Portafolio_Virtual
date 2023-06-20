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
      child: SizedBox(
        width: sized.width,
        height: Responsive.of(context).hm(100),
        child: Row(
          children: [
            BarraDeNavegacion(controller: changeApp.controllerSideNav),
            Expanded(
              child: Background(
                changeApp: changeApp,
                body: Padding(
                  padding: EdgeInsets.only(
                    left: Responsive.of(context).wp(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello! I\´ m\nHéctor Puga',
                          style: TextStyle(
                              fontSize: Responsive.of(context).dp(6),
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: Responsive.of(context).hp(3),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Contactame"),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
