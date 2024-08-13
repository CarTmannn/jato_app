import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ProgressPageController extends GetxController {
  final count = 0.obs;
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  launchWhatsAppUri(String number) async {
    final link = WhatsAppUnilink(
        phoneNumber: "+62-${number}",
        text: "Halo pak, bagaimana proses pengerjaan rumah saya?");

    await launchUrl(link.asUri());
  }

  Future<void> addProgress(
      int newPercent, String date, String desc, String docId) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection("order").doc(docId);

      DocumentSnapshot docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        print("Document does not exist.");
        return;
      }

      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
      List<dynamic> progressDates = data?["progressDate"] ?? [];
      List<dynamic> progressDescs = data?["progressDesc"] ?? [];
      int currentPercentage = data?["progressPercentage"] ?? 0;

      progressDates.add(date);
      progressDescs.add(desc);

      int updatedPercentage = currentPercentage + newPercent;

      await docRef.update({
        "progressDate": progressDates,
        "progressDesc": progressDescs,
        "progressPercentage": updatedPercentage,
      });

      print("Document successfully updated!");
    } catch (e) {
      print("Failed to update document: $e");
    }
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
