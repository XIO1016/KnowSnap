import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color,
  });

  final Function onPressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: TextStyle(color: color),
        ));
  }
}
