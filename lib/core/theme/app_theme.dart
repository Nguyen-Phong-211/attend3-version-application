import 'package:flutter/material.dart';
import 'light_theme.dart';

class AppTheme {
  // static ThemeData get lightTheme => LightTheme.theme;
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Quicksand',
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
      bodyMedium: TextStyle(fontSize: 16),
      headlineMedium: TextStyle(fontWeight: FontWeight.w600),
      displayMedium: TextStyle(fontWeight: FontWeight.w500),
    ),
    useMaterial3: true,
  );
}
