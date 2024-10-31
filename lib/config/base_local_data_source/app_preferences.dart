import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/localization_logic/localization_model.dart';

const String preferenceKeyLanguage = 'preferenceKeyLanguage';
const String preferenceKeyDarkThemeModeOn = 'preferenceKeyDarkThemeModeOn';
const String preferenceKeyLimitPoints = 'preferenceKeyLimitPoints';

@LazySingleton()
class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  setLimitPoints(double limitPoints) {
    _sharedPreferences.setDouble(preferenceKeyLimitPoints, limitPoints);
  }

  double getLimitPoints() {
    return _sharedPreferences.getDouble(preferenceKeyLimitPoints) ?? 100.0;
  }

  //todo: for Localization
  // Locale settings
  Future<String> getAppLocale() async {
    String? appLocale = _sharedPreferences.getString(preferenceKeyLanguage);
    if (appLocale != null && appLocale.isNotEmpty) {
      return appLocale;
    } else {
      return LanguageType.arabic.getValue();
    }
  }

  //todo: for Localization
  // to materialAPP
  Future<Locale> getLocale() async {
    if (await getAppLocale() == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  //todo: for Localization
  // to bloc
  Future<void> changeLocale() async {
    if (await getAppLocale() == LanguageType.english.getValue()) {
      _sharedPreferences.setString(
          preferenceKeyLanguage, LanguageType.arabic.getValue());
    } else {
      _sharedPreferences.setString(
          preferenceKeyLanguage, LanguageType.english.getValue());
    }
  }

  // Theme mode settings
  setThemeMode(bool isDark) {
    _sharedPreferences.setBool(preferenceKeyDarkThemeModeOn, isDark);
  }

  isDarkModeOn() {
    return _sharedPreferences.getBool(preferenceKeyDarkThemeModeOn) ?? false;
  }
}
