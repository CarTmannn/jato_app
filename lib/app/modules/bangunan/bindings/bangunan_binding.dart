import 'package:get/get.dart';

import '../controllers/bangunan_controller.dart';

class BangunanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BangunanController>(
      () => BangunanController(),
    );
  }
}
