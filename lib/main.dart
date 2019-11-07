import 'package:flutter/material.dart';
import 'package:pandumu/screen/splashscreen.dart';
import 'package:pandumu/util/navigation_bar_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pandumu',
      theme: ThemeData(
        primaryColor: const Color(0xFF2877C6),
      ),
      // home: BottomNavigationBarController(),
      home: SplashScreen(),
    );
  }
}
