import 'package:flutter/material.dart';
import 'package:login/utils/theme/elevated_button_theme.dart';
import 'package:login/utils/theme/input_decoration.dart';
import 'package:login/utils/theme/text_theme.dart';

class AppColors {
  static const Color bgAccent = Color(0xFF1976D2); //blue700 border focus
  static const Color border = Color(0XFFD6D6D6); //grey300
  // static const Color   = Color(0xFF9E9E9E);//grey button
  static const Color greyColor = Color(0xFFBDBDBD); //grey button
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color grey = Color(0xFFEEEEEE);
  static const Color blue = Color(0XFF2196F3);
  static const Color skyBlue = Color(0XFF304FFF);
  static const Color lightYellow = Color(0XFFFFFDE7);
  static const Color lightBlue = Color(0xFF82B1FF);
  static const Color lightPurple = Color(0xFF8D9CFF);
  static const Color lightCream = Color(0xFFf4f3ef);
  static const Color creamColor = Color(0xFFefefed);
  static const Color darkBlue = Color(0xFF586CFF);
  static const Color ashColor = Color(0xFFE8E8E8);
  static const Color yellow = Color(0xFFF9A825);
}

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.lightTextTheme,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TInputDecoration.lightInputDecorationTheme,
  );

  // static ThemeData darkTheme = ThemeData(
  //   useMaterial3: true,
  //   textTheme: TTextTheme.darkTextTheme,
  //   fontFamily: 'Poppins',
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: Colors.black,
  //   elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  //   // inputDecorationTheme: TInputDecoration.darkInputDecorationTheme,
  // );
}
