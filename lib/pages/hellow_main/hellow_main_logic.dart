
import 'package:get/get.dart';

class HellowMainLogic extends GetxController {

  int bgColorIndex = 1;
  int titleColorIndex = 1;
  String title = 'Hello World';
  var progress = 50.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    super.onInit();
  }


}
