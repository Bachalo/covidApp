//

import 'package:shared_preferences/shared_preferences.dart';

final String _curSlug = "chosenSlug";

class SharedPrefsSettings {
//

  /// -----------------------------------------
  /// Method that returns what country user wants track
  /// -----------------------------------------
  Future<String> getCurrentSlug() async {
    final prefs = await SharedPreferences.getInstance();

    final stringReturned = prefs.getString(_curSlug);
    if (stringReturned == null) {
      return "poland";
    }
    return stringReturned.replaceFirst(
        stringReturned[0], stringReturned[0].toUpperCase());
  }

  /// -----------------------------------------
  /// Method that returns if user wants to receive notifications
  /// -----------------------------------------

  Future<bool> getBoolFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();

    final boolReturned = prefs.getBool("notifications");
    if (boolReturned == null) {
      return true;
    }
    return boolReturned;
  }

  /// -----------------------------------------
  /// Method that saves what country user wants to track
  /// -----------------------------------------

  Future<bool> setBoolFromSharedPref(value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("notifications", value);
    bool newValue = await getBoolFromSharedPref();
    return newValue;
  }

  /// -----------------------------------------
  /// Method that saves if user wants to receive notifications
  /// -----------------------------------------

  Future<String> setCurSlug(String value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_curSlug, value);
    String newValue = await getCurrentSlug();
    return newValue;
  }
}
