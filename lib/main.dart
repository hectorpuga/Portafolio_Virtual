import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:portafolio_virtual/screens/app/home.dart';
import 'package:portafolio_virtual/screens/screens.dart';
import 'package:portafolio_virtual/screens/web/home.dart';
import 'package:portafolio_virtual/theme/themeapp.dart';
import 'package:portafolio_virtual/widgets/barra_navegacion.dart';
import 'package:provider/provider.dart';

import 'custom_animation.dart';
import 'provider/provider.dart';

void main() {
  runApp(const AppState());
  configLoading();
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ChangeApp(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => Information(),
        lazy: false,
      ),
      ChangeNotifierProvider(
        create: (_) => ContactoFormProvider(),
        lazy: false,
      ),
    ], child: const MyApp());
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final changeApp = Provider.of<ChangeApp>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: AppTheme.appTheme,
      title: 'Portafolio Virtual',
      home: FlutterSplashScreen.gif(
        gifPath: 'assets/example.gif',
        gifWidth: 269,
        gifHeight: 474,
        defaultNextScreen: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600 && constraints.maxHeight != 300) {
              // Si el ancho máximo es menor a 600, se muestra un mensaje de tamaño mínimo

              return const HomeAppMain();
            } else {
              // Si el ancho máximo es igual o mayor a 600, se muestra el contenido normal
              return Scaffold(
                body: AnimatedBuilder(
                  animation: changeApp.controllerSideNav,
                  builder: (context, child) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        width: Responsive.of(context).wp(100),
                        height: Responsive.of(context).hm(100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BarraDeNavegacion(
                                controller: changeApp.controllerSideNav),
                            selectScreen(
                                changeApp.controllerSideNav.selectedIndex)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget selectScreen(int screen) {
    switch (screen) {
      case 0:
        return const Expanded(child: HomeWeb());
      case 1:
        return const Expanded(child: Proyectos());

      case 2:
        return const Expanded(child: Tecnologias());
      case 3:
        return const Expanded(child: SobreMi());
      default:
        return Container();
    }
  }
}
