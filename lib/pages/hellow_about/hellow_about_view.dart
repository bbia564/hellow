import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'hellow_about_logic.dart';

class HellowAboutPage extends GetView<HellowAboutLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = [
      'Privacy agreement',
      'About US'
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 0 ? const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        ) : const Text('1.0.0').paddingOnly(right: 10)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.aboutHelloPrivacy(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context)
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
