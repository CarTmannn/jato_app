import 'package:get/get.dart';

import '../controllers/progress_page_controller.dart';

class ProgressPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressPageController>(
      () => ProgressPageController(),
    );
  }
}
