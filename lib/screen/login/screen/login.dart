import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/screen/signup/screen/signup.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/navigation_bar_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _buildPageContent() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: <Widget>[
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                          text: 'Meet fellow travelers around you',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                              color: Colors.white)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(70),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            title: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil.getInstance().setSp(16)),
                            border: InputBorder.none,
                          ),
                        )),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(5),
                        ),
                        ListTile(
                            title: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil.getInstance().setSp(16)),
                            border: InputBorder.none,
                          ),
                        )),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(20),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(120),
                    child: OutlineButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: bluePrimaryLight,
                          fontSize: ScreenUtil.getInstance().setSp(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavigationBarController()));
                      },
                      borderSide: BorderSide(color: bluePrimaryLight),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(15),
                  ),
                  Text(
                    'Forgot your password? RESET',
                    style: TextStyle(
                        color: bluePrimaryLight,
                        fontSize: ScreenUtil.getInstance().setSp(16),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(55),
                  ),
                  Text(
                    'Not already yet?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().setSp(14),
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          CustomFadeTransition(widget: SignUpScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: ScreenUtil.getInstance().setSp(20),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(25),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            bottom: ScreenUtil.getInstance().setHeight(20),
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/icons/flag.png",
                  scale: 18,
                ),
                SizedBox(
                  width: ScreenUtil.getInstance().setWidth(10),
                ),
                Text(
                  'Ubah ke Bahasa Indonesia',
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(14),
                      color: const Color(0xFF707070)),
                ),
              ],
            )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _buildPageContent(),
    );
  }
}
