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

  final List fotoRumah = ["catrumah.jpg", "house1.jpg", "house2.jpg"];
  final List rating = ["4.9", "4.5", "5.0"];
  final List jarak = ["1.2", "7", "3.5"];
  final List owner = [
    "Edy",
    "Rehan",
    "farhan",
  ];
  final List tukang = ["Yanto Naska", "Firmansyah", "Adi Bahtiar"];

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
