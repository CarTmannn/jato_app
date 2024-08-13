import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:jato/app/modules/register/controllers/register_controller.dart';
import 'package:jato/app/modules/register/views/register_view.dart';
import 'package:jato/app/modules/tegel/controllers/tegel_controller.dart';
import 'package:jato/app/modules/tegel/views/tegel_view.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/listrik_controller.dart';

class ListrikView extends GetView<ListrikController> {
  ListrikView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());
  UserRegisterView userRegisterView = Get.put(UserRegisterView());
  RegisterController registerController = Get.put(RegisterController());
  TegelController tegelController = Get.put(TegelController());

  TextEditingController desc = TextEditingController();
  TextEditingController min = TextEditingController();
  TextEditingController max = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Membuat Pesanan',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0XFFffcc00),
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
        body: FillOrder(
            desc: desc,
            userRegisterView: userRegisterView,
            registerController: registerController,
            profileController: profileController,
            min: min,
            max: max,
            controller: tegelController,
            type: "Listrik"));
  }
}
