import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neflix_ui/presentation/main_page/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ScreenMainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Image.network(
        'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
        height: 60,
        width: 60,
      ),
    );
  }
}
