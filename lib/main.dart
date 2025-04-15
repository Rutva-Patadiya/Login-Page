import 'package:flutter/material.dart';
import 'package:login/on_boarding_page.dart';
import 'package:login/utils/theme/theme.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: TAppTheme.lightTheme,
      // darkTheme: TAppTheme.darkTheme,
      // themeMode: ThemeMode.system,
      // home: Login()
      home: OnBoardingPage(),
    );
  }
}
