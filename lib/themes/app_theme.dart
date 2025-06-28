import 'package:flutter/material.dart';

class AppTheme {

  static Color? primary = Colors.orangeAccent;

  static ThemeData darkTheme = ThemeData.dark().copyWith(

    //tema para AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      centerTitle: true,
      foregroundColor: Colors.black
    ),

    //tema para Text
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontFamily: 'Outfit',
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: TextStyle(
        fontFamily: 'Outfit',
        fontWeight: FontWeight.w400
      )
    )

  );

}