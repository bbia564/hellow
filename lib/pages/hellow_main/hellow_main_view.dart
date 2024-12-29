import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellow_world/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'hellow_main_logic.dart';

class HellowMainPage extends GetView<HellowMainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: null,
        actions: [
          const Icon(
            Icons.info_rounded,
            size: 35,
            color: Color(0xff8b8b8b),
          ).gestures(onTap: () {
            Get.toNamed('/helloAbout');
          }),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.settings_rounded,
            size: 35,
            color: Color(0xff8b8b8b),
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/helloSetting',arguments: {
              'title': controller.title,
              'titleColorIndex': controller.titleColorIndex,
              'bgColorIndex': controller.bgColorIndex,
            })?.then((value) {
              if (value != null) {
                controller.title = value['title'];
                controller.titleColorIndex = value['titleColorIndex'];
                controller.bgColorIndex = value['bgColorIndex'];
                controller.update();
              }
            });
          })
        ],
      ),
      body: GetBuilder<HellowMainLogic>(builder: (_) {
        return Obx(() {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
                child: <Widget>[
                  Expanded(
                      child: <Widget>[
                        Text(
                          controller.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 83,
                              fontWeight: FontWeight.bold,
                              color: titleColors[controller.titleColorIndex]),
                        )
                      ].toColumn(mainAxisAlignment: MainAxisAlignment.center)),
                  Obx(() {
                    return SizedBox(
                      width: 200,
                      child: Slider(
                          value: controller.progress.value,
                          min: 0,
                          max: 100,
                          activeColor: const Color(0xff919191),
                          inactiveColor: Colors.white.withOpacity(0.43),
                          onChanged: (value) {
                            controller.progress.value = value;
                          }),
                    );
                  })
                ].toColumn(mainAxisAlignment: MainAxisAlignment.spaceBetween)),
          ).decorated(
              color: bgColors[controller.bgColorIndex].withOpacity((controller.progress.value) / 100.0));
        });
      }),
    );
  }
}
