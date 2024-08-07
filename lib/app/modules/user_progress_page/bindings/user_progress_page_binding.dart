import 'package:get/get.dart';

import '../controllers/user_progress_page_controller.dart';

class UserProgressPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProgressPageController>(
      () => UserProgressPageController(),
    );
  }
}
