import 'package:flutter/material.dart';
import 'package:login/utils/theme/elevated_button_theme.dart';
import 'package:login/utils/theme/text_theme.dart';

class TAppTheme
{
  TAppTheme._();

  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.lightTextTheme,  //reuse light text theme from class TTexttheme
    fontFamily: 'Poppins',
    brightness:Brightness.light,
    scaffoldBackgroundColor:Colors.white,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme
  );

  static ThemeData darkTheme=ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.darkTextTheme,
    fontFamily: 'Poppins',
    brightness:Brightness.dark,
      scaffoldBackgroundColor:Colors.black,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme
  );
}