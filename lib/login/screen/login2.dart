import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/signup/screen/signup.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/navigation_bar_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen2> {
  final _formKey = GlobalKey<FormState>();
  String username = '',
      password = '',
      _errorMessage = '',
      passValidator = '',
      userValidator = '';

  bool _isLoading = false;

  final databaseReference = Firestore.instance;

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
                                  borderSide:
                                      BorderSide(color: bluePrimaryLight)),
                              hintText: "Username",
                              hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: ScreenUtil.getInstance().setSp(16)),
                            ),
                            validator: (value) => value.isEmpty
                                ? 'Username can\'t be empty'
                                : null,
                            onSaved: (value) => username = value.trim(),
                            onChanged: (value) => userValidator = value.trim(),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(16),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: bluePrimaryLight)),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: ScreenUtil.getInstance().setSp(16)),
                            ),
                            validator: (value) => value.isEmpty
                                ? 'Password can\'t be empty'
                                : null,
                            onSaved: (value) => password = value.trim(),
                            onChanged: (value) => passValidator = value.trim(),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          _isLoading
                              ? CircularProgressIndicator()
                              : Container(
                                  width: ScreenUtil.getInstance().setWidth(168),
                                  child: userValidator.length > 0 &&
                                          passValidator.length > 0
                                      ? RaisedButton(
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil.getInstance()
                                                  .setSp(20),
                                            ),
                                          ),
                                          onPressed: () {
                                            _validateUser();
                                          },
                                          color: bluePrimaryLight,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0)),
                                        )
                                      : OutlineButton(
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              color: bluePrimaryLight,
                                              fontSize: ScreenUtil.getInstance()
                                                  .setSp(20),
                                            ),
                                          ),
                                          onPressed: () {
                                            showErrorMessage();
                                          },
                                          borderSide: BorderSide(
                                              color: bluePrimaryLight),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0)),
                                        ),
                                ),
                          //showErrorMessage()
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Forgot your password? RESET',
                    style: TextStyle(
                      color: bluePrimaryLight,
                      fontSize: ScreenUtil.getInstance().setSp(14),
                      shadows: [
                        Shadow(
                          blurRadius: 1.0,
                          color: blueLight,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
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

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  void _validateUser() {
    setState(() {
      _isLoading = true;
    });
    databaseReference
        .collection('user')
        .where('username', isEqualTo: userValidator)
        .snapshots()
        .listen((data) async {
      if (data.documents.length == 0) {
        _showDialog('datanull');
        setState(() {
          _isLoading = false;
        });
      } else {
        print('grower ${data.documents[0].data}');
        if (data.documents[0]['password'] == passValidator) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLogin', true);
          prefs.setString('username', userValidator);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavigationBarController()));
        } else {
          _showDialog('beda');
        }
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _showDialog(String status) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Oops!"),
          content: status == 'datanull'
              ? Text("Maaf, Username Anda tidak terdaftar.")
              : Text("Maaf, Username atau Password Anda salah."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
