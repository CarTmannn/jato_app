import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  ProfileController profileController = ProfileController();
  var orders = <Map<String, dynamic>>[].obs;

  Future<String> getNamaLengkapFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('nama_lengkap') ?? '';
  }

  Future<void> fetchProgressOrders(String name) async {
    firebaseFirestore
        .collection('order')
        .where("customerName", isEqualTo: name)
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
    getNamaLengkapFromPrefs().then((namaLengkap) {
      print("User name from SharedPreferences: $namaLengkap");
      fetchProgressOrders(namaLengkap);
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
