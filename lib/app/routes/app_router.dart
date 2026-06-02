import 'package:flutter_boilerplate/app/features/about/presentation/pages/about_page.dart';
import 'package:flutter_boilerplate/app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter_boilerplate/app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_boilerplate/app/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter_boilerplate/app/features/settings/presentation/pages/theme_page.dart';
import 'package:flutter_boilerplate/app/layout/desktop_layout.dart';
import 'package:flutter_boilerplate/app/layout/mobile_layout.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter_boilerplate/app/routes/global_navigation.dart';
import 'package:flutter_boilerplate/app/shared/wrapper/responsive_wrapper.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final location = state.uri.path;
        return ResponsiveWrapper(
          mobile: MobileLayout(location: location, child: child),
          tablet: MobileLayout(location: location, child: child),
          desktop: DesktopLayout(location: location, child: child),
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) => const SettingsPage(),
          routes: [
            GoRoute(
              path: 'about',
              builder: (context, state) => const AboutPage(),
            ),
            GoRoute(
              path: 'theme',
              builder: (context, state) => const ThemePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
