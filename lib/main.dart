import 'package:flutter/material.dart';
import 'package:portafolio_virtual/screens/web/home.dart';
import 'package:portafolio_virtual/theme/themeapp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
              return HomeWeb();
            }
          }),
        ));
  }
}
