import 'package:get/get.dart';

import '../controllers/home_builder_controller.dart';

class HomeBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBuilderController>(
      () => HomeBuilderController(),
    );
  }
}
