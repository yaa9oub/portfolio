import 'package:get/get.dart';
import 'package:portfolio/core/constants/theme.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    isDarkMode.value = Get.isDarkMode;
    super.onInit();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(
      isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme,
    );
  }
}
