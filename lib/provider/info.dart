import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Information extends ChangeNotifier {
  List<dynamic> opciones = [];

  Information() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/info_proyectos.json');

    Map dataMap = json.decode(resp);
    //print(dataMap['nombreApp']);
    opciones = dataMap['proyectos'];

    return opciones;
  }
}
