import 'package:get/get.dart';

import '../controllers/listrik_controller.dart';

class ListrikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListrikController>(
      () => ListrikController(),
    );
  }
}
