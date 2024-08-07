import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:jato/app/modules/register/controllers/register_controller.dart';
import 'package:jato/app/modules/register/views/register_view.dart';
import 'package:jato/app/routes/app_pages.dart';

import '../controllers/fill_address_controller.dart';

class FillAddressView extends GetView<FillAddressController> {
  FillAddressView({Key? key}) : super(key: key);
  TextEditingController address = TextEditingController();
  TextEditingController rt = TextEditingController();
  TextEditingController rw = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80),
                Center(
                  child: Container(
                    child: Image.asset(
                      "assets/icon/JATO.png",
                      fit: BoxFit.cover,
                    ),
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Alamat Lengkap",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                InputText(
                  errorText: "Full Adress",
                  controller: address,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "RT",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Color(0XFFececec),
                            child: Center(
                              child: Container(
                                  height: 35,
                                  width: 35,
                                  color: Color(0XFFececec),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: rt,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please insert rt";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "RW",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Color(0XFFececec),
                            child: Center(
                              child: Container(
                                  height: 35,
                                  width: 35,
                                  color: Color(0XFFececec),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: rw,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please insert rw";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Provinsi",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Obx(
                  () => Container(
                    width: double.infinity,
                    height: 50,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: controller.provinces.map((province) {
                        return DropdownMenuItem<String>(
                          value: province['id'],
                          child: Text(
                            province['text'],
                          ),
                        );
                      }).toList(),
                      value: controller.selectedProvinceId.value.isEmpty
                          ? null
                          : controller.selectedProvinceId.value,
                      onChanged: (String? newValue) {
                        if (newValue is String) {
                          var selectedText = controller.provinces.firstWhere(
                              (province) => province["id"] == newValue)["text"];
                          controller.selectProvince(newValue, selectedText);
                        }
                      },
                      hint: Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Text(
                          "Pilih Provinsi",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Kota",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Obx(
                  () => Container(
                    width: double.infinity,
                    height: 50,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: controller.cities.map((city) {
                        return DropdownMenuItem<String>(
                            value: city["id"], child: Text(city["text"]));
                      }).toList(),
                      value: controller.selectedCityId.value.isEmpty
                          ? null
                          : controller.selectedCityId.value,
                      onChanged: (String? newValue) {
                        if (newValue is String) {
                          var selectedText = controller.cities.firstWhere(
                              (city) => city["id"] == newValue)["text"];
                          controller.selectCities(newValue, selectedText);
                        }
                      },
                      hint: Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Text(
                          "Pilih Kota",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Kecamatan",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Obx(
                  () => Container(
                    width: double.infinity,
                    height: 50,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: controller.subDistricts.map((subDistrict) {
                        return DropdownMenuItem<String>(
                            value: subDistrict["id"],
                            child: Text(subDistrict["text"]));
                      }).toList(),
                      value: controller.selectedSubDistrictId.value.isEmpty
                          ? null
                          : controller.selectedSubDistrictId.value,
                      onChanged: (String? newValue) {
                        if (newValue is String) {
                          var selectedText = controller.subDistricts.firstWhere(
                              (subDistrict) =>
                                  subDistrict["id"] == newValue)["text"];
                          controller.selectsubDistrict(newValue, selectedText);
                        }
                      },
                      hint: Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Text(
                          "Pilih Kecamatan",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Kelurahan",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Obx(
                  () => Container(
                    width: double.infinity,
                    height: 50,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedKelurahan.value.isEmpty
                          ? null
                          : controller.selectedKelurahan.value,
                      items: controller.kelurahan.map((kelurahan) {
                        return DropdownMenuItem<String>(
                            value: kelurahan["id"],
                            child: Text(kelurahan["text"]));
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue is String) {
                          var selectedText = controller.kelurahan
                              .firstWhere((e) => e["id"] == newValue)["text"];
                          controller.selectKelurahan(newValue, selectedText);
                        }
                      },
                      hint: Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Text(
                          "Pilih Kelurahan",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Bounceable(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      controller.register(
                          registerController.tempFullName.value,
                          registerController.tempuserName.value,
                          registerController.tempEmail.value,
                          registerController.tempPassword.value,
                          registerController.tempTempatLahir.value,
                          registerController.formattedDate,
                          registerController.selectedGender.value,
                          registerController.tempNoHp.value,
                          registerController.tempNIK.value,
                          registerController.tempPekerjaan.value,
                          address.text,
                          rt.text,
                          rw.text,
                          controller.selectedProvinceText.value,
                          controller.selectedCityText.value,
                          controller.selectedSubDistrictText.value,
                          controller.selectedKelurahanText.value,
                          registerController.isUser.isTrue
                              ? "user"
                              : "builder");
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: Center(
                      child: Text(
                        "Daftar",
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
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
