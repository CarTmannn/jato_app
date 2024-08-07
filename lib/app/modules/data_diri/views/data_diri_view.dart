import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/data_diri_controller.dart';

class DataDiriView extends GetView<DataDiriController> {
  DataDiriView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Obx(
            () => Column(
              children: <Widget>[
                Image.asset(
                  "assets/icon/bg.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 55,
                ),
                AccountOwnerCard(
                  fullName: profileController.user.value.namaLengkap,
                  userName: profileController.user.value.username,
                  email: profileController.user.value.email,
                ),
                SizedBox(
                  height: 20,
                ),
                PrivateDataCard(
                  birthDate: profileController.user.value.tanggalLahir,
                  birthPlace: profileController.user.value.tempatLahir,
                  gender: profileController.user.value.jenisKelamin,
                  phoneNumber: profileController.user.value.noHandphone,
                  nik: profileController.user.value.nomorIndukKependudukan,
                  job: profileController.user.value.pekerjaan,
                ),
                SizedBox(
                  height: 20,
                ),
                AddressCard(
                  fullAdress: profileController.user.value.alamat,
                  rt: profileController.user.value.rt,
                  rw: profileController.user.value.rw,
                  province: profileController.user.value.provinsi,
                  city: profileController.user.value.kotaKabupaten,
                  subDistrict: profileController.user.value.kecamatan,
                  kelurahan: profileController.user.value.kelurahanDesa,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Positioned(
            top: 30,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.PROFILE),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          ProfileCard(),
        ],
      ),
    ));
  }
}

class AccountOwnerCard extends StatelessWidget {
  const AccountOwnerCard({
    super.key,
    required this.fullName,
    required this.userName,
    required this.email,
  });

  final fullName;
  final userName;
  final email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 230,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Pemilik Akun",
                style: TextStyle(
                    color: Color(0XFFFFA800),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Nama Lengkap",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                fullName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Username",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Email",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                email,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 3,
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(0, 3))
            ]),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 95),
      child: Container(
        width: double.infinity,
        height: 175,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: 130,
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/image/patt.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0XFFFFA800), width: 1),
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            Positioned(
              top: 105,
              left: 210,
              child: Container(
                width: 35,
                height: 35,
                child: Image.asset("assets/icon/camera.png"),
                decoration: BoxDecoration(
                  color: Color(0XFFFFA800),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0XFFFFA800), width: 1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 3,
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(3, 3))
            ]),
      ),
    );
  }
}

class PrivateDataCard extends StatelessWidget {
  const PrivateDataCard({
    super.key,
    required this.birthDate,
    required this.birthPlace,
    required this.gender,
    required this.phoneNumber,
    required this.nik,
    required this.job,
  });

  final birthDate;
  final birthPlace;
  final gender;
  final phoneNumber;
  final nik;
  final job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 340,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Data Pribadi",
                style: TextStyle(
                    color: Color(0XFFFFA800),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tempat & Tanggal Lahir",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    birthPlace,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    birthDate,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/icon/date.png",
                    fit: BoxFit.cover,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Jelas Kelamin",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                gender,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "No. Handphone",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                phoneNumber,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Nomor Induk Kependudukan",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                nik,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Pekerjaan",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    job,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0XFFFFA800),
                    size: 28,
                  )
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 3,
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(0, 3))
            ]),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.fullAdress,
    required this.rt,
    required this.rw,
    required this.province,
    required this.city,
    required this.subDistrict,
    required this.kelurahan,
  });

  final fullAdress;
  final rt;
  final rw;
  final province;
  final city;
  final subDistrict;
  final kelurahan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 410,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Alamat Domisili",
                style: TextStyle(
                    color: Color(0XFFFFA800),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Alamat",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                fullAdress,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "RT",
                        style: TextStyle(
                            color: Color(0XFF666666),
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        rt,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "RW",
                        style: TextStyle(
                            color: Color(0XFF666666),
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        rw,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Provinsi",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                province,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Kota/Kabupaten",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                city,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Kecamatan",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                subDistrict,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Kelurahan/Desa",
                style: TextStyle(
                    color: Color(0XFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                kelurahan,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 3,
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(0, 3))
            ]),
      ),
    );
  }
}
