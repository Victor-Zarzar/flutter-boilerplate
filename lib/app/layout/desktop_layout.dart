import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.child, required this.location});

  final Widget child;
  final String location;

  static const _routes = [
    AppRoutes.home,
    AppRoutes.dashboard,
    AppRoutes.settings,
  ];

  bool _matchesRoute(String location, String route) {
    return location == route || location.startsWith('$route/');
  }

  int get _currentIndex {
    if (_matchesRoute(location, AppRoutes.home)) return 0;
    if (_matchesRoute(location, AppRoutes.dashboard)) return 1;
    if (_matchesRoute(location, AppRoutes.settings)) return 2;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              context.go(_routes[index]);
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: const Icon(Icons.home_outlined),
                label: Text('home'.tr()),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.dashboard_outlined),
                label: Text('dashboard'.tr()),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.settings_outlined),
                label: Text('settings'.tr()),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}
