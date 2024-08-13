import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jato/app/modules/order/controllers/order_controller.dart';
import 'package:jato/app/modules/order_builder/controllers/order_builder_controller.dart';
import 'package:jato/app/modules/profile/controllers/profile_controller.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  int? userId = prefs.getInt("id");
  String? role = prefs.getString("role");

  String initialRoute;
  if (userId == null) {
    initialRoute = Routes.LOGIN;
  } else {
    if (role == "user") {
      initialRoute = Routes.HOME;
    } else if (role == "builder") {
      initialRoute = Routes.HOME_BUILDER;
    } else {
      initialRoute = Routes.LOGIN;
    }
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.amber,
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          labelStyle: TextStyle(color: Colors.amber),
        ),
      ),
    ),
  );
}
