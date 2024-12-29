import 'package:get/get.dart';

import 'hellow_about_logic.dart';

class HellowAboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HellowAboutLogic());
  }
}
