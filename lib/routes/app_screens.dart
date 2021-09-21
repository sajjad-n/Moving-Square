import 'package:get/get.dart';

import '../view/screens/screens.dart';
import '../bindings/bindings.dart';
import 'app_routes.dart';

class AppScreens {
  static final screens = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
