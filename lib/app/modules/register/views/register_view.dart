import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:jato/app/modules/fill_address/controllers/fill_address_controller.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserRegisterView(),
    );
  }
}

class UserRegisterView extends StatelessWidget {
  UserRegisterView({
    super.key,
  });

  RegisterController registerController = Get.put(RegisterController());
  FillAddressController fillAddressController =
      Get.put(FillAddressController());

  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController job = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                width: 160,
                height: 160,
                child: Image.asset(
                  "assets/icon/JATO.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Bounceable(
                      onTap: () {
                        registerController.isUser.value = true;
                        print(registerController.isUser);
                      },
                      child: Container(
                        width: 167,
                        height: 35,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: registerController.isUser.value
                              ? Colors.white
                              : Color(0XFFFFCC00),
                          border:
                              Border.all(color: Color(0XFFFFA800), width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "User",
                            style: TextStyle(
                              color: registerController.isUser.value
                                  ? Color(0XFFFFA800)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Bounceable(
                      onTap: () {
                        registerController.isUser.value = false;
                        print(registerController.isUser);
                      },
                      child: Container(
                        width: 167,
                        height: 35,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: !registerController.isUser.value
                              ? Colors.white
                              : Color(0XFFFFCC00),
                          border:
                              Border.all(color: Color(0XFFFFA800), width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "Builder",
                            style: TextStyle(
                              color: !registerController.isUser.value
                                  ? Color(0XFFFFA800)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Full Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InputText(
                errorText: "Full Name",
                controller: fullName,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "User Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                onChanged: (value) {
                  registerController.isusernameRegistered.value = false;
                },
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your username";
                  }
                  if (registerController.isusernameRegistered.value == true) {
                    return "This username is already registered";
                  }
                  return null;
                },
                controller: userName,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFececec),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                onChanged: (value) {
                  registerController.isEmailRegistered.value = false;
                },
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  if (registerController.isEmailRegistered.value == true) {
                    return "This email is already registered";
                  }
                  return null;
                },
                controller: email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFececec),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => TextFormField(
                  obscureText: registerController.isObsecurePassword.isTrue
                      ? true
                      : false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  controller: password,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        registerController.toggleObsecurePasswrdValue();
                      },
                      icon: Icon(
                        registerController.isObsecurePassword.isTrue
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0XFFececec),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0XFFececec), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0XFFececec), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0XFFececec), width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => TextFormField(
                  obscureText: registerController.isObsecureConfirm.isTrue
                      ? true
                      : false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }

                    if (value != password.text) {
                      return "Password tidak cocok";
                    }
                    return null;
                  },
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        registerController.toggleObsecureValue();
                      },
                      icon: Icon(
                        registerController.isObsecureConfirm.isTrue
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0XFFececec),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0XFFececec), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0XFFececec), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0XFFececec), width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "No Hp",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
                controller: noHp,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFececec),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pekerjaan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InputText(
                errorText: "Job",
                controller: job,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tempat Lahir",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InputText(
                errorText: "Birth Place",
                controller: tempatLahir,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tanggal Lahir",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Bounceable(
                    onTap: () {
                      selectDate(context);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 70,
                        height: 30,
                        child: Center(
                          child: Text(
                            "Pilih",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Obx(() => Text(
                        registerController.formattedDate,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nomor Induk Kependudukan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your NIK";
                  }
                  return null;
                },
                controller: nik,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFececec),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0XFFececec), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "gender",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => ListTile(
                  title: Text('Male'),
                  leading: Radio<String>(
                    value: 'Male',
                    groupValue: registerController.selectedGender.value,
                    activeColor: Colors.amber,
                    onChanged: (value) {
                      registerController.selectGender(value!);
                    },
                  ),
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text('Female'),
                  leading: Radio<String>(
                    value: 'Female',
                    groupValue: registerController.selectedGender.value,
                    activeColor: Colors.amber,
                    onChanged: (value) {
                      registerController.selectGender(value!);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Bounceable(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await registerController.checkEmail(
                          email.text, userName.text);

                      if (registerController.isEmailRegistered.value == false &&
                          registerController.isusernameRegistered.value ==
                              false) {
                        registerController.saveRegisterData(
                          fullName.text,
                          userName.text,
                          email.text,
                          confirmPassword.text,
                          noHp.text,
                          job.text,
                          tempatLahir.text,
                          registerController.formattedDate,
                          nik.text,
                        );
                        Get.toNamed(Routes.FILL_ADDRESS);
                        await fillAddressController.fetchprovinces();
                      } else {
                        print("Email already registered.");
                      }
                      print(
                          "nilai email = ${registerController.isEmailRegistered.value}");
                    } catch (e) {
                      print("Error during form submission: $e");
                    }
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: Center(
                    child: Text(
                      "Next Step",
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
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: registerController.selectedDate.value,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.amber,
            colorScheme: ColorScheme.light(primary: Colors.amber),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(),
            ),
            dividerColor: Colors.amberAccent,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != registerController.selectedDate.value) {
      registerController.updateSelectedDate(picked);
    }
  }
}

class InputText extends StatelessWidget {
  const InputText({
    required this.errorText,
    required this.controller,
    super.key,
  });

  final errorText;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your ${errorText}";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0XFFececec),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0XFFececec), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0XFFececec), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0XFFececec), width: 2),
        ),
      ),
    );
  }
}

class RegisterBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  "assets/icon/JATO.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Pekerjaan",
                style: TextStyle(
                    color: Color(0XFFFFA800),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0XFFFFA800),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFFFA800))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFFFA800)))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 40,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Tukang Kayu",
                            style: TextStyle(),
                          ),
                          Icon(
                            Icons.close,
                            color: Color(0XFFFFA800),
                          )
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFFFFA800), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
            SizedBox(
              height: 305,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  "Finish",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0XFFFFCC00),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0XFFFFA800), width: 1),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 3,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, 3))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
