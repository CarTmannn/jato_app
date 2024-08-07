import 'package:get/get.dart';

import '../controllers/kayu_controller.dart';

class KayuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KayuController>(
      () => KayuController(),
    );
  }
}
