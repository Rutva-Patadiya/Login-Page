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
  final savedLocale = await LocaleStorage.getSavedLocale(); //get saved locale from local_storage [this method returns the locale obj]
  final savedPage = await LocaleStorage.getSavedPage(); //for login page
  final isOnboarded = await LocaleStorage.getBoardPage();

  runApp(
    MyAppWrapper(
      initialLocale: savedLocale,
      initialPage: savedPage,
      isOnBoarded: isOnboarded,
    ),
  );
}

class MyAppWrapper extends StatefulWidget {
  final Locale initialLocale;
  final bool initialPage; //modified for page
  final bool isOnBoarded;

  const MyAppWrapper({
    super.key,
    required this.initialLocale,
    required this.initialPage,
    required this.isOnBoarded,
  }); //passed savedLocale

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
      child: MyApp(
        initialPage: widget.initialPage,
        isOnBoarded: widget.isOnBoarded,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final bool initialPage;
  final bool isOnBoarded;

  const MyApp({
    super.key,
    required this.initialPage,//for checking loggedin is true or not
    required this.isOnBoarded,
  });

  @override
  Widget build(BuildContext context) {
    Widget initialScreen;
    final localeProvider = LocaleProvider.of(context);
    final locale = localeProvider.selectedLocale;

    if (!isOnBoarded) {
      initialScreen = OnBoardingPage();
    } else if (initialPage) {
      initialScreen = HomePage();
    } else {
      initialScreen = Login();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: TAppTheme.lightTheme,
      locale: locale,
      // Apply current locale
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: initialScreen,
      // home: Login(),
    );
  }
}

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
