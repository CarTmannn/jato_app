import 'package:get/get.dart';

import '../controllers/tegel_controller.dart';

class TegelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TegelController>(
      () => TegelController(),
    );
  }
}
