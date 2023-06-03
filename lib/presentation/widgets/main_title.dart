import 'package:flutter/material.dart';

class MainTitle extends StatefulWidget {
  const MainTitle({super.key, required this.title});
  final String title;

  @override
  State<MainTitle> createState() => _MainTitleState();
}

class _MainTitleState extends State<MainTitle> {
  String get title => widget.title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
