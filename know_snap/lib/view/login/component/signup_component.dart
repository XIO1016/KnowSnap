import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/login.dart';

class SignUpComponent extends StatelessWidget {
  int id;
  List title = [
    "아이디를 알려주세요",
    "비밀번호를 알려주세요",
    "비밀번호를 다시 한번 작성해주세요",
    "전화번호를 알려주세요",
    "닉네임을 알려주세요",
    "관심 주제를 알려주세요"
  ];
  var maincolor = Colors.blue;

  SignUpComponent(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title[id],
              style: const TextStyle(
                  fontSize: 23,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "회원가입을 위해 필요합니다",
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

class goToLogin extends StatelessWidget {
  const goToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Get.toNamed('/login');
          },
          child: const Text(
            "지식메모에 가입하신 적 있으신가요? >",
            style: TextStyle(
                fontFamily: "Sans",
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 133, 133, 133)),
          ),
        ));
  }
}
