import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF171717);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFA0A0A0);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: white,
    primaryColor: black,

    // AppBar
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

    // Text
    textTheme: TextTheme(
        titleLarge: TextStyle(
          color: black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        titleSmall: TextStyle(
          color: black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          color: black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        )),
  );

  static ThemeData darkTheme = ThemeData();
}
