import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  double? _width, _height, _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = math.sqrt(
        math.pow(_width!, 2) + math.pow(_height! < 600 ? 600 : _height!, 2));
  }

  double wp(double percent) => _width! * percent / 100;

  double hp(double percent) => _height! * percent / 100;

  double dp(double percent) => _diagonal! * percent / 100;

  double? hm(double percent) =>
      _height! < 400 ? 400 * percent / 100 : (_height! * percent / 100);

  double? wm(double percent) =>
      _width! < 700 ? 700 * percent / 100 : (_width! * percent / 100);
}
