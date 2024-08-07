import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Obx(
              () => Column(
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
                                    Text(
                                      profileController.user.value.alamat ?? "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
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
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Cari Tukang",
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 10),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0)),
                              ),
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
                              height: 20,
                            ),
                            Text(
                              "Layanan",
                              style: TextStyle(
                                  color: Color(0XFFFFA800),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 55,
                                  height: 55,
                                  child: Image.asset(
                                    "assets/icon/Cat.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.TEGEL);
                                  },
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    child: Image.asset(
                                      "assets/icon/Tegel.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 55,
                                  height: 55,
                                  child: Image.asset(
                                    "assets/icon/Listrik.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  width: 55,
                                  height: 55,
                                  child: Image.asset(
                                    "assets/icon/Bangunan.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 55,
                                  height: 55,
                                  child: Image.asset(
                                    "assets/icon/Kayu.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  width: 55,
                                  height: 55,
                                  child: Image.asset(
                                    "assets/icon/Coming Soon.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  width: 55,
                                  height: 55,
                                  child: Image.asset(
                                    "assets/icon/Coming Soon.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  width: 55,
                                  height: 55,
                                  child: Image.asset(
                                    "assets/icon/Lainnya.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Hasil Proyek",
                              style: TextStyle(
                                  color: Color(0XFFFFA800),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ProjectResultBox(),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rekomendasi",
                                  style: TextStyle(
                                      color: Color(0XFFFFA800),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                      color: Color(0XFFffA800),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BuilderRecommendedBox(),
                            BuilderRecommendedBox(),
                            BuilderRecommendedBox(),
                            BuilderRecommendedBox(),
                            SizedBox(
                              height: 80,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
        ],
      ),
    );
  }
}

class BuilderRecommendedBox extends StatelessWidget {
  const BuilderRecommendedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Color(0XFFC4C4C4))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/image/patt.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  border: Border.all(color: Color(0XFFffA800), width: 2)),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Yanto Naska",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 80,
                  height: 20,
                  child: Center(
                    child: Text(
                      "Tukang Kayu",
                      style: TextStyle(color: Color(0XFFFFA800), fontSize: 10),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFFFFA800), width: 2),
                      borderRadius: BorderRadius.circular(7)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProjectResultBox extends StatelessWidget {
  const ProjectResultBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 140,
      //color: Colors.green,
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 86,
            child: Image.asset(
              "assets/image/rumah.png",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "1.2",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "km  -",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 3,
              ),
              Icon(
                Icons.star,
                color: Color(0XFF0b487d),
                size: 15,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "49",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Rumah Pak edy",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "by: Andika Pratama",
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
