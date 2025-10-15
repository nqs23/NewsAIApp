import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ru'),
  ];

  // Main Screen
  String get viewLatestNews {
    return locale.languageCode == 'ru'
        ? 'Просмотреть\nпоследние\nновости'
        : 'View\nLatest\nNews';
  }

  String get home {
    return locale.languageCode == 'ru' ? 'Главная' : 'Home';
  }

  // Archive Screen
  String get archive {
    return locale.languageCode == 'ru' ? 'Архив' : 'Archive';
  }

  String get newsArchive {
    return locale.languageCode == 'ru' ? 'Архив новостей' : 'News Archive';
  }

  String get noNewsYet {
    return locale.languageCode == 'ru'
        ? 'Пока нет новостей'
        : 'No news yet';
  }

  // Settings Screen
  String get settings {
    return locale.languageCode == 'ru' ? 'Настройки' : 'Settings';
  }

  String get language {
    return locale.languageCode == 'ru' ? 'Язык' : 'Language';
  }

  String get english {
    return locale.languageCode == 'ru' ? 'Английский' : 'English';
  }

  String get russian {
    return locale.languageCode == 'ru' ? 'Русский' : 'Russian';
  }

  String get theme {
    return locale.languageCode == 'ru' ? 'Тема' : 'Theme';
  }

  String get lightTheme {
    return locale.languageCode == 'ru' ? 'Светлая' : 'Light';
  }

  String get darkTheme {
    return locale.languageCode == 'ru' ? 'Темная' : 'Dark';
  }

  // Common
  String get today {
    return locale.languageCode == 'ru' ? 'Сегодня' : 'Today';
  }

  String get yesterday {
    return locale.languageCode == 'ru' ? 'Вчера' : 'Yesterday';
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
