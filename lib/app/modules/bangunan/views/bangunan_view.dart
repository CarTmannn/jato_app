import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bangunan_controller.dart';

class BangunanView extends GetView<BangunanController> {
  const BangunanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BangunanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BangunanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
