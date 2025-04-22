import 'package:flutter/material.dart';
// import 'package:login/login.dart';
import 'package:login/utils/theme/theme.dart';
import 'l10n/app_localizations.dart';
import 'local_provider.dart';
import 'on_boarding_page.dart';

void main() {
  runApp(MyAppWrapper());
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  Locale _locale = const Locale('en');

  void _changeLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LocaleProvider(
      selectedLocale: _locale,
      onLocaleChange: _changeLocale,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = LocaleProvider.of(context);
    final locale = localeProvider.selectedLocale;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: TAppTheme.lightTheme,
      locale: locale,
      // Apply current locale
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
        home: OnBoardingPage(),
      // home: Login(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:login/login.dart';
// // import 'package:login/on_boarding_page.dart';
// import 'package:login/utils/theme/theme.dart';
// // import 'home_page.dart';
// import 'l10n/app_localizations.dart';
// import 'local_provider.dart';
// // import 'login.dart';
//
// void main() {
//   runApp(MyAppWrapper());
// }
//
//
//
//
// class MyAppWrapper extends StatefulWidget {
//   const MyAppWrapper({super.key});
//
//   @override
//   State<MyAppWrapper> createState() => _MyAppWrapperState();
// }
//
// class _MyAppWrapperState extends State<MyAppWrapper> {
//   Locale _locale = const Locale('en');
//
//   void _changeLocale(Locale newLocale) {
//     setState(() {
//       _locale = newLocale;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LocaleProvider(
//       selectedLocale: _locale,
//       onLocaleChange: _changeLocale,
//       child: const MyApp(), // your actual app
//     );
//   }
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Access the current locale from LocaleProvider
//     final localeProvider = LocaleProvider.of(context);
//     final _locale = localeProvider.selectedLocale;  // Get the current locale
//
//     return LocaleProvider(selectedLocale: _locale, onLocaleChange: , child:aterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Page',
//       theme: TAppTheme.lightTheme,
//       locale: _locale,  // Apply the locale globally from the provider
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       home: Login(onLocaleChange: localeProvider.onLocaleChange, locale: _locale),
//     ) );
//
//
//   }
// }
// //stateless to stateful to hold locales
// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   Locale _locale = const Locale('en'); // default
// //
// //   void _changeLanguage(Locale newLocale) {
// //     setState(() {
// //       _locale = newLocale;
// //     });
// //   }
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Login Page',
// //       theme: TAppTheme.lightTheme,
// //       locale: _locale,
// //       // locale: const Locale('en'),
// //       localizationsDelegates: AppLocalizations.localizationsDelegates,
// //       supportedLocales: AppLocalizations.supportedLocales,
// //       home: Login(onLocaleChange: _changeLanguage, locale: _locale),
// //       // darkTheme: TAppTheme.darkTheme,
// //       // themeMode: ThemeMode.system,
// //       // home: HomePage(onLocaleChange: (Locale p1) {  }, locale: Locale('en'),)
// //       // home: OnBoardingPage(locale: _locale,
// //       //   onLocaleChange: _changeLanguage,),
// //     );
// //   }
// // }
