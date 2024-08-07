import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/order/views/order_view.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/order_builder_controller.dart';

class OrderBuilderView extends GetView<OrderBuilderController> {
  OrderBuilderView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                    width: double.infinity,
                    height: 900,
                    color: Colors.white,
                    child: GestureDetector(
                        onTap: () {}, child: BuilderProgressBox())),
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

class BuilderProgressBox extends StatelessWidget {
  BuilderProgressBox({
    super.key,
  });

  OrderBuilderController orderBuilderController =
      Get.put(OrderBuilderController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (orderBuilderController.orders.isEmpty) {
        return SizedBox();
      }
      return ListView.builder(
        itemCount: orderBuilderController.orders.length,
        itemBuilder: (context, index) {
          var order = orderBuilderController.orders[index];
          var documentId = order["documentId"];
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PROGRESS_PAGE, arguments: order);
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
                              "0",
                              style: TextStyle(
                                  color: Color(0XFFCE0000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Icon(
                              Icons.percent,
                              color: Color(0XFFCE0000),
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
