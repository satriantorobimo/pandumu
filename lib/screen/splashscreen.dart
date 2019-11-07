import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pandumu/screen/welcome/welcome.dart';

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
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: const Color(0xFFF1F5F6)),
        child: Stack(children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text('pandumu',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Color(0xFF2877C6))),
                )
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
