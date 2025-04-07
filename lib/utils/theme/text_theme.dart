import 'package:flutter/material.dart';

class TTextTheme
{
  TTextTheme._();

  static TextTheme lightTextTheme=TextTheme(
// headlineLarge: TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),
// headlineMedium: TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w500,color: Colors.black),
// headlineSmall: TextStyle().copyWith(fontSize: 19,fontWeight: FontWeight.w100,color: Colors.black),
//
// titleLarge: TextStyle().copyWith(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),
// titleMedium: TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
// titleSmall: TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black),

bodyLarge: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
bodyMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),

    //grey text button
labelMedium: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black54),
// labelLarge: TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w100,color: Colors.black),

  );
  static TextTheme darkTextTheme=TextTheme(

    // headlineLarge: TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),
    // headlineMedium: TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w500,color: Colors.black),
    // headlineSmall: TextStyle().copyWith(fontSize: 19,fontWeight: FontWeight.w100,color: Colors.black),
    //
    // titleLarge: TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
    // titleMedium: TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
    // titleSmall: TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w100,color: Colors.black),
    //

      bodyLarge: TextStyle().copyWith(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
      bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black)


    // labelMedium: TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black),
    // labelLarge: TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w100,color: Colors.black),
  );
}
