import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ProgressPageController extends GetxController {
  final count = 0.obs;

  launchWhatsAppUri(String number) async {
    final link = WhatsAppUnilink(
        phoneNumber: "+62-${number}",
        text: "Halo pak, bagaimana proses pengerjaan rumah saya?");

    await launchUrl(link.asUri());
  }

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
  void decrement() => count.value--;
}
