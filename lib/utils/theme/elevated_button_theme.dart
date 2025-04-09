import 'package:flutter/material.dart';
import 'package:login/utils/theme/text_theme.dart';
import 'package:login/utils/theme/theme.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(

      backgroundColor: AppColors.buttonColor,
      textStyle: TTextTheme.lightTextTheme.titleLarge,
      padding:EdgeInsets.only(top: 10),
      minimumSize: const Size(350, 50),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      textStyle: const TextStyle(

      ),
      padding:EdgeInsets.only(top: 10),
      minimumSize: const Size(350, 50),
    ),
  );
}
