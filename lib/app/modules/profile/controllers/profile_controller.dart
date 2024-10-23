import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jato/app/routes/app_pages.dart';
import 'package:jato/app/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var user = User(
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

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  Future<void> deleteAccount(String email) async {
    CollectionReference orders = FirebaseFirestore.instance.collection('order');

    var response = await http.post(
        Uri.parse("https://seahorse-app-jep59.ondigitalocean.app/delete"),
        body: jsonEncode({"email": email}));

    if (response.statusCode == 200) {
      try {
        QuerySnapshot snapshot =
            await orders.where('userEmail', isEqualTo: user.value.email).get();

        for (var doc in snapshot.docs) {
          await doc.reference.delete();
        }
      } catch (e) {
        print("Error saat menghapus order: $e");
      }
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar("Berhasil menghapus akun",
          "akun yang sudah dihapus tidak bisa digunakan lagi",
          colorText: Colors.black,
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3));
    }
  }

  Future<void> loadUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user.value = User(
      id: prefs.getInt('id') ?? 0,
      namaLengkap: prefs.getString('nama_lengkap') ?? '',
      username: prefs.getString('username') ?? '',
      email: prefs.getString('email') ?? '',
      tempatLahir: prefs.getString('tempat_lahir') ?? '',
      tanggalLahir: prefs.getString('tanggal_lahir') ?? '',
      jenisKelamin: prefs.getString('jenis_kelamin') ?? '',
      noHandphone: prefs.getString('no_handphone') ?? '',
      nomorIndukKependudukan: prefs.getString('nomor_induk_kependudukan') ?? '',
      pekerjaan: prefs.getString('pekerjaan') ?? '',
      alamat: prefs.getString('alamat') ?? '',
      rt: prefs.getString('rt') ?? '',
      rw: prefs.getString('rw') ?? '',
      provinsi: prefs.getString('provinsi') ?? '',
      kotaKabupaten: prefs.getString('kota_kabupaten') ?? '',
      kecamatan: prefs.getString('kecamatan') ?? '',
      kelurahanDesa: prefs.getString('kelurahan_desa') ?? '',
      role: prefs.getString('role') ?? '',
      password: prefs.getString('password') ?? '',
    );
    isLoading.value = false;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    user.value = User(
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
    );
    Get.offAllNamed(Routes.LOGIN);
  }
}
