import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/features/about/presentation/pages/about_page.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import '../helpers/test_app_helper.dart';

class FakeUrlLauncherPlatform extends UrlLauncherPlatform {
  String? launchedUrl;

  @override
  LinkDelegate? get linkDelegate => null;

  @override
  Future<bool> canLaunch(String url) async => true;

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    launchedUrl = url;
    return true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeUrlLauncherPlatform fakeUrlLauncher;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  setUp(() {
    fakeUrlLauncher = FakeUrlLauncherPlatform();
    UrlLauncherPlatform.instance = fakeUrlLauncher;
  });

  GoRouter makeRouter() {
    return GoRouter(
      initialLocation: AppRoutes.about,
      routes: [
        GoRoute(
          path: AppRoutes.about,
          builder: (context, state) => const AboutPage(),
        ),
      ],
    );
  }

  testWidgets('should render about page UI correctly', (tester) async {
    await tester.pumpWidget(makeTestApp(router: makeRouter()));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.add_ic_call), findsOneWidget);
    expect(find.text('about'.tr()), findsWidgets);
    expect(find.text('description'.tr()), findsOneWidget);
    expect(find.text('developed'.tr()), findsOneWidget);
  });

  testWidgets('should open portfolio when developed text is tapped', (
    tester,
  ) async {
    await tester.pumpWidget(makeTestApp(router: makeRouter()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('developed'.tr()));
    await tester.pumpAndSettle();

    expect(fakeUrlLauncher.launchedUrl, 'https://www.victorzarzar.com.br');
  });
}
