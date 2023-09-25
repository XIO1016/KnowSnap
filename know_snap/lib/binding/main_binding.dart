import 'package:get/get.dart';
import 'package:know_snap/controller/login/login_button_controller.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(LoginButtonController(),permanent: true);
  }

}