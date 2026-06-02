import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_boilerplate/app/features/home/presentation/widgets/home_action_card.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/test_app_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  GoRouter makeRouter() {
    return GoRouter(
      initialLocation: AppRoutes.home,
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) =>
              const Scaffold(body: Text('Dashboard Page')),
        ),
      ],
    );
  }

  testWidgets('should render home page content', (tester) async {
    await tester.pumpWidget(makeTestApp(router: makeRouter()));

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);

    expect(find.text('12'), findsOneWidget);
    expect(find.text('28'), findsOneWidget);
  });

  testWidgets('should navigate to dashboard when action card is tapped', (
    tester,
  ) async {
    await tester.pumpWidget(makeTestApp(router: makeRouter()));
    await tester.pumpAndSettle();

    final actionCard = find.byType(HomeActionCard);

    expect(actionCard, findsOneWidget);

    await tester.ensureVisible(actionCard);
    await tester.tap(actionCard);
    await tester.pumpAndSettle();

    expect(find.text('Dashboard Page'), findsOneWidget);
  });
}
