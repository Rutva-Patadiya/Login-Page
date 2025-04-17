import 'package:flutter/material.dart';
import 'package:login/on_boarding_page.dart';
import 'package:login/utils/theme/theme.dart';
import 'home_page.dart';
import 'l10n/app_localizations.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

//stateless to stateful to hold locales
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // default

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: TAppTheme.lightTheme,
      locale: _locale,
      // locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // home: Login(onLocaleChange: _changeLanguage, locale: _locale),
      // darkTheme: TAppTheme.darkTheme,
      // themeMode: ThemeMode.system,
      // home: HomePage()
      home: OnBoardingPage(locale: _locale,
        onLocaleChange: _changeLanguage,),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context)
//   {
//
//     return Scaffold(
//         body:Center(child: Text(AppLocalizations.of(context)!.hello)));
//   }
//
// }
