import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/home_builder/controllers/home_builder_controller.dart';
import 'package:jato/app/modules/progress_page/controllers/progress_page_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  OrderDetailView({Key? key}) : super(key: key);
  ProgressPageController progressPageController =
      Get.put(ProgressPageController());
  HomeBuilderController homeBuilderController =
      Get.put(HomeBuilderController());
  final order = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.toNamed(Routes.HOME);
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Detail Orderan',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            backgroundColor: Color(0XFFf3c301),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 120,
                            color: Color(0xFFf3c301),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(2, 3))
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pesanan Berhasil",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 345,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.amber.withOpacity(0.5),
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(0, 2))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            order["type"] ?? "",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 21),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            order["descJob"] ?? "",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Alamat",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            order["address"] ?? "",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            order["city"] ?? "",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Tanggal Pengerjaan",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            order["workingDate"] ?? "",
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Penawaran",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                homeBuilderController
                                        .convertIdr(order["minNumber"])
                                        .toString() ??
                                    "",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                homeBuilderController
                                        .convertIdr(order["maxNumber"])
                                        .toString() ??
                                    "",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Status",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "menunggu tukang menerima orderan",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Silahkan hubungi admin untuk pembayaran")),
                  SizedBox(
                    height: 10,
                  ),
                  Bounceable(
                    onTap: () {
                      progressPageController.launchWhatsAppUri("085186691109");
                    },
                    child: Container(
                      width: 345,
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
                                "Admin",
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
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
