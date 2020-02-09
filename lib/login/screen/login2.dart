import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/signup/screen/signup.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/navigation_bar_controller.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen2> {
  final _formKey = GlobalKey<FormState>();
  String username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/background.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Meet fellow travelers around you',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                            color: Colors.white)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color(0xFF007FFD))),
                              hintText: "Username",
                              hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: ScreenUtil.getInstance().setSp(16)),
                            ),
                            onSaved: (val) {
                              username = val;
                            },
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(16),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color(0xFF007FFD))),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: ScreenUtil.getInstance().setSp(16)),
                            ),
                            onSaved: (val) {
                              username = val;
                            },
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Container(
                            width: ScreenUtil.getInstance().setWidth(168),
                            child: OutlineButton(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: const Color(0xFF007FFD),
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
                              borderSide:
                                  BorderSide(color: const Color(0xFF007FFD)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Forgot your password? RESET',
                    style: TextStyle(
                        color: const Color(0xFF007FFD),
                        fontSize: ScreenUtil.getInstance().setSp(14)),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(100),
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
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Row(
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
