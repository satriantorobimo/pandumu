import 'package:flutter/material.dart';
import 'package:pandumu/screen/login/login.dart';

class WelcomeScreen extends StatelessWidget {
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text('Login'),
                      color: Colors.white,
                      elevation: 0,
                      textColor: Color(0xFF18B8EF),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('Mulai Jelajahi'),
                      color: Color(0xFF18B8EF),
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
