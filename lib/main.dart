import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login/home_page.dart';
import 'package:login/login.dart';
import 'package:login/utils/theme/theme.dart';
import 'l10n/app_localizations.dart';
import 'local_provider.dart';
import 'on_boarding_page.dart';
import 'local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //checks app is initialized
  final savedLocale = await LocaleStorage.getSavedLocale();  //get saved locale from local_storage [this method returns the locale obj]
  final savedPage = await LocaleStorage.getSavedPage();
  runApp(MyAppWrapper(initialLocale: savedLocale,initialPage: savedPage));
}

class MyAppWrapper extends StatefulWidget {
  final Locale initialLocale;
  final bool initialPage;//modified for page
  const MyAppWrapper({super.key, required this.initialLocale, required this.initialPage}); //passed savedLocale

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  Locale _locale = const Locale('en');

  //for shared preference
  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
    // initialize from main() [widget] for accessing the property of parent stateful widget
  }

  void _changeLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
    LocaleStorage.saveLocale(newLocale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return LocaleProvider(
      selectedLocale: _locale,
      onLocaleChange: _changeLocale,
      //modified
      child: MyApp(initialPage:widget.initialPage,),
    );
  }
}

class MyApp extends StatelessWidget {
  final bool initialPage;

  const MyApp({super.key,required this.initialPage});

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

        //modified for page
        home: initialPage? HomePage(): OnBoardingPage(),
      // home: Login(),
    );
  }
}

// stateless to stateful to hold locales
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Locale _locale = const Locale('en'); // default
//
//   void _changeLanguage(Locale newLocale) {
//     setState(() {
//       _locale = newLocale;
//     });
//   }
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Page',
//       theme: TAppTheme.lightTheme,
//       locale: _locale,
//       // locale: const Locale('en'),
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       home: Login(onLocaleChange: _changeLanguage, locale: _locale),
//       // darkTheme: TAppTheme.darkTheme,
//       // themeMode: ThemeMode.system,
//       // home: HomePage(onLocaleChange: (Locale p1) {  }, locale: Locale('en'),)
//       // home: OnBoardingPage(locale: _locale,
//       //   onLocaleChange: _changeLanguage,),
//     );
//   }
// }
