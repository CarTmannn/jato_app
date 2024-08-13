import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/home_builder/controllers/home_builder_controller.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  OrderView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.put(OrderController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0XFFFFCC00),
          title: Text(
            'Progress',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Bounceable(
                        onTap: () {
                          controller.isOn.value = true;
                          print(controller.isOn);
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          child: Center(
                              child: Text(
                            "On Progress",
                            style: TextStyle(
                                color: controller.isOn.value
                                    ? Color(0XFFffa800)
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              color: controller.isOn.value
                                  ? Colors.white
                                  : Color(0XFFffcc00),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: Offset(0, 2))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0XFFf8be6d), width: 1.5)),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Bounceable(
                        onTap: () {
                          controller.isOn.value = false;
                          print(controller.isOn);
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          child: Center(
                              child: Text(
                            "Waiting",
                            style: TextStyle(
                                color: controller.isOn.value
                                    ? Colors.white
                                    : Color(0XFFffa800),
                                fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              color: controller.isOn.value
                                  ? Color(0XFFffcc00)
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: Offset(0, 2))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0XFFf8be6d), width: 1.5)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Container(
                      width: double.infinity,
                      height: 540,
                      color: Colors.white,
                      child: GestureDetector(
                          onTap: () {},
                          child: controller.isOn.value
                              ? UserProgressBox()
                              : WaitingOrder())),
                ),
              ]),
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
                      GestureDetector(
                        onTap: () =>
                            (profileController.user.value.role == "builder")
                                ? Get.toNamed(Routes.HOME_BUILDER)
                                : Get.toNamed(Routes.HOME),
                        child: Container(
                          width: 32,
                          height: 32,
                          child: Image.asset(
                            "assets/icon/home.png",
                            fit: BoxFit.cover,
                          ),
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
                        onTap: () => Get.toNamed(Routes.ORDER),
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
        ]));
  }
}

class WaitingOrder extends StatelessWidget {
  WaitingOrder({
    super.key,
  });

  OrderController orderController = Get.put(OrderController());
  HomeBuilderController homeBuilderController =
      Get.put(HomeBuilderController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (orderController.waitingOrders.isEmpty)
          ? SizedBox()
          : ListView.builder(
              itemCount: orderController.waitingOrders.length,
              itemBuilder: (context, index) {
                var order = orderController.waitingOrders[index];
                return Container(
                  width: double.infinity,
                  height: 130,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                order["type"] ?? "",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    homeBuilderController
                                            .convertIdr(order["minNumber"])
                                            .toString() ??
                                        "",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    homeBuilderController
                                            .convertIdr(order["maxNumber"])
                                            .toString() ??
                                        "",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Menunggu Tukang",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Bounceable(
                              onTap: () {
                                Get.toNamed(Routes.ORDER_DETAIL,
                                    arguments: order);
                              },
                              child: Container(
                                height: 35,
                                width: 70,
                                child: Center(
                                  child: Text(
                                    "Bayar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0XFFffcc00),
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Color(0XFFffa800))),
                              ),
                            ),
                          )
                        ],
                      )),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.5, color: Color(0XFFFFA800))),
                );
              }),
    );
  }
}

class UserProgressBox extends StatelessWidget {
  UserProgressBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.put(OrderController());
    return Obx(() {
      if (orderController.orders.isEmpty) {
        return SizedBox();
      }
      return ListView.builder(
        itemCount: orderController.orders.length,
        itemBuilder: (context, index) {
          var order = orderController.orders[index];
          var documentId = order["documentId"];
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.USER_PROGRESS_PAGE, arguments: order);
            },
            child: Container(
              width: double.infinity,
              height: 85,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Rumah ${order["customerName"]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Made By:",
                              style: TextStyle(
                                  color: Color(0XFFFFA800),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              order["builderName"] ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Progress:",
                              style: TextStyle(
                                  color: Color(0XFFFFA800),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              order["progressPercentage"].toString() ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Icon(
                              Icons.percent,
                              color: Colors.black,
                              size: 15,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0XFFFFA800), width: 1)),
            ),
          );
        },
      );
    });
  }
}
