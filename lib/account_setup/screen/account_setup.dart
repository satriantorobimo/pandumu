import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/edit_profile/screen/edit_profile.dart';
import 'package:pandumu/util/custom_fade_transition.dart';

class AccountSetupScreen extends StatefulWidget {
  @override
  _AccountSetupScreenState createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  bool enableButton = false;
  bool passwordLength = false;
  bool confirmPassword = false;
  bool displayName = false;
  bool userName = false;
  String passwordTemp = "";

  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController displayNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  void dispose() {
    userNameCtrl.dispose();
    displayNameCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(180),
            decoration: BoxDecoration(color: const Color(0xFF166EC6)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(10),
              ),
              _buildHeaderText(context),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(5),
              ),
              _formAccount(context)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
            text: 'Account Setup',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.getInstance().setSp(30),
                color: Colors.white)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _formAccount(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().setWidth(50),
          right: ScreenUtil.getInstance().setWidth(50),
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: userNameCtrl,
              validator: checkUserName(userNameCtrl.text),
              decoration: InputDecoration(
                  hintText: 'Enter your Username',
                  labelText: 'Username',
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  ),
                  labelStyle: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  )),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(40),
            ),
            TextFormField(
              controller: displayNameCtrl,
              validator: checkDisplayName(displayNameCtrl.text),
              decoration: InputDecoration(
                  hintText: 'Enter your Display Name or Real Name',
                  labelText: 'Display Name',
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  ),
                  labelStyle: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  )),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(40),
            ),
            TextFormField(
              controller: passwordCtrl,
              validator: checkPasswordlength(passwordCtrl.text),
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  ),
                  labelStyle: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  )),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(40),
            ),
            TextFormField(
              controller: confirmPasswordCtrl,
              validator: checkConfirmPassword(confirmPasswordCtrl.text),
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter your Confirm Password',
                  labelText: 'Confirm Password',
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  ),
                  labelStyle: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  )),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Container(
                width: ScreenUtil.getInstance().setWidth(120),
                child: checkEnableButton()
                // passwordLength && confirmPassword && displayName && userName
                //     ? checkEnableButton()
                //     : checkDisableButton()
                ),
          ],
        ));
  }

  Widget checkDisableButton() => OutlineButton(
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.grey,
            fontSize: ScreenUtil.getInstance().setSp(20),
          ),
        ),
        onPressed: null,
        borderSide: BorderSide(color: Colors.grey),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0)),
      );

  Widget checkEnableButton() => FlatButton(
      child: Text(
        'Save',
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil.getInstance().setSp(20),
        ),
      ),
      onPressed: () {
        // setState(() {
        //   isLoading = true;
        // });
        // verifyPhone();
        Navigator.pushReplacement(
            context, CustomFadeTransition(widget: EditPtofileScreen()));
      },
      color: const Color(0xFF007FFD),
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: const Color(0xFF007FFD))));

  checkPasswordlength(String text) {
    if (text.length >= 8) {
      setState(() {
        passwordTemp = "";
        passwordTemp = text;
        passwordLength = true;
      });
    } else {
      setState(() {
        passwordTemp = "";
        passwordTemp = text;
        passwordLength = false;
      });
    }
  }

  checkConfirmPassword(String text) {
    if (text == passwordTemp) {
      setState(() {
        confirmPassword = true;
      });
    } else {
      setState(() {
        confirmPassword = false;
      });
    }
  }

  checkUserName(String text) {
    print(text);
    if (text != null) {
      setState(() {
        userName = true;
      });
    } else {
      setState(() {
        userName = false;
      });
    }
  }

  checkDisplayName(String text) {
    if (text != null) {
      setState(() {
        displayName = true;
      });
    } else {
      setState(() {
        displayName = false;
      });
    }
  }
}
