import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_snap/src/colors.dart';

import '../../../controller/login/login_button_controller.dart';
import '../../../widgets/CustomFormField.dart';
import '../../../widgets/CustomTextButton.dart';
import '../../../widgets/HorizonDivider.dart';
import '../component/login_component.dart';

class LoginPage extends GetView<LoginButtonController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: sort_child_properties_last
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  Image.asset('assets/logo/logo.png'),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomFormField(
                      text: '아이디', controller: controller.idController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                      text: '비밀번호', controller: controller.passwordController),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          value: controller.isAutoLogin.value,
                          onChanged: (value) => controller.checkIsAutoLogin(),
                          side: const BorderSide(color: CustomColor.grey40),
                        ),
                        const Text(
                          "자동로그인",
                          style: TextStyle(
                              color: CustomColor.grey40, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: CustomColor.grey35,
                      ),
                      child: const Center(
                        child: Text(
                          "로그인",
                          style:
                              TextStyle(color: CustomColor.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextButton(
                        onPressed: () {},
                        title: '아이디 찾기',
                        color: CustomColor.grey40,
                      ),
                      const Text('|'),
                      CustomTextButton(
                        onPressed: () {},
                        title: '비밀번호 찾기',
                        color: CustomColor.grey40,
                      ),
                      const Text('|'),
                      CustomTextButton(
                        onPressed: () => Get.toNamed('/signup'),
                        title: '회원가입',
                        color: CustomColor.mainColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      HorizonDivider(),
                      CustomTextButton(
                          onPressed: () {},
                          title: "간편 로그인",
                          color: CustomColor.black),
                      HorizonDivider()
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        height: 40,
                        child: Image.asset('assets/socialIcon/naver_icon.png')),
                  )
                ],
              ),
            ),
          ),
          //   bottomSheet: SafeArea(
          //     child: Container(
          //       width: double.infinity,
          //       color: Colors.white,
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             padding: EdgeInsets.symmetric(vertical: 15),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(0.0))),
          //         onPressed: (() {
          //           if (controller.pageIndex.value == 1) {
          //             // controller.apiLogin(0);
          //           } else {
          //             controller.changeloginpage(controller.pageIndex.value + 1);
          //           }
          //         }),
          //         child: const Text(
          //           '확인',
          //           style: TextStyle(
          //               fontFamily: "Sans",
          //               fontWeight: FontWeight.w700,
          //               fontSize: 15),
          //         ),
          //       ),
          //     ),
          //   ),
          //   appBar: AppBar(
          //     backgroundColor: Colors.transparent,
          //     centerTitle: true,
          //     leading: BackButton(color: Colors.black),
          //     elevation: 0,
          //   ),
          //   body: IndexedStack(
          //     index: controller.pageIndex.value,
          //     children: [
          //       Column(
          //         children: [
          //           LoginComponent(0),
          //           Padding(
          //             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //             child: TextFormField(
          //               controller: controller.idController,
          //               autofocus: true,
          //               autocorrect: false,
          //               decoration: const InputDecoration(
          //                 labelText: "아이디",
          //                 labelStyle: TextStyle(fontFamily: "Sans"),
          //               ),
          //               validator: (value) =>
          //                   value!.trim().isEmpty ? 'ID required' : null,
          //             ),
          //           ),
          //           const goOther()
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           LoginComponent(1),
          //           Padding(
          //             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //             child: TextFormField(
          //               controller: controller.passwordController,
          //               autofocus: true,
          //               autocorrect: false,
          //               decoration: const InputDecoration(
          //                 labelText: "비밀번호",
          //                 labelStyle: TextStyle(fontFamily: "Sans"),
          //               ),
          //               obscureText: true,
          //               validator: (value) =>
          //                   value!.trim().isEmpty ? 'ps required' : null,
          //             ),
          //           ),
          //           const goOther()
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
