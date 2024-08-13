import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'package:jato/app/routes/app_pages.dart';
import 'package:jato/app/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProfileController profileController = ProfileController();
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final isObsecure = true.obs;
  final user = User(
    id: 0,
    namaLengkap: '',
    username: '',
    email: '',
    tempatLahir: '',
    tanggalLahir: '',
    jenisKelamin: '',
    noHandphone: '',
    nomorIndukKependudukan: '',
    pekerjaan: '',
    alamat: '',
    rt: '',
    rw: '',
    provinsi: '',
    kotaKabupaten: '',
    kecamatan: '',
    kelurahanDesa: '',
    role: '',
    password: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      login();
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse("https://seahorse-app-jep59.ondigitalocean.app/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email.value,
          "password": password.value,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('id') && data['id'] != null) {
          user.value = User.fromJson(data);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('id', user.value.id ?? 0);
          await prefs.setString('nama_lengkap', user.value.namaLengkap ?? "");
          await prefs.setString('username', user.value.username ?? "");
          await prefs.setString('email', user.value.email ?? "");
          await prefs.setString('tempat_lahir', user.value.tempatLahir ?? "");
          await prefs.setString('tanggal_lahir', user.value.tanggalLahir ?? "");
          await prefs.setString('jenis_kelamin', user.value.jenisKelamin ?? "");
          await prefs.setString('no_handphone', user.value.noHandphone ?? "");
          await prefs.setString('nomor_induk_kependudukan',
              user.value.nomorIndukKependudukan ?? "");
          await prefs.setString('pekerjaan', user.value.pekerjaan ?? "");
          await prefs.setString('alamat', user.value.alamat ?? "");
          await prefs.setString('rt', user.value.rt ?? "");
          await prefs.setString('rw', user.value.rw ?? "");
          await prefs.setString('provinsi', user.value.provinsi ?? "");
          await prefs.setString(
              'kota_kabupaten', user.value.kotaKabupaten ?? "");
          await prefs.setString('kecamatan', user.value.kecamatan ?? "");
          await prefs.setString(
              'kelurahan_desa', user.value.kelurahanDesa ?? "");
          await prefs.setString('role', user.value.role ?? "");
          await prefs.setString('password', user.value.password ?? "");
          profileController.onInit();
          (user.value.role == "builder")
              ? Get.offAllNamed(Routes.HOME_BUILDER)
              : Get.offAllNamed(Routes.HOME);
        } else {
          errorMessage.value = 'Invalid email or password';
        }
      } else if (response.statusCode == 401) {
        errorMessage.value = 'Invalid email or password';
      } else {
        final Map<String, dynamic> error = jsonDecode(response.body);
        errorMessage.value = error['message'] ?? 'Login failed';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred';
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
