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
  final savedLocale = await LocaleStorage.getSavedLocale();
  //get saved locale from local_storage [this method returns the locale obj]
  final savedPage = await LocaleStorage.getSavedPage(); //for login page
  final isOnboarded = await LocaleStorage.getBoardPage();
  final fName = await LocaleStorage.getFName();
  final lName = await LocaleStorage.getLName();

  runApp(
    MyAppWrapper(
      //for shared pref
      initialLocale: savedLocale,
      initialPage: savedPage,
      isOnBoarded: isOnboarded,
      fName: fName,
      lName: lName,
    ),
  );
}

class MyAppWrapper extends StatefulWidget {
  final Locale initialLocale;
  final String? initialPage; //modified for page
  final bool isOnBoarded;
  final String? fName;
  final String? lName;

  const MyAppWrapper({
    super.key,
    required this.initialLocale,
    required this.initialPage,
    required this.isOnBoarded,
    required this.fName,
    required this.lName,
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
    //stores language in shared pref
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
        fName: widget.fName,
        lName:widget.lName
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final String? initialPage;
  final bool isOnBoarded;
  final String? fName;
  final String? lName;

  const MyApp({
    super.key,
    required this.initialPage, //for checking loggedin is true or false by checking token
    required this.isOnBoarded,
    required this.fName,
    required this.lName,
  });

  @override
  Widget build(BuildContext context) {
    Widget initialScreen;
    final localeProvider = LocaleProvider.of(context);
    final locale = localeProvider.selectedLocale;

    if (!isOnBoarded) {
      initialScreen = OnBoardingPage();
    } else if (isOnBoarded && initialPage == 'null' || fName == 'null') {
      initialScreen = Login();
    }
    //check token is null or not
    else if (initialPage != null) {
      initialScreen = HomePage("$fName","$lName",'null', null);
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
