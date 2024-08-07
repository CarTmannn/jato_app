import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/home_builder_controller.dart';

class HomeBuilderView extends GetView<HomeBuilderController> {
  HomeBuilderView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/icon/bg.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Lokasi Kamu",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: <Widget>[
                                  Obx(
                                    () => Text(
                                      profileController.user.value.alamat ?? "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.chat_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: double.infinity,
                                height: 130,
                                child: Image.asset(
                                  "assets/image/1.png",
                                  fit: BoxFit.cover,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Tawaran pekerjaan",
                            style: TextStyle(
                                color: Color(0XFFFFA800),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                              width: double.infinity,
                              height: 450,
                              child: OfferBox()),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        child: Image.asset(
                          "assets/icon/home.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Beranda",
                        style: TextStyle(color: Color(0XFFFFA800)),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.ORDER_BUILDER),
                        child: Container(
                          width: 32,
                          height: 32,
                          child: Image.asset(
                            "assets/icon/pesanan.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Pesanan",
                        style: TextStyle(color: Color(0XFFFFA800)),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.PROFILE),
                        child: Container(
                          width: 32,
                          height: 32,
                          child: Image.asset(
                            "assets/icon/profile.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(color: Color(0XFFFFA800)),
                      )
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0XFFFFA800), width: 1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 5,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(6, 6))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class OfferBox extends StatelessWidget {
  OfferBox({super.key});
  HomeBuilderController homeBuilderController =
      Get.put(HomeBuilderController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeBuilderController.orders.isEmpty) {
        return SizedBox();
      }
      return ListView.builder(
          itemCount: homeBuilderController.orders.length,
          itemBuilder: (context, index) {
            var order = homeBuilderController.orders[index];
            var documentId = order["documentId"];
            return Column(children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        order["type"] ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(order["descJob"] ?? ""),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Perkiraan Biaya",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 40,
                            color: Color(0XFFf8f4f4),
                            child: Center(
                                child: Text(
                              order["minNumber"].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            child: Center(
                                child: Text(
                              order["maxNumber"].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )),
                            color: Color(0XFFf8f4f4),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Customer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        height: 40,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            child: Text(
                              order["customerName"] ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )),
                        color: Color(0XFFf8f4f4),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Alamat",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            child: Text(
                              order["address"] ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )),
                        color: Color(0XFFf8f4f4),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            child: Text(
                              order["city"] ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )),
                        color: Color(0XFFf8f4f4),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Bounceable(
                        onTap: () {
                          homeBuilderController.acceptOrder(
                              profileController.user.value.namaLengkap ?? "",
                              profileController.user.value.noHandphone ?? "",
                              documentId);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 80,
                              height: 40,
                              child: Center(
                                  child: Text(
                                "Terima",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                              decoration: BoxDecoration(
                                  color: Color(0XFFffcc00),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color(0XFFffa800), width: 2)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0XFFffa800),
                      width: 2,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
            ]);
          });
    });
  }
}
