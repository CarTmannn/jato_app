import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeBuilderController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  var orders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    firebaseFirestore
        .collection('order')
        .where("builderName", isEqualTo: "")
        .snapshots()
        .listen((snapshot) {
      orders.value = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['documentId'] = doc.id;
        return data;
      }).toList();
    });
  }

  Future<void> acceptOrder(
      String builderName, String builderNumber, String doc) async {
    firebaseFirestore
        .collection("order")
        .doc(doc)
        .update({"builderName": builderName, "builderNumber": builderNumber});
  }
}
