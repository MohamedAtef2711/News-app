import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff1877F2),
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: .bold,
        color: Color(0xffffffff),
      ), // TextStyle
    ), // AppBarTheme

    scaffoldBackgroundColor: Color(0xff202020),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: .w500,
        color: Color(0xffE4E6EB),
      ), // TextStyle
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: .w500,
        color: Color(0xffE4E6EB),
      ), // TextStyle
      titleMedium: TextStyle(
        fontSize: 10,
        fontWeight: .w500,
        color: Color(0xffE4E6EB),
      ), // TextStyle
    ), // TextTheme
  ); // ThemeData
}
