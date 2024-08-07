import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:jato/app/modules/register/controllers/register_controller.dart';
import 'package:jato/app/modules/register/views/register_view.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/tegel_controller.dart';

class TegelView extends GetView<TegelController> {
  TegelView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());
  UserRegisterView userRegisterView = Get.put(UserRegisterView());
  RegisterController registerController = Get.put(RegisterController());

  TextEditingController desc = TextEditingController();
  TextEditingController min = TextEditingController();
  TextEditingController max = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFf3f3f3),
        appBar: AppBar(
          backgroundColor: Color(0XFFffcc00),
          title: Text(
            'Membuat Pesanann',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.HOME);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Deskripsi Masalah",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                height: 135,
                                decoration: BoxDecoration(
                                    color: Color(0XFFf3f3f3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  minLines: 5,
                                  maxLines: 5,
                                  controller: desc,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Note: Material disediakan oleh customer sendiri",
                        style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Pilih tanggal pengerjaan",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.date_range_rounded)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Bounceable(
                            onTap: () {
                              userRegisterView.selectDate(context);
                            },
                            child: Obx(
                              () => Container(
                                width: 100,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    registerController.formattedDate,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.amber,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                          offset: Offset(1, 1))
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Alamat",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.house_outlined)
                              ],
                            ),
                            Text(
                              "Alamat Lengkap",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              height: 35,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 5, top: 7, right: 5),
                                child: Text(
                                    profileController.user.value.alamat ?? ""),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0XFFf3f3f3),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Provinsi",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 160,
                                      height: 35,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, top: 7, right: 5),
                                        child: Text(profileController
                                                .user.value.provinsi ??
                                            ""),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFf3f3f3),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Kecamatan",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 160,
                                      height: 35,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, top: 7, right: 5),
                                        child: Text(profileController
                                                .user.value.kecamatan ??
                                            ""),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFf3f3f3),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kota/Kabupaten",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 160,
                                      height: 35,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, top: 7, right: 5),
                                        child: Text(profileController
                                                .user.value.kotaKabupaten ??
                                            ""),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFf3f3f3),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Kelurahan",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 160,
                                      height: 35,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5, top: 7, right: 5),
                                        child: Text(profileController
                                                .user.value.kelurahanDesa ??
                                            ""),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0XFFf3f3f3),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 170,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Penawaran",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Berapa biaya yang anda tawarkan kepada tukang?"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: [
                                  Text(
                                    "Min",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 50,
                                    color: Color(0Xfff3f3f3),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 2),
                                        child: TextField(
                                          controller: min,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Max",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 50,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 2),
                                        child: TextField(
                                          controller: max,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    color: Color(0Xfff3f3f3),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
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
                color: Colors.white,
                child: Stack(children: [
                  Positioned(
                    right: 20,
                    top: 10,
                    child: Bounceable(
                      onTap: () async {
                        String minText = min.text;
                        int minValue = int.parse(minText);
                        String maxText = max.text;
                        int maxValue = int.parse(maxText);
                        await controller.makeOrder(
                            desc.text,
                            registerController.formattedDate,
                            profileController.user.value.alamat ?? "",
                            profileController.user.value.kotaKabupaten ?? "",
                            minValue,
                            maxValue,
                            profileController.user.value.namaLengkap ?? "",
                            profileController.user.value.noHandphone ?? "",
                            {},
                            "Tegel",
                            "",
                            "");
                        await Get.snackbar("success",
                            "Berhasil membuat pesanan, mohon menunggu tukang mengambil tawaran kamu",
                            colorText: Colors.black,
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.green);
                        await Get.toNamed(Routes.HOME);
                      },
                      child: Container(
                        height: 50,
                        width: 90,
                        child: Center(
                          child: Text(
                            "Order",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0XFFffcc00),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 2))
                            ],
                            border:
                                Border.all(color: Color(0XFfffa800), width: 2)),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
