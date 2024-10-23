import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/home/controllers/home_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/icon/bg.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                    onTap: () => Get.toNamed(Routes.DATA_DIRI),
                    child: Obx(
                      () => Card(
                        fullName: controller.user.value.namaLengkap,
                        nik: controller.user.value.nomorIndukKependudukan,
                      ),
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Klik Kartu Untuk Melihat data Diri",
                  style: TextStyle(
                      color: Color(0XFFFFA800),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Pengaturan Akun",
                    style: TextStyle(
                        color: Color(0XFFFFA800),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SettingButton(
                  icon: "assets/icon/Kunci.png",
                  text: "Ubah Password",
                  color: Colors.black,
                ),
                SettingButton(
                  icon: "assets/icon/Asterisk.png",
                  text: "Atur Pin",
                  color: Colors.black,
                ),
                Bounceable(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              height: 120,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "Apakah anda yakin ingin mengahapus akun?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Bounceable(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 45,
                                            child: Center(
                                              child: Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Bounceable(
                                          onTap: () {
                                            controller.deleteAccount(
                                                controller.user.value.email!);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 45,
                                            child: Center(
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        });
                  },
                  child: SettingButton(
                    icon: "assets/icon/Hapus.png",
                    text: "Hapus Akun",
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Tentang",
                    style: TextStyle(
                        color: Color(0XFFFFA800),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SettingButton(
                  icon: "assets/icon/Info.png",
                  text: "Tentang Aplikasi Jato",
                  color: Colors.black,
                ),
                SettingButton(
                  icon: "assets/icon/Bendera.png",
                  text: "Syarat Dan Ketentuan",
                  color: Colors.black,
                ),
                SettingButton(
                  icon: "assets/icon/Perisai.png",
                  text: "Kebijakan Privasi",
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    controller.logout();
                  },
                  child: SettingButton(
                    icon: "assets/icon/Out.png",
                    text: "Keluar",
                    color: Color(0XFFFF0000),
                  ),
                )
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
                      GestureDetector(
                        onTap: () => (controller.user.value.role == "builder")
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
                        onTap: () => (controller.user.value.role == "builder")
                            ? Get.toNamed(Routes.ORDER_BUILDER)
                            : Get.toNamed(Routes.ORDER),
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

class Card extends StatelessWidget {
  const Card({super.key, required this.fullName, required this.nik});

  final fullName;
  final nik;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 185,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                fullName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                nik,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              )
            ],
          ),
          Container(
            width: 140,
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.asset(
                "assets/image/pprofile.png",
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFFFFA800), width: 2),
              borderRadius: BorderRadius.circular(70),
              color: Color(0XFFcccccc),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Color(0XFFFFA800), width: 2),
          boxShadow: [
            BoxShadow(
                spreadRadius: 3,
                blurRadius: 3,
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 3))
          ]),
    );
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton(
      {super.key, required this.icon, required this.text, required this.color});

  final icon;
  final text;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(icon, fit: BoxFit.cover),
              SizedBox(
                width: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: TextStyle(
                      color: color, fontSize: 18, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: color,
          )
        ],
      ),
    );
  }
}
