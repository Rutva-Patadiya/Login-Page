import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorage {
  //for phone's language
  static const String _key =
      'selected_locale'; //selected_locale is label stored in phone's local storage
  static Future<void> saveLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, languageCode);
  }

  static Future<Locale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key) ?? 'en'; // default to English
    return Locale(code);
  }

  //pass the token
  static const String _key1 = 'isLoggedIn';

  static Future<void> savePage(String page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key1, page);
  }

  static Future<String?> getSavedPage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key1);
  }

  static const String _key3 = 'first_name';

  static Future<void> saveFName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key3, name);
  }

  static Future<String?> getFName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key3) ?? null;
  }

  static const String _key4 = 'last_name';

  static Future<void> saveLName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key4, name);
  }

  static Future<String?> getLName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key4) ?? null;
  }

  static const String _key2 = 'onBoardingPage';

  static Future<void> onBoard(bool onboard) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key2, onboard);
  }

  static Future<bool> getBoardPage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key2) ?? false;
  }
}
