import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:my_app/core/l10n/app_localizations.dart';
import 'package:my_app/features/archive/archive_main.dart';
import 'package:my_app/features/main_page/feed_main.dart';
import 'package:my_app/features/settings/settings_main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _pages = const [FeedScreen(), ArchiveScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return PlatformScaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavBar: PlatformNavBar(
        currentIndex: _currentIndex,
        itemChanged: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.archive),
            label: l10n.archive,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
      ),
    );
  }
}
