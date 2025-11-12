import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Quicksand',
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
      headlineMedium: TextStyle(fontWeight: FontWeight.w600),
      displayMedium: TextStyle(fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    fontFamily: 'Quicksand',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey,
      onPrimary: Colors.white,
      surface: const Color(0xFF121212),
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
      headlineMedium: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      displayMedium: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    useMaterial3: true,
  );
}