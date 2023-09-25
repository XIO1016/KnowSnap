import 'package:flutter/material.dart';

import '../src/colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: text,
            contentPadding: const EdgeInsets.all(13.0),
            hintStyle: const TextStyle(color: CustomColor.grey30),
            filled: true,
            fillColor: CustomColor.grey10,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
        controller: controller,
      ),
    );
  }
}
