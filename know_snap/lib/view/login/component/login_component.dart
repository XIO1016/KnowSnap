import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/signup.dart';

class LoginComponent extends StatelessWidget {
  int id;

  LoginComponent(this.id, {super.key});

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List title = ["아이디", "비밀번호"];

  var maincolor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title[id] + "를 알려주세요",
              style: const TextStyle(
                  fontSize: 23,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "로그인을 위해 필요합니다",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Sans",
                  color: Colors.grey,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class goOther extends StatelessWidget {
  const goOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Get.toNamed("/sign-up");
          },
          child: const Text(
            "복어의 회원이 아니신가요? >",
            style: TextStyle(
                fontFamily: "Sans",
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 133, 133, 133)),
          ),
        ));
  }
}
