import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorage
{

  //for phone's language
  static const String _key='selected_locale';//selected_locale is label stored in phone's local storage
  static Future<void> saveLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, languageCode);
  }

  static Future<Locale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key) ?? 'en'; // default to English
    return Locale(code);
  }


  static const String _key1='isLoggedIn';
  static Future<void> savePage(bool page) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key1, page);
  }

  static Future<bool> getSavedPage() async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getBool(_key1) ?? false;

  }

  static const String _key2='onBoardingPage';
  static Future<void> onBoard(bool onboard) async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setBool(_key2,onboard);
  }


  static Future<bool> getBoardPage() async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getBool(_key2) ?? false;
  }
}