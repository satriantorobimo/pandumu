import 'package:flutter/material.dart';
import 'package:pandumu/splashscreen.dart';
import 'package:pandumu/util/color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pandumu',
      theme: ThemeData(primaryColor: bluePrimary, fontFamily: 'Roboto'),
      // home: BottomNavigationBarController(),
      home: SplashScreen(),
    );
  }
}
