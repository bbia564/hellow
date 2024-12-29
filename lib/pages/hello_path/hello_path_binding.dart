import 'package:get/get.dart';

import 'hello_path_logic.dart';

class TabBescBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
