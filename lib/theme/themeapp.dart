import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData.light().copyWith(
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 70, color: Colors.black, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(color: Colors.black)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2E2E4D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: const Size(150, 50),
      )));
}
