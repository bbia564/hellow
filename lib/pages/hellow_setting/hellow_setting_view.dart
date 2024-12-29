import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellow_world/main.dart';
import 'package:hellow_world/pages/hellow_setting/hello_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'hellow_setting_logic.dart';

class HellowSettingPage extends GetView<HellowSettingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: GetBuilder<HellowSettingLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              <Widget>[
                const Text(
                  'Background color',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 26,
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: 24 / 28),
                      itemCount: bgColors.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                        ).decorated(
                            color: bgColors[index],
                            border: Border.all(
                                color: controller.bgColorIndex == index
                                    ? Colors.black
                                    : const Color(0xffc6c6c6)),
                            borderRadius: BorderRadius.circular(4)).gestures(onTap: (){
                              controller.bgColorIndex = index;
                              controller.update();
                        });
                      }),
                )
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10,
              ),
              <Widget>[
                const Text(
                  'Text color',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 26,
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: 24 / 28),
                      itemCount: titleColors.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                        ).decorated(
                            color: titleColors[index],
                            border: Border.all(
                                color: controller.titleColorIndex == index
                                    ? Colors.black
                                    : const Color(0xffc6c6c6)),
                            borderRadius: BorderRadius.circular(4)).gestures(onTap: (){
                              controller.titleColorIndex = index;
                              controller.update();
                        });
                      }),
                )
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Input text',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 73,
                child: HelloTextField(
                    value: controller.title,
                    maxLength: 20,
                    onChange: (value) {
                      controller.title = value;
                    }),
              ).decorated(
                  color: const Color(0xfffafafa),
                  border: Border.all(color: const Color(0xffd7d8d9)),
                  borderRadius: BorderRadius.circular(12)),
              const SizedBox(
                height: 10,
              ),
              <Widget>[
                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  child: const Text(
                    'Restore default',
                    style: TextStyle(color: Colors.white),
                  ),
                ).decorated(color: const Color(0xffb9b9b9),borderRadius: BorderRadius.circular(12)).gestures(onTap: (){
                  controller.commit(isDefault: true);
                }),
                const  SizedBox(width: 10,),
                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 49),
                  alignment: Alignment.center,
                  child: const Text(
                    'Verify',
                    style: TextStyle(color: Colors.white),
                  ),
                ).decorated(color: Colors.black,borderRadius: BorderRadius.circular(12)).gestures(onTap: (){
                  controller.commit();
                })
              ].toRow(mainAxisAlignment: MainAxisAlignment.end)
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }),
      )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12))
              .marginAll(15)),
    );
  }
}
