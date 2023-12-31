import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/logger.dart';
import '../../widgets/message_popup.dart';
import '../../widgets/message_popup2.dart';

enum PageName { ID, PASSWORD, CONFIRMPASS, PHONE, NICK, GENDER }

class SignUpButtonController extends GetxController {
  RxList<Map<String, dynamic>> mainTopic = [
    {'state': 'IT지식', 'isCheck': false},
    {'state': '알고리즘', 'isCheck': false},
    {'state': '백엔드', 'isCheck': false},
    {'state': '프론트엔드', 'isCheck': false},
    {'state': '언어', 'isCheck': false},
    {'state': '기타', 'isCheck': false},
  ].obs;

  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];
  late List textcontroller = [
    TextEditingController,
    TextEditingController,
    TextEditingController,
    TextEditingController,
    TextEditingController,
  ];

  @override
  void onInit() {
    textcontroller = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    super.onInit();
  }

  //
  // void Idoverlap() async {
  //   Get.dialog(Center(child: CircularProgressIndicator()),
  //       barrierDismissible: false);
  //   var request = await http.get(
  //     Uri.parse(urlBase + urlSignUp + '/check?id=${textcontroller[0].text}'),
  //   );
  //
  //   print(request.body);
  //   if (request.body == 'true') {
  //     IDError();
  //   } else if (request.body == 'false') {
  //     Get.back();
  //   }
  // }

  void Passconfirm() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }

  void apiSignUp() async {
    print(textcontroller[0].text);
    print(textcontroller[1].text);
    print(int.parse(textcontroller[3].text));
    print(mainTopic[0]['isCheck']);
    print(mainTopic[1]['isCheck']);

    // Get.dialog(Center(child: CircularProgressIndicator()),
    //     barrierDismissible: false);
    // var request = await http.post(Uri.parse(urlBase + urlSignUp),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, dynamic>{
    //       'id': textcontroller[0].text,
    //       'password': textcontroller[1].text,
    //       'age': int.parse(textcontroller[3].text),
    //       'gender': gen[0]['isCheck'] == true ? 'MAN' : 'WOMAN'
    //     }));
    // if (request.statusCode == 200) {
    //   Map<String, dynamic> body = jsonDecode(request.body);
    //   print(body);
    //   Get.back();
    //   Get.offNamed('Login');
    // } else {
    //   Map<String, dynamic> body = jsonDecode(request.body);
    //   print(body);
    //   SignUpError(body['message']);
    // }
  }

  @override
  void onClose() {
    for (int i = 0; i < 4; i++) {
      textcontroller[i].dispose();
    }
    super.onClose();
  }

  void changeGen(int index) {
    for (int bi = 0; bi < 6; bi++) {
      if (bi == index) {
        mainTopic[index]['isCheck'] = true;
      } else {
        mainTopic[bi]['isCheck'] = false;
      }
    }
    mainTopic.refresh();
    logger.d(mainTopic.value[0]);
  }

  void changesignuppage(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];

    switch (page) {
      case PageName.ID:
      case PageName.PASSWORD:
      case PageName.CONFIRMPASS:
      case PageName.PHONE:
      case PageName.NICK:
      case PageName.GENDER:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                message: '종료하시겠습니까?',
                okCallback: () {
                  exit(0);
                },
                cancelCallback: Get.back,
                title: '복어',
              ));
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changesignuppage(index, hasGesture: false);
      print(bottomHistory);

      return false;
    }
  }

  Future<bool> missingError(int value) async {
    showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup2(
              message: '빈칸을 입력해주세요',
              okCallback: () {
                changesignuppage(value);
              },
              title: '복어',
            ));
    return true;
  }

  Future<bool> IDError() async {
    showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup2(
              message: '중복된 아이디가 존재합니다',
              okCallback: () {
                Get.back();
                Get.back();
                changesignuppage(0);
              },
              title: '복어',
            ));
    return true;
  }

  Future<bool> ConfirmPassError() async {
    showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup2(
              message: '비밀번호를 다시 확인해주세요',
              okCallback: () {
                Get.back();
                changesignuppage(1);
              },
              title: '복어',
            ));
    return true;
  }

  Future<bool> SignUpError(String message) async {
    showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup2(
              message: message,
              okCallback: () {
                Get.back();
                Get.back();
              },
              title: '복어',
            ));
    return true;
  }
}
