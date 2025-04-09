import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 28,
      // color: Colors.black,
    ),

    displayMedium: TextStyle(fontSize: 24),
    displaySmall: TextStyle(fontSize: 22),

    headlineLarge: TextStyle(fontSize: 20, color: Colors.black),
    headlineSmall: TextStyle(fontSize: 18, color: Colors.black),

    bodyLarge: TextStyle(
      fontSize: 16,
      // color: Colors.black87,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
      // color: Colors.black,
    ),

    bodySmall: TextStyle(fontSize: 12, color: Colors.black),


    labelLarge: TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black),
    //grey text button
    labelMedium: TextStyle(
      fontSize: 14,
      color: Colors.black54,
    ),
    labelSmall: TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w100,color: Colors.black26),

  );
  static TextTheme darkTextTheme = TextTheme(displayLarge: TextStyle(
    fontSize: 28,
    // color: Colors.black,
  ),

    displayMedium: TextStyle(fontSize: 24),
    displaySmall: TextStyle(fontSize: 22),

    headlineLarge: TextStyle(fontSize: 20, color: Colors.white),
    headlineSmall: TextStyle(fontSize: 18, color: Colors.white),

    bodyLarge: TextStyle(
      fontSize: 16,
      // color: Colors.black87,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
      // color: Colors.black,
    ),

    bodySmall: TextStyle(fontSize: 12, color: Colors.white),


    labelLarge: TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.white),
    //grey text button
    labelMedium: TextStyle(
      fontSize: 14,
      color: Colors.black54,
    ),
    labelSmall: TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w100,color: Colors.white),

  );
}
