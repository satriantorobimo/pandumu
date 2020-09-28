import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/model/user/user_model.dart';
import 'package:pandumu/screen/edit_profile/screen/edit_profile.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/encrypt_data.dart';
import 'package:pandumu/util/model_register.dart';

class AccountSetupScreen extends StatefulWidget {
  final UserModel userModel;

  const AccountSetupScreen({Key key, this.userModel}) : super(key: key);
  @override
  _AccountSetupScreenState createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  bool enableButton = false;
  String passwordTemp = "";
  int count = 1;
  final databaseReference = Firestore.instance;

  bool flag = false;

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
                validator: checkUserName,
                onSaved: (String value) {
                  widget.userModel.username = value;
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
                validator: checkDisplayName,
                onSaved: (String value) {
                  widget.userModel.name = value;
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
                validator: checkPasswordlength,
                onFieldSubmitted: (String value) {
                  print(value);
                  if (this.mounted) {
                    setState(() {
                      passwordTemp = value;
                      print(passwordTemp);
                    });
                  }
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
                validator: checkConfirmPassword,
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
        if (_formKey.currentState.validate() && count > 2) {
          _formKey.currentState.save();
          widget.userModel.password =
              EncryptData().passwordEncrypt(passwordTemp);
          Navigator.pushReplacement(
              context,
              CustomFadeTransition(
                  widget: EditPtofileScreen(
                userModel: widget.userModel,
              )));
        } else {
          if (this.mounted) {
            setState(() {
              count++;
            });
          }
        }
        // Navigator.pushReplacement(
        //     context, CustomFadeTransition(widget: EditPtofileScreen()));
      },
      color: bluePrimaryLight,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: bluePrimaryLight)));

  String checkUserName(String text) {
    if (text.isEmpty) {
      return 'Tidak boleh kosong';
    } else {
      databaseReference
          .collection('user')
          .where('username', isEqualTo: text)
          .snapshots()
          .listen((data) async {
        if (data.documents.length == 0) {
          print('kosong dengan text $text');
          if (this.mounted) {
            setState(() {
              flag = false;
            });
          }
        } else {
          print('grower ${data.documents[0].data}');
          if (this.mounted) {
            setState(() {
              flag = true;
            });
          }
        }
      });
      if (flag) {
        print(flag);
        return 'Username sudah ada';
      } else {
        return null;
      }
    }
  }

  String checkPasswordlength(String text) {
    if (text.isEmpty) {
      return 'Tidak boleh kosong';
    } else {
      if (text.length >= 8) {
        if (this.mounted) {
          setState(() {
            passwordTemp = text;
            print(passwordTemp);
          });
        }

        return null;
      } else {
        if (this.mounted) {
          setState(() {
            passwordTemp = text;
            print(passwordTemp);
          });
        }

        return 'Password harus lebih dari 8 karakter';
      }
    }
  }

  String checkConfirmPassword(String text) {
    print('Password 2 $text');
    print('Password 1 $passwordTemp');
    if (text.isEmpty) {
      return 'Tidak boleh kosong';
    } else {
      if (text == passwordTemp) {
        return null;
      } else {
        return 'Password tidak sama';
      }
    }
  }

  String checkDisplayName(String text) {
    if (text.isEmpty) {
      return 'Tidak boleh kosong';
    } else {
      return null;
    }
  }
}
