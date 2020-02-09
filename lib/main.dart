import 'package:flutter/material.dart';
import 'package:pandumu/splashscreen.dart';
import 'package:pandumu/util/navigation_bar_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pandumu',
      theme: ThemeData(
          primaryColor: const Color(0xFF166EC6), fontFamily: 'Roboto'),
      // home: BottomNavigationBarController(),
      home: SplashScreen(),
    );
  }
}
