import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/login/signup_button_controller.dart';
import '../../../src/colors.dart';
import '../../../util/logger.dart';
import '../component/signup_component.dart';

class SignUp extends GetView<SignUpButtonController> {
  var maincolor = CustomColor.mainColor;

  SignUp({super.key});

  List title = ["아이디", "비밀번호", "닉네임", "성별"];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          bottomSheet: SafeArea(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: maincolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0))),
                onPressed: (() {
                  // if (controller.pageIndex.value == 0) {
                  //   // controller.Idoverlap();
                  // }
                  if (controller.pageIndex.value == 2) {
                    if (controller.textcontroller[1].text !=
                        controller.textcontroller[2].text) {
                      controller.ConfirmPassError();
                      return;
                    }
                  }
                  // } else if (controller.pageIndex.value == 3) {
                  //   FocusManager.instance.primaryFocus?.unfocus();
                  // } else if (controller.pageIndex.value == 4) {
                  //   controller.apiSignUp();
                  // }
                  if (controller.pageIndex.value != 5) {
                    controller.changesignuppage(controller.pageIndex.value + 1);
                  }
                  logger.d(controller.pageIndex.value);
                }),
                child: (controller.pageIndex.value == 0)
                    ? const Text(
                        '아이디 중복 확인',
                        style: TextStyle(
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: CustomColor.white),
                      )
                    : const Text(
                        '확인',
                        style: TextStyle(
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: CustomColor.white),
                      ),
              ),
            ),
          ),
          appBar: AppBar(
            leading: const BackButton(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              Column(
                children: [
                  SignUpComponent(0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: controller.textcontroller[0],
                      autofocus: true,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: "아이디",
                        labelStyle: TextStyle(fontFamily: "Sans"),
                      ),
                      validator: (value) =>
                          value!.trim().isEmpty ? 'ID required' : null,
                    ),
                  ),
                  const goToLogin()
                ],
              ),
              Column(
                children: [
                  SignUpComponent(1),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: controller.textcontroller[1],
                      autofocus: true,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: "비밀번호",
                        labelStyle: TextStyle(fontFamily: "Sans"),
                      ),
                      validator: (value) =>
                          value!.trim().isEmpty ? 'Password required' : null,
                    ),
                  ),
                  const goToLogin()
                ],
              ),
              Column(
                children: [
                  SignUpComponent(2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: controller.textcontroller[2],
                      autofocus: true,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: "비밀번호 확인",
                        labelStyle: TextStyle(fontFamily: "Sans"),
                      ),
                      validator: (value) => value!.trim().isEmpty
                          ? 'confirmPassword required'
                          : null,
                    ),
                  ),
                  const goToLogin()
                ],
              ),
              Column(
                children: [
                  SignUpComponent(3),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      autofocus: true,
                      autocorrect: false,
                      controller: controller.textcontroller[3],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "전화번호",
                        labelStyle: TextStyle(fontFamily: "Sans"),
                      ),
                    ),
                  ),
                  const goToLogin()
                ],
              ),
              Column(
                children: [
                  SignUpComponent(4),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      autofocus: true,
                      autocorrect: false,
                      controller: controller.textcontroller[3],
                      decoration: const InputDecoration(
                        labelText: "닉네임",
                        labelStyle: TextStyle(fontFamily: "Sans"),
                      ),
                    ),
                  ),
                  const goToLogin()
                ],
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignUpComponent(5),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        6,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: ChoiceChip(
                              labelPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              label: Text(
                                controller.mainTopic[index]['state'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: "Sans",
                                    fontWeight: FontWeight.w700),
                              ),
                              side: BorderSide.none,
                              backgroundColor: CustomColor.grey35,
                              selected: controller.mainTopic[index]
                                      ['isCheck'] ==
                                  true,
                              selectedColor: CustomColor.mainColor,
                              onSelected: (value) {
                                controller.changeGen(index);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const goToLogin()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
