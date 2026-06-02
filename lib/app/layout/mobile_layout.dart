import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, required this.child, required this.location});

  final Widget child;
  final String location;

  static const List<String> _routes = [
    AppRoutes.home,
    AppRoutes.dashboard,
    AppRoutes.settings,
  ];

  int get _currentIndex {
    if (location == AppRoutes.home) return 0;
    if (location.startsWith(AppRoutes.dashboard)) return 1;
    if (location.startsWith(AppRoutes.settings)) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          context.go(_routes[index]);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: colorScheme.onSecondaryContainer,
            ),
            label: 'home'.tr(),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.dashboard_outlined,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.dashboard,
              color: colorScheme.onSecondaryContainer,
            ),
            label: 'dashboard'.tr(),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings_outlined,
              color: colorScheme.onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.settings,
              color: colorScheme.onSecondaryContainer,
            ),
            label: 'settings'.tr(),
          ),
        ],
      ),
    );
  }
}
