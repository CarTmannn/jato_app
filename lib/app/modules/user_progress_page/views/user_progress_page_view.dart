import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:jato/app/modules/progress_page/controllers/progress_page_controller.dart';
import 'package:jato/app/modules/progress_page/views/progress_page_view.dart';
import 'package:jato/app/modules/register/controllers/register_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/user_progress_page_controller.dart';

class UserProgressPageView extends GetView<UserProgressPageController> {
  UserProgressPageView({Key? key}) : super(key: key);
  final ProgressPageController progressPageController =
      Get.put(ProgressPageController());
  final order = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFFFFCC00),
          leading: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ORDER);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Progress',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 195,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 3,
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 3))
              ]),
              child: Image.asset(
                "assets/image/rumah1.png",
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Made By:",
                        style: TextStyle(
                            color: Color(0XFFFFA800),
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          order["builderName"] ?? "",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 3,
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 3))
                ]),
                child: ProgressBar(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        order["descJob"] ?? "",
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Alamat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        order["address"] ?? "",
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        order["city"] ?? "",
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Customer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        order["customerName"] ?? "",
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Penawaran",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Center(
                              child: Text(order["minNumber"].toString() ?? ""),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "-",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Center(
                              child: Text(order["maxNumber"].toString() ?? ""),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 3,
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 3))
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Bounceable(
                onTap: () {
                  progressPageController.launchWhatsAppUri(
                      order["builderNumber"].toString().substring(1));
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/icon/wa.png",
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Hubungi Tukang",
                            style: TextStyle(
                                color: Color(0XFF4ac45c),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 3,
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(2, 3))
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        )));
  }
}
