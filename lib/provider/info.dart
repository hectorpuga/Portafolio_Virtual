import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Information extends ChangeNotifier {
  List<dynamic> web = [];
  List<dynamic> mobile = [];
  List<dynamic> desktop = [];
  List all = [];
  List tecnologias = [];
  List frameworks = [];
  List herramientas = [];

  Information() {
    cargarData();
  }

  cargarData() async {
    final resp = await rootBundle.loadString('data/info_proyectos.json');

    Map dataMap = json.decode(resp);
    //print(dataMap['nombreApp']);
    web = dataMap['Web'];
    desktop = dataMap['Desktop'];
    mobile = dataMap['Mobile'];
    tecnologias = dataMap['Lenguajes'];
    frameworks = dataMap['Frameworks'];
    herramientas = dataMap['Herramientas'];

    all.addAll(web);
    all.addAll(desktop);
    all.addAll(mobile);
    all.shuffle();
  }
}
