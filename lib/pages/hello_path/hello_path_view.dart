import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hello_path_logic.dart';

class HelloPathView extends GetView<PageLogic> {
  const HelloPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.konopelski.value
              ? const CircularProgressIndicator(color: Colors.greenAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.hlobmgxk();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
