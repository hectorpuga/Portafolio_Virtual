import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../utils/responsive.dart';

class ChangeApp extends ChangeNotifier {
  final _controller = SidebarXController(selectedIndex: 0, extended: false);
  int _selectOptionMovil = 0;
  final List<double> _opacity = [];
  final List<String> _optionsMovil = [
    "assets/inicio.png",
    "assets/proyectos.png",
    "assets/tecnologias.png",
    "assets/acerca_de_mi.png"
  ];
  List get optionsMovil => _optionsMovil;
  set selectOptionMovil(int value) {
    _selectOptionMovil = value;
    notifyListeners();
  }

  int get selectOptionMovil => _selectOptionMovil;
  void opacitySet(int i, double value) {
    _opacity[i] = value;
    notifyListeners();
  }

  List get opacity => _opacity;

  SidebarXController get controllerSideNav => _controller;

  set selectIndex(int i) {
    _controller.selectIndex(i);
    notifyListeners();
  }

  void mostrarAlert(BuildContext context, Widget child) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
                width: Responsive.of(context).wm(30),
                child: SingleChildScrollView(child: child)),
          );
        });
  }
}
