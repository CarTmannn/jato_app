import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jato/app/routes/app_pages.dart';

class FillAddressController extends GetxController {
  final provinces = <Map<String, dynamic>>[].obs;
  final cities = <Map<String, dynamic>>[].obs;
  final subDistricts = <Map<String, dynamic>>[].obs;
  final kelurahan = <Map<String, dynamic>>[].obs;

  var selectedProvinceId = ''.obs;
  var selectedCityId = ''.obs;
  var selectedSubDistrictId = ''.obs;
  var selectedKelurahan = ''.obs;

  var selectedProvinceText = "".obs;
  var selectedCityText = "".obs;
  var selectedSubDistrictText = "".obs;
  var selectedKelurahanText = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> register(
      String fullname,
      String username,
      String email,
      String password,
      String tempat_lahir,
      String tanggal_lahir,
      String jenis_kelamin,
      String no_handphone,
      String nik,
      String pekerjaan,
      String alamat,
      String rt,
      String rw,
      String provinsi,
      String kota,
      String kecamatan,
      String kelurahan,
      String role) async {
    var response = await http.post(
        Uri.parse("https://seahorse-app-jep59.ondigitalocean.app/register"),
        body: jsonEncode({
          "nama_lengkap": fullname,
          "username": username,
          "email": email,
          "password": password,
          "tempat_lahir": tempat_lahir,
          "tanggal_lahir": tanggal_lahir,
          "jenis_kelamin": jenis_kelamin,
          "no_handphone": no_handphone,
          "nomor_induk_kependudukan": nik,
          "pekerjaan": pekerjaan,
          "alamat": alamat,
          "rt": rt,
          "rw": rw,
          "provinsi": provinsi,
          "kota_kabupaten": kota,
          "kecamatan": kecamatan,
          "kelurahan_desa": kelurahan,
          "role": role
        }));
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar("Success", "Successfully registrated, please login",
          backgroundColor: Color(0XFF7ecf2b),
          colorText: Colors.black,
          duration: Duration(seconds: 2));
    }
  }

  Future<void> fetchprovinces() async {
    try {
      var response = await http
          .get(Uri.parse("https://alamat.thecloudalert.com/api/provinsi/get/"));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        provinces.value =
            List<Map<String, dynamic>>.from(jsonResponse['result']);
        print(provinces.value);
        Get.toNamed(Routes.FILL_ADDRESS);
      } else {
        print("Failed to fetch provinsi: ${response.statusCode}");
        throw Exception("Failed to fetch provinsi");
      }
    } catch (e) {
      print("Error fetching provinces: $e");
    }
  }

  Future<void> fetchCities(String provincesId) async {
    var response = await http.get(Uri.parse(
        "https://alamat.thecloudalert.com/api/kabkota/get/?d_provinsi_id=${provincesId}"));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      cities.value = List<Map<String, dynamic>>.from(jsonResponse['result']);
      selectedCityId.value = '';
      selectedSubDistrictId.value = '';
      selectedKelurahan.value = "";
    } else {
      throw Exception("Failed to fetch kota");
    }
  }

  Future<void> fetchsubDistrict(String citiesId) async {
    var response = await http.get(Uri.parse(
        "https://alamat.thecloudalert.com/api/kecamatan/get/?d_kabkota_id=${citiesId}"));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      subDistricts.value =
          List<Map<String, dynamic>>.from(jsonResponse['result']);
      selectedSubDistrictId.value = '';
      selectedKelurahan.value = "";
      print(provinces.value);
    } else {
      throw Exception("Failed to fetch kecamatan");
    }
  }

  Future<void> fetchKelurahan(String subDistrictId) async {
    var response = await http.get(Uri.parse(
        "https://alamat.thecloudalert.com/api/kelurahan/get/?d_kecamatan_id=${subDistrictId}"));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      kelurahan.value = List<Map<String, dynamic>>.from(jsonResponse['result']);
      selectedKelurahan.value = "";
      print('Kelurahan: ${kelurahan.value}');
    } else {
      throw Exception("Failed to fetch kelurahan");
    }
  }

  void selectProvince(String id, String text) async {
    selectedProvinceId.value = id;
    selectedProvinceText.value = text;
    print(selectedProvinceText);
    await fetchCities(id);
  }

  void selectCities(String id, String text) async {
    selectedCityId.value = id;
    selectedCityText.value = text;
    print(selectedCityText);
    await fetchsubDistrict(id);
  }

  void selectsubDistrict(String id, String text) async {
    selectedSubDistrictId.value = id;
    selectedSubDistrictText.value = text;
    print(selectedSubDistrictText);
    await fetchKelurahan(id);
  }

  void selectKelurahan(String id, String text) async {
    selectedKelurahan.value = id;
    selectedKelurahanText.value = text;
    print(selectedKelurahanText);
  }
}
