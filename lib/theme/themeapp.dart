import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFF10101A),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        displayLarge: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        labelLarge: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            fontSize: 70, color: Colors.black, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(color: Colors.black)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF2E2E4D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: const Size(150, 50),
    )),
    inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: Color.fromARGB(255, 56, 56, 56),
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16.0,
            color: Color.fromRGBO(90, 78, 60, 100))),
  );
}
