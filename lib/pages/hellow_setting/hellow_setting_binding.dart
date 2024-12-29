import 'package:get/get.dart';

import 'hellow_setting_logic.dart';

class HellowSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HellowSettingLogic());
  }
}
