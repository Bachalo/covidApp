//

import 'package:shared_preferences/shared_preferences.dart';

final String _curSlug = "chosenSlug";
final String _kNotificationsPrefs = "allowNotifications";

/// -----------------------------------------
/// Method that return country slug that user wants to track
/// -----------------------------------------
class SP {
  Future<String> getCurrentSlug() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_curSlug) ?? "poland";
  }

  /// -----------------------------------------
  /// Method that returns if user wants to receive notifications
  /// -----------------------------------------

  Future<bool> getAllowsNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_kNotificationsPrefs) ?? true;
  }

  /// -----------------------------------------
  /// Method that saves what country user wants to track
  /// -----------------------------------------

  Future<bool> setAllowsNotifications(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_kNotificationsPrefs, value);
  }

  /// -----------------------------------------
  /// Method that saves if user wants to receive notifications
  /// -----------------------------------------

  Future<bool> setCurSlug(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_curSlug, value);
  }
}
