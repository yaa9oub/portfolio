import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/theme.dart';
import 'package:portfolio/core/routes/app_pages.dart';
import 'package:portfolio/core/routes/app_routes.dart';
import '../presentation/controllers/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appTtitle,
        theme:
            themeController.isDarkMode.value
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
        initialRoute: AppRoutes.home,
        getPages: AppPages.routes,
      ),
    );
  }
}
