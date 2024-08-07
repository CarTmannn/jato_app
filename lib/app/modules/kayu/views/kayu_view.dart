import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kayu_controller.dart';

class KayuView extends GetView<KayuController> {
  const KayuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KayuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KayuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
