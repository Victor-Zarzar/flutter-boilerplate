import 'package:flutter_boilerplate/app/routes/app_routes.dart';

abstract final class NavigationHelper {
  NavigationHelper._();

  static const List<String> routes = [
    AppRoutes.home,
    AppRoutes.dashboard,
    AppRoutes.settings,
  ];

  static bool matchesRoute(String location, String route) {
    return location == route || location.startsWith('$route/');
  }

  static int getSelectedIndex(String location) {
    for (int i = 0; i < routes.length; i++) {
      if (matchesRoute(location, routes[i])) {
        return i;
      }
    }

    return 0;
  }
}
