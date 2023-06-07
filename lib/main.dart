import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neflix_ui/core/colors/colors.dart';

import 'package:neflix_ui/presentation/splashscreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
