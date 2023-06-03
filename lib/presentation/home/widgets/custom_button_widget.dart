import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  final double iconsSize;
  final double textSize;
  const CustomButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconsSize = 30,
      this.textSize = 18});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconsSize,
          color: KWhiteColor,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}
