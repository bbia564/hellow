import 'package:get/get.dart';

class HellowSettingLogic extends GetxController {

  int bgColorIndex = 1;
  int titleColorIndex = 1;
  String title = 'Hello World';

  void commit({bool isDefault = false}) {
    Map data = {
      'title': title,
      'titleColorIndex': titleColorIndex,
      'bgColorIndex': bgColorIndex,
    };
    if (isDefault) {
      data['title'] = 'Hello World';
      data['titleColorIndex'] = 1;
      data['bgColorIndex'] = 1;
    } else {
      if (title.isEmpty) {
        Get.snackbar('The title cannot be empty','');
        return;
      }
    }
    Get.back(result: data);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    Map? data = Get.arguments;
    if (data != null) {
      title = data['title'] ?? '';
      titleColorIndex = data['titleColorIndex'] ?? 1;
      bgColorIndex = data['bgColorIndex'] ?? 1;
    }
    update();
    super.onInit();
  }

}
