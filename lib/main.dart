import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/core/presentation/widget/app.dart';
import 'package:my_app/core/providers/settings_provider.dart';
import 'package:my_app/core/providers/news_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize settings provider
  final settingsProvider = SettingsProvider();
  await settingsProvider.init();

  // Initialize news provider
  final newsProvider = NewsProvider();
  await newsProvider.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: settingsProvider),
        ChangeNotifierProvider.value(value: newsProvider),
      ],
      child: const MyApp(),
    ),
  );
}
