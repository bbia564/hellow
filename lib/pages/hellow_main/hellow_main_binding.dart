import 'package:get/get.dart';

import 'hellow_main_logic.dart';

class HellowMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HellowMainLogic());
  }
}
