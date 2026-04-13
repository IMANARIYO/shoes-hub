import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/config/routes/app_router.dart';
import 'package:shoes_hub_mobile_app/core/constants/app_constants.dart';
import 'package:shoes_hub_mobile_app/core/themes/app_theme.dart';

class ShoesHubApp extends StatelessWidget {
  const ShoesHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
