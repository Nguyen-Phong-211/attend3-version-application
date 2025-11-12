import 'package:application/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/route_generator.dart';
import 'routes/app_routes.dart';
import 'package:application/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:application/features/setting/presentation/provider/setting_provider.dart';
import 'package:application/l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);

    return MaterialApp(
      title: 'ATTEND 3D',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
      settingProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],

      locale: Locale(settingProvider.language),

      localeResolutionCallback: (locale, supportedLocales) {
        for (var supported in supportedLocales) {
          if (supported.languageCode == locale?.languageCode) {
            return supported;
          }
        }
        return const Locale('vi');
      },

      initialRoute: AppRoutes.login,
      onGenerateRoute: RouteGenerator.generateRoute,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      navigatorKey: NotificationService.navigatorKey,
    );
  }
}