import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset("assets/icon/JATO.png"),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "EMAIL / NO. HP",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      if (newValue != null) {
                        controller.email.value = newValue;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0XFFececec),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(
                    () => TextFormField(
                      onSaved: (newValue) {
                        if (newValue != null) {
                          controller.password.value = newValue;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter your password";
                        }
                        return null;
                      },
                      obscureText: controller.isObsecure.isTrue ? true : false,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.isObsecure.value =
                                    !controller.isObsecure.value;
                              },
                              icon: Icon(controller.isObsecure.isTrue
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          filled: true,
                          fillColor: Color(0XFFececec),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => controller.errorMessage.value.isNotEmpty
                          ? Text(
                              controller.errorMessage.value,
                              style: TextStyle(color: Colors.red[900]),
                            )
                          : SizedBox()),
                      Text(
                        "Lupa Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0XFFFFCC00)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Bounceable(
                    onTap: () {
                      controller.submitForm();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0XFFFFCC00),
                          border: Border.all(
                            color: Color(0XFFFFA800),
                            width: 1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 153,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Or",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        width: 153,
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  Bounceable(
                    onTap: () => Get.snackbar(
                        "Oopss..", "Belum tersedia untuk saat ini",
                        backgroundColor: Colors.yellow),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Image.asset("assets/icon/Google.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Log In With Google",
                                style: TextStyle(
                                    color: Color(0XFF757575),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1)),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Belum Punya Akun?",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.REGISTER),
                          child: Text(
                            "Daftar Sekarang",
                            style: TextStyle(
                                color: Color(0XFFFFA800),
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0XFFFFA800),
                                decorationThickness: 1),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
