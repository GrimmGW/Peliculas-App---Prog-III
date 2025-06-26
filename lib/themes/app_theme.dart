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

  );

}