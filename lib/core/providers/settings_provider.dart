import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language_code';

  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale('en');

  bool _isInitialized = false;

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  bool get isInitialized => _isInitialized;

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isRussian => _locale.languageCode == 'ru';

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    // Load theme
    final themeModeString = prefs.getString(_themeKey);
    if (themeModeString == 'dark') {
      _themeMode = ThemeMode.dark;
    } else if (themeModeString == 'light') {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }

    // Load language
    final languageCode = prefs.getString(_languageKey) ?? 'en';
    _locale = Locale(languageCode);

    _isInitialized = true;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.toString().split('.').last);
  }

  Future<void> toggleTheme() async {
    final newMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setThemeMode(newMode);
  }

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;

    _locale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale.languageCode);
  }

  Future<void> toggleLanguage() async {
    final newLocale = _locale.languageCode == 'en'
        ? const Locale('ru')
        : const Locale('en');
    await setLocale(newLocale);
  }
}
