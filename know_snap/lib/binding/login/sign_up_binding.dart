import 'package:get/get.dart';
import 'package:know_snap/controller/login/login_button_controller.dart';
import 'package:know_snap/controller/login/signup_button_controller.dart';

class SignUpBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SignUpButtonController(),permanent: true);
  }

}