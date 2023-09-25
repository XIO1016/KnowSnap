import 'package:get/get.dart';
import 'package:know_snap/binding/login/login_binding.dart';
import 'package:know_snap/binding/login/sign_up_binding.dart';
import 'package:know_snap/routes/router.dart';
import 'package:know_snap/view/login/pages/login.dart';
import 'package:know_snap/view/login/pages/signup.dart';

class Pages {
  Pages._();

  static const initial = Routes.login;

  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ), GetPage(
      name: Routes.signUp,
      page: () => SignUp(),
      binding: SignUpBinding(),
    ),
  ];
}