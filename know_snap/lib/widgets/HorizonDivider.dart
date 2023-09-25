import 'package:flutter/material.dart';

import '../src/colors.dart';

class HorizonDivider extends StatelessWidget {
  HorizonDivider({super.key, this.color = CustomColor.black});

  Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 0.5,
        color: color,
      ),
    );
  }
}
