import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TegelController extends GetxController {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<void> makeOrder(
      String desc,
      String date,
      String fullAddress,
      String city,
      int min,
      int max,
      String customerName,
      String customerNumber,
      Map<String, dynamic> progress,
      String type,
      String builderName,
      String builderNumber) async {
    try {
      await firebase.collection("order").add({
        "address": fullAddress,
        "builderName": builderName,
        "builderNumber": builderName,
        "city": city,
        "customerName": customerName,
        "customerNumber": customerNumber,
        "descJob": desc,
        "maxNumber": max,
        "minNumber": min,
        "progress": progress,
        "type": type,
        "workingDate": date
      });
    } catch (e) {
      print(e);
    }
  }

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
}
