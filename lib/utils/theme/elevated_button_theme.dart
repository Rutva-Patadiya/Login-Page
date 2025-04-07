import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey,
      textStyle: const TextStyle(
        fontSize: 2,
      ),
      padding:EdgeInsets.only(top: 10),
      minimumSize: const Size(350, 60),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey,
      textStyle: const TextStyle(

      ),
      padding:EdgeInsets.only(top: 10),
      minimumSize: const Size(350, 60),
    ),
  );
}
