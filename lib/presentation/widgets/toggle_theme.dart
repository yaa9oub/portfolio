import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/controllers/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return IconButton(
      icon: Obx(
        () => Icon(
          themeController.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
        ),
      ),
      onPressed: themeController.toggleTheme,
    );
  }
}
