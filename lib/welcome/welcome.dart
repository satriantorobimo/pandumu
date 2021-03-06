import 'package:flutter/material.dart';
import 'package:pandumu/login/screen/login.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_fade_transition.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: whiteSmoke),
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
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Color(0xFF2877C6))),
                )
              ],
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.02,
              left: 8,
              right: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            CustomFadeTransition(widget: LoginScreen()));
                      },
                      child: Text('Login'),
                      color: Colors.white,
                      elevation: 0,
                      textColor: blueLight,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('Mulai Jelajahi'),
                      color: blueLight,
                      elevation: 0,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
