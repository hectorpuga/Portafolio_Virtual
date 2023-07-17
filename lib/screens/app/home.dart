import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../provider/changeapp.dart';
import '../screens.dart';

class HomeAppMain extends StatelessWidget {
  const HomeAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    final changeApp = Provider.of<ChangeApp>(context);
    return Scaffold(
        bottomNavigationBar: DotNavigationBar(
          backgroundColor: const Color(0xFF2E2E48),
          enablePaddingAnimation: false,
          currentIndex: changeApp.selectOptionMovil,

          onTap: (value) {
            changeApp.selectOptionMovil = value;
          },
          // dotIndicatorColor: Colors.black,
          items: [
            for (int i = 0; i < changeApp.optionsMovil.length; i++)

              /// Home
              DotNavigationBarItem(
                icon: SizedBox(
                    width: Responsive.of(context).wm(4),
                    child: Image.asset(changeApp.optionsMovil[i])),
                selectedColor: Colors.transparent,
              ),

            /// Likes
          ],
        ),
        body: selectScreen(changeApp.selectOptionMovil));
  }

  Widget selectScreen(int screen) {
    switch (screen) {
      case 0:
        return const HomeApp();
      case 1:
        return const Proyectos();

      case 2:
        return const Tecnologias();

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
    final changeApp = Provider.of<ChangeApp>(context);

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
                Text('Hello! I´ m\nHéctor Puga',
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
                    changeApp.mostrarAlert(context, const Contacto());
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
}
