import 'package:flutter/material.dart';
import 'package:portafolio_virtual/provider/changeapp.dart';
import 'package:portafolio_virtual/provider/contact.dart';
import 'package:portafolio_virtual/provider/info.dart';
import 'package:portafolio_virtual/screens/web/home.dart';
import 'package:portafolio_virtual/screens/web/proyectos.dart';
import 'package:portafolio_virtual/screens/web/sobremi.dart';
import 'package:portafolio_virtual/screens/web/tecnologias.dart';
import 'package:portafolio_virtual/theme/themeapp.dart';
import 'package:portafolio_virtual/utils/responsive.dart';
import 'package:portafolio_virtual/widgets/barra_navegacion.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChangeApp(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => Information(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ContactoForm(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final changeApp = Provider.of<ChangeApp>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        title: 'Portafolio Virtual',
        home: Scaffold(
          body: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 600 || constraints.maxHeight < 300) {
              // Si el ancho máximo es menor a 600, se muestra un mensaje de tamaño mínimo

              return Container();
            } else {
              // Si el ancho máximo es igual o mayor a 600, se muestra el contenido normal
              return AnimatedBuilder(
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
              );
            }
          }),
        ));
  }

  Widget selectScreen(int screen) {
    switch (screen) {
      case 0:
        return const HomeWeb();
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
