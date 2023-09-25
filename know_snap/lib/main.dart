import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:know_snap/binding/main_binding.dart';
import 'package:know_snap/routes/Pages.dart';
import 'package:know_snap/routes/router.dart';
import 'package:know_snap/src/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '지식 메모',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.mainColor),
        useMaterial3: true,
      ),
      initialRoute: Routes.login,
      initialBinding:  MainBinding(),
      getPages: Pages.pages,
    );
  }
}
