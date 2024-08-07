import 'package:get/get.dart';
import 'package:jato/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  var selected_index = 0.obs;

  void onTap(int index) {
    selected_index.value = index;
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.ORDER);
        break;
      case 2:
        Get.toNamed(Routes.PROFILE);
        break;
      default:
        break;
    }
  }
}
