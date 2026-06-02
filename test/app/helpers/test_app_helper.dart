import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/routes/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Widget makeTestApp({required GoRouter router}) {
  return EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('pt'), Locale('es')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: appRouter,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    ),
  );
}
