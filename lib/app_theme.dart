import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF171717);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFA0A0A0);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: white,
    primaryColor: black,
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      foregroundColor: black,
      titleTextStyle: TextStyle(
        color: black,
        fontSize: 20,
      ),
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: black,
      ),
    ),
    textTheme: TextTheme(
      titleLarge:
          TextStyle(color: black, fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium:
          TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.normal),
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
