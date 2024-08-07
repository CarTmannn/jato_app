import 'package:get/get.dart';

import '../controllers/order_builder_controller.dart';

class OrderBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderBuilderController>(
      () => OrderBuilderController(),
    );
  }
}
