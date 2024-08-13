import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jato/app/routes/app_pages.dart';

class TegelController extends GetxController {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<void> makeOrder(
      String desc,
      String date,
      String fullAddress,
      String city,
      int min,
      int max,
      String userEmail,
      String customerName,
      String customerNumber,
      List<dynamic> progressDate,
      List<dynamic> progressDesc,
      int progressPercentage,
      String type,
      String builderEmail,
      String builderName,
      String builderNumber) async {
    try {
      await firebase.collection("order").add({
        "address": fullAddress,
        "builderEmail": builderEmail,
        "builderName": builderName,
        "builderNumber": builderName,
        "city": city,
        "userEmail": userEmail,
        "customerName": customerName,
        "customerNumber": customerNumber,
        "descJob": desc,
        "maxNumber": max,
        "minNumber": min,
        "progressDate": progressDate,
        "progressDesc": progressDesc,
        "progressPercentage": progressPercentage,
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
