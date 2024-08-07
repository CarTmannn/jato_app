import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cat_controller.dart';

class CatView extends GetView<CatController> {
  const CatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
