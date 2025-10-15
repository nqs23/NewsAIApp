import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:my_app/core/l10n/app_localizations.dart';
import 'package:my_app/core/providers/settings_provider.dart';
import 'package:my_app/features/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        return PlatformApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          locale: settingsProvider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          material: (_, __) => MaterialAppData(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF6366F1), // Indigo
                brightness: Brightness.light,
              ).copyWith(
                primary: const Color(0xFF6366F1),
                secondary: const Color(0xFF8B5CF6), // Purple
                surface: Colors.white,
              ),
              useMaterial3: true,
              cardTheme: CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF6366F1),
                brightness: Brightness.dark,
              ).copyWith(
                primary: const Color(0xFF818CF8),
                secondary: const Color(0xFFA78BFA),
                surface: const Color(0xFF1E1E2E),
              ),
              scaffoldBackgroundColor: const Color(0xFF131320),
              useMaterial3: true,
              cardTheme: const CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                color: Color(0xFF1E1E2E),
              ),
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
            themeMode: settingsProvider.themeMode,
          ),
          cupertino: (_, __) => CupertinoAppData(
            theme: MaterialBasedCupertinoThemeData(
              materialTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFF6366F1),
                  brightness: settingsProvider.isDarkMode
                      ? Brightness.dark
                      : Brightness.light,
                ),
              ),
            ),
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}
