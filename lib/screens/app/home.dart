import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_virtual/screens/web/proyectos.dart';
import 'package:provider/provider.dart';

import '../../provider/changeapp.dart';
import '../../utils/responsive.dart';
import '../web/contacto.dart';
import '../web/sobremi.dart';
import '../web/tecnologias.dart';

class HomeAppMain extends StatelessWidget {
  const HomeAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    final changeApp = Provider.of<ChangeApp>(context);
    return Scaffold(
        bottomNavigationBar: DotNavigationBar(
          backgroundColor: Color(0xFF2E2E48),
          enablePaddingAnimation: false,
          currentIndex: changeApp.selectOptionMovil,

          onTap: (value) {
            changeApp.selectOptionMovil = value;
          },
          // dotIndicatorColor: Colors.black,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/inicio.png")),
              selectedColor: Colors.transparent,
            ),

            /// Likes
            DotNavigationBarItem(
              icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/proyectos.png")),
              selectedColor: Colors.pink,
            ),

            /// Search
            DotNavigationBarItem(
              icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/tecnologias.png")),
              selectedColor: Colors.orange,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/acerca_de_mi.png")),
              selectedColor: Colors.teal,
            ),
          ],
        ),
        body: selectScreen(changeApp.selectOptionMovil));
  }

  Widget selectScreen(int screen) {
    switch (screen) {
      case 0:
        return HomeApp();
      case 1:
        return Proyectos();

      case 2:
        return Tecnologias();

      case 3:
        return const SobreMi();

      default:
        return Container();
    }
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
        effects: const [FadeEffect(), ScaleEffect()],
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/home.svg",
                  width: Responsive.of(context).wp(50),
                  fit: BoxFit.cover,
                ),
                Text('Hello! I\´ m\nHéctor Puga',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Responsive.of(context).wp(7),
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: Responsive.of(context).hp(3),
                ),
                ElevatedButton(
                  onPressed: () {
                    _mostrarAlert(context);
                  },
                  child: const Text("Contactame"),
                )
              ],
            ),
          ),
        )
            .animate(delay: const Duration(milliseconds: 50))
            .fade(duration: 1.seconds));
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
                width: Responsive.of(context).wm(30),
                child: const SingleChildScrollView(child: Contacto())),
          );
        });
  }
}
