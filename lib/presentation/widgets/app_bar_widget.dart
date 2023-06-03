import 'package:flutter/material.dart';

import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.tittle});
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        KWidth,
        Text(
          tittle,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(
          Icons.cast,
          color: KWhiteColor,
          size: 30,
        ),
        KWidth,
        Container(
          height: 30,
          width: 30,
          color: Colors.blue,
        ),
        KWidth
      ],
    );
  }
}
