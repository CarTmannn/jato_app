import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jato/app/modules/home_builder/controllers/home_builder_controller.dart';
import 'package:jato/app/modules/register/controllers/register_controller.dart';
import 'package:jato/app/modules/register/views/register_view.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/progress_page_controller.dart';

class ProgressPageView extends GetView<ProgressPageController> {
  final order = Get.arguments;
  HomeBuilderController homeBuilderController =
      Get.put(HomeBuilderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFFFFCC00),
          leading: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ORDER_BUILDER);
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
                addProgressButton(
                  controller: controller,
                  doc: order["documentId"],
                )
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Progress",
                              style: TextStyle(
                                  color: Color(0XFFfcb01d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                order["progressPercentage"].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.percent,
                                size: 17,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: order["progressDate"].length,
                      itemBuilder: (context, index) => ProgressBar(
                          dateProgress: order["progressDate"][index],
                          descProgress: order["progressDesc"][index],
                          percentageProgress: order["progressPercentage"]),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
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
                              child: Text(homeBuilderController
                                      .convertIdr(order["minNumber"])
                                      .toString() ??
                                  ""),
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
                              child: Text(homeBuilderController
                                      .convertIdr(order["maxNumber"])
                                      .toString() ??
                                  ""),
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
                  controller.launchWhatsAppUri("85186691109");
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "assets/icon/wa.png",
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Hubungi Customer",
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

class addProgressButton extends StatelessWidget {
  addProgressButton({super.key, required this.controller, required this.doc});

  final ProgressPageController controller;
  UserRegisterView userRegisterView = Get.put(UserRegisterView());
  RegisterController registerController = Get.put(RegisterController());
  TextEditingController judul = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final doc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Obx(
                  () => Form(
                    key: formKey,
                    child: Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: 170,
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 280,
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        "Add  Progress",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.amber),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Peningkatan%:",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: () => controller.decrement(),
                                          child: Icon(Icons.remove)),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Obx(
                                        () => Container(
                                          width: 30,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                                "${controller.count.value}"),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0XFFECECEC),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            controller.increment();
                                            print(controller.count);
                                            print(doc);
                                          },
                                          child: Icon(Icons.add)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Tanggal:",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Bounceable(
                                    onTap: () {
                                      userRegisterView.selectDate(context);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      child: Center(
                                        child: Text(
                                          'Pilih',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.amber),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 25,
                                    child: Center(
                                      child: Text(
                                          registerController.formattedDate),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0XFFECECEC),
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Judul:",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Container(
                                    width: 200,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Keterangan tidak boleh kosong";
                                        }
                                        return null;
                                      },
                                      style: TextStyle(fontSize: 12),
                                      controller: judul,
                                      minLines: 4,
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(5)),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0XFFECECEC),
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Bounceable(
                                onTap: () {
                                  if (formKey.currentState!.validate() ??
                                      false) {
                                    controller.addProgress(
                                        controller.count.value,
                                        registerController.formattedDate,
                                        judul.text,
                                        doc);
                                    print(doc);
                                    print(registerController.formattedDate);
                                  }
                                },
                                child: Container(
                                  width: 250,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        child: Container(
          height: 30,
          width: 100,
          child: Center(
            child: Text(
              "Add Progress",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
              color: Color(0XFFFFCC00),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 3,
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 3))
              ]),
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.descProgress,
    required this.dateProgress,
    required this.percentageProgress,
    super.key,
  });

  final descProgress;
  final dateProgress;
  final percentageProgress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    dateProgress,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Text(
                    "- ${descProgress}",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
