import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BarraDeNavegacion(controller: changeApp.controllerSideNav),
            Expanded(
              child: Background(
                changeApp: changeApp,
                body: Padding(
                  padding: EdgeInsets.only(
                    left: Responsive.of(context).wp(5),
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello! I\´ m\nHéctor Puga',
                                style: TextStyle(
                                    fontSize: Responsive.of(context).wp(7),
                                    color: Colors.white,
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
                        SizedBox(width: Responsive.of(context).wp(8)),
                        SvgPicture.asset("assets/home.svg",
                            width: Responsive.of(context).wp(23),
                            fit: BoxFit.cover,
                            semanticsLabel: 'A red up arrow')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
