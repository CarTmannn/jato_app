import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jato/app/modules/order_builder/controllers/order_builder_controller.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  ProfileController profileController = Get.put(ProfileController());
  var orders = <Map<String, dynamic>>[].obs;
  var waitingOrders = <Map<String, dynamic>>[].obs;
  final isOn = true.obs;
  Future<String> getEmailFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('nama_lengkap') ?? '';
  }

  Future<void> fetchWaitingOrders(String email) async {
    firebaseFirestore
        .collection('order')
        .where("customerName", isEqualTo: email)
        .where("builderName", isEqualTo: "")
        .snapshots()
        .listen((snapshot) {
      waitingOrders.value = snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    });
  }

  Future<void> fetchProgressOrders(String email) async {
    firebaseFirestore
        .collection('order')
        .where("customerName", isEqualTo: email)
        .where("builderName", isNotEqualTo: "")
        .snapshots()
        .listen((snapshot) {
      orders.value = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['documentId'] = doc.id;
        return data;
      }).toList();
    });
  }

  @override
  void onInit() {
    super.onInit();
    print("OrderController initialized");
    getEmailFromPrefs().then((email) {
      fetchProgressOrders(email);
      fetchWaitingOrders(email);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
