import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/listrik_controller.dart';

class ListrikView extends GetView<ListrikController> {
  const ListrikView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListrikView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListrikView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
