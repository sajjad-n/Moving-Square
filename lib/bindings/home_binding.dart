import 'package:get/get.dart';

import '../controller/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SquareAnimController());
    Get.put(ImageController());
  }
}
