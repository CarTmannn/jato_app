import 'package:get/get.dart';

import '../controllers/fill_address_controller.dart';

class FillAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FillAddressController>(
      () => FillAddressController(),
    );
  }
}
