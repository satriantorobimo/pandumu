import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/login/screen/login.dart';
import 'package:pandumu/util/custom_fade_transition.dart';

import 'login/screen/login2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context, CustomFadeTransition(widget: LoginScreen2())));
  }

  void checkLogin() async {
    // var prefs = await SharedPreferences.getInstance();
    // bool isLogin = prefs.getBool('login');
    // if (isLogin == true) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => HomeScreen()));
    // } else {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: const Color(0xFF166EC6)),
        child: Stack(children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/images/logo_splash.png',
                    width: ScreenUtil.getInstance().setWidth(140),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              left: 8,
              right: 8,
              child: Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        const Color(0xFF2877C6))),
              ))
        ]),
      ),
    );
  }
}
