import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:portfolio/core/routes/app_routes.dart';
import 'package:portfolio/presentation/pages/home_screen.dart';

class AppPages {
  static final routes = [GetPage(name: AppRoutes.home, page: () => HomePage())];
}
