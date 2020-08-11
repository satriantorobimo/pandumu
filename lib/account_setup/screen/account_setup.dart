import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/edit_profile/screen/edit_profile.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/model_register.dart';

class AccountSetupScreen extends StatefulWidget {
  final UserDataRegisModel userDataRegisModel;

  const AccountSetupScreen({Key key, this.userDataRegisModel})
      : super(key: key);
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
  final _formKey = GlobalKey<FormState>();

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
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // SizedBox(
            //   height: ScreenUtil.getInstance().setHeight(10),
            // ),
            _buildHeaderText(context),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(25),
            ),
            _formAccount(context)
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(180),
      decoration: BoxDecoration(color: bluePrimary),
      child: Center(
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
      ),
    );
  }

  Widget _formAccount(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().setWidth(50),
          right: ScreenUtil.getInstance().setWidth(50),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: userNameCtrl,
                // validator: checkUserName(userNameCtrl.text),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
                height: ScreenUtil.getInstance().setHeight(25),
              ),
              TextFormField(
                controller: displayNameCtrl,
                // validator: checkDisplayName(displayNameCtrl.text),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
                height: ScreenUtil.getInstance().setHeight(25),
              ),
              TextFormField(
                controller: passwordCtrl,
                // validator: checkPasswordlength(passwordCtrl.text),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
                height: ScreenUtil.getInstance().setHeight(25),
              ),
              TextFormField(
                controller: confirmPasswordCtrl,
                // validator: checkConfirmPassword(confirmPasswordCtrl.text),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
                height: ScreenUtil.getInstance().setHeight(15),
              ),
              Container(
                  width: ScreenUtil.getInstance().setWidth(120),
                  child: checkEnableButton()
                  // passwordLength && confirmPassword && displayName && userName
                  //     ? checkEnableButton()
                  //     : checkDisableButton()
                  ),
            ],
          ),
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
        if (_formKey.currentState.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          // TODO: Make a function for check username on DB
          // ! Check username
          widget.userDataRegisModel.userName = userNameCtrl.text;
          widget.userDataRegisModel.name = displayNameCtrl.text;
          widget.userDataRegisModel.password = passwordCtrl.text;
          Navigator.pushReplacement(
              context,
              CustomFadeTransition(
                  widget: EditPtofileScreen(
                userDataRegisModel: widget.userDataRegisModel,
              )));
        }
        // Navigator.pushReplacement(
        //     context, CustomFadeTransition(widget: EditPtofileScreen()));
      },
      color: bluePrimaryLight,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: bluePrimaryLight)));

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
