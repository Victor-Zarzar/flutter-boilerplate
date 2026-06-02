import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/locale_viewmodel.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/notification_viewmodel.dart';
import 'package:flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter_boilerplate/app/shared/assets/locale_flag.dart';
import 'package:flutter_boilerplate/app/shared/extensions/context_extension.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_borders.dart';
import 'package:flutter_boilerplate/app/shared/theme/app_spacing.dart';
import 'package:flutter_boilerplate/app/shared/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  String _currentLanguageKey(Locale locale) {
    return switch (locale.languageCode) {
      'pt' => 'portuguese',
      'es' => 'spanish',
      _ => 'english',
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;
    final currentLocale = context.locale;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppTopBar(title: 'settings'.tr()),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(AppSpacing.xl.w),
          children: [
            _SettingsTile(
              icon: Icons.translate,
              title: 'language'.tr(),
              trailing: PopupMenuButton<Locale>(
                initialValue: currentLocale,
                color: colorScheme.surfaceContainerHighest,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppBorders.card,
                ),
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.language, color: colorScheme.primary),
                    SizedBox(width: AppSpacing.xs.w),
                    Text(
                      _currentLanguageKey(currentLocale).tr(),
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: colorScheme.primary),
                  ],
                ),
                onSelected: (locale) {
                  context.read<LocaleViewModel>().changeLanguage(
                    context,
                    locale,
                  );
                },
                itemBuilder: (_) => [
                  _languageItem(
                    context: context,
                    locale: const Locale('en'),
                    flag: EN.asset(),
                    label: 'english'.tr(),
                  ),
                  _languageItem(
                    context: context,
                    locale: const Locale('pt'),
                    flag: PTBR.asset(),
                    label: 'portuguese'.tr(),
                  ),
                  _languageItem(
                    context: context,
                    locale: const Locale('es'),
                    flag: ES.asset(),
                    label: 'spanish'.tr(),
                  ),
                ],
              ),
            ),

            if (!kIsWeb) ...[
              SizedBox(height: AppSpacing.md.h),
              _SettingsTile(
                icon: Icons.notifications_outlined,
                title: 'enable_notifications'.tr(),
                onTap: context
                    .read<NotificationViewModel>()
                    .openSystemNotificationSettings,
              ),
            ],

            SizedBox(height: AppSpacing.md.h),
            _SettingsTile(
              icon: Icons.color_lens_outlined,
              title: 'theme'.tr(),
              onTap: () {
                context.go(AppRoutes.theme);
              },
            ),

            SizedBox(height: AppSpacing.md.h),
            _SettingsTile(
              icon: Icons.info_outline,
              title: 'about'.tr(),
              onTap: () {
                context.go(AppRoutes.about);
              },
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<Locale> _languageItem({
    required BuildContext context,
    required Locale locale,
    required Widget flag,
    required String label,
  }) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;

    return PopupMenuItem(
      value: locale,
      child: Row(
        children: [
          flag,
          SizedBox(width: AppSpacing.sm.w),
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.theme.textTheme;

    return InkWell(
      borderRadius: AppBorders.card,
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg.w,
          vertical: AppSpacing.md.h,
        ),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: AppBorders.card,
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.primary, size: 24.sp),
            SizedBox(width: AppSpacing.md.w),
            Expanded(
              child: Text(
                title,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.chevron_right,
                  color: colorScheme.onSurfaceVariant,
                  size: 26.sp,
                ),
          ],
        ),
      ),
    );
  }
}
