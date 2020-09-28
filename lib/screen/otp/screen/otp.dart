import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/model/user/user_model.dart';
import 'package:pandumu/screen/account_setup/screen/account_setup.dart';
import 'package:pandumu/screen/login/screen/login2.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/model_register.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:pandumu/provider/provider_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;

  final UserModel userModel;

  const OtpScreen({Key key, this.verificationId, this.userModel})
      : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _pinEditingController = TextEditingController();
  PinDecoration _pinDecoration =
      UnderlineDecoration(enteredColor: Colors.black, color: Colors.grey);
  FirebaseAuth _auth = FirebaseAuth.instance;
  // String pinOtp;
  bool isLoading = false;
  bool enableButton = false;
  String code = "";
  final scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "scaffold-verify-phone");

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    final phoneAuthDataProvider =
        Provider.of<PhoneAuthDataProvider>(context, listen: false);

    phoneAuthDataProvider.setMethods(
      onStarted: onStarted,
      onError: onError,
      onFailed: onFailed,
      onVerified: onVerified,
      onCodeResent: onCodeResent,
      onCodeSent: onCodeSent,
      onAutoRetrievalTimeout: onAutoRetrievalTimeOut,
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(260),
            decoration: BoxDecoration(color: bluePrimary),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(80),
              ),
              _buildHeaderText(context),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(20),
              ),
              _buildHeader(context),
              _alreadyHaveAccount(context),
              _changeBahasa(context),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(5),
              ),
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
            text: 'Sign Up!',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.getInstance().setSp(30),
                color: Colors.white)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(230),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(40),
              left: ScreenUtil.getInstance().setWidth(40),
              right: ScreenUtil.getInstance().setWidth(40),
              bottom: ScreenUtil.getInstance().setHeight(10),
            ),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: RichText(
                      text: TextSpan(
                          text: 'Enter the code sent to ',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: darkGrey),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' +62',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: widget.userModel.phone,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14),
                                    fontWeight: FontWeight.bold))
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  Container(
                      height: ScreenUtil.getInstance().setHeight(50),
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: PinInputTextField(
                        pinLength: 6,
                        decoration: _pinDecoration,
                        controller: _pinEditingController,
                        autoFocus: false,
                        textInputAction: TextInputAction.done,
                        onChanged: (pin) {
                          print("OTP : ${pin.length}");
                          setState(() {
                            code = "";
                            code = pin;
                          });
                          if (code.length == 6) {
                            setState(() {
                              enableButton = true;
                            });
                          } else {
                            setState(() {
                              enableButton = false;
                            });
                          }
                        },
                        onSubmit: (pin) {
                          setState(() {
                            code = pin;
                          });
                          debugPrint('submit pin:$pin');
                        },
                        keyboardType: TextInputType.number,
                      )),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  Container(
                      width: ScreenUtil.getInstance().setWidth(120),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : enableButton
                              ? checkEnableButton()
                              : checkDisableButton()),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _alreadyHaveAccount(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(140)),
      child: Column(
        children: <Widget>[
          Text(
            'Already have an account?',
            style: TextStyle(
                color: bluePrimaryLight,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.getInstance().setSp(14),
                fontFamily: 'Roboto'),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(5),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, CustomFadeTransition(widget: LoginScreen2()));
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: ScreenUtil.getInstance().setSp(20),
                  fontFamily: 'Roboto',
                  color: bluePrimaryLight,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _changeBahasa(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(60)),
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
      ),
    );
  }

  Widget checkDisableButton() => OutlineButton(
        child: Text(
          'Verify',
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
        'Verify',
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil.getInstance().setSp(20),
        ),
      ),
      onPressed: () {
        // setState(() {
        //   isLoading = true;
        // });
        // TODO: Make a function for verify OTP
        // verifyPhone();

        signIn();
      },
      color: bluePrimaryLight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: bluePrimaryLight)));

  signIn() async {
    if (code.length != 6) {
      _showSnackBar("Invalid OTP");
    }
    Provider.of<PhoneAuthDataProvider>(context, listen: false)
        .verifyOTPAndLogin(smsCode: code);
  }

  _showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text('$text'),
      duration: Duration(seconds: 2),
    );
//    if (mounted) Scaffold.of(context).showSnackBar(snackBar);
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  onStarted() {
    _showSnackBar("PhoneAuth started");
//    _showSnackBar(phoneAuthDataProvider.message);
  }

  onCodeSent() {
    _showSnackBar("OPT sent");
//    _showSnackBar(phoneAuthDataProvider.message);
  }

  onCodeResent() {
    _showSnackBar("OPT resent");
//    _showSnackBar(phoneAuthDataProvider.message);
  }

  onVerified() async {
    _showSnackBar(
        "${Provider.of<PhoneAuthDataProvider>(context, listen: false).message}");
    UserModel userModel = UserModel();
    userModel = widget.userModel;
    userModel.userid =
        Provider.of<PhoneAuthDataProvider>(context, listen: false)
            .userid
            .toString();
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'userid',
        Provider.of<PhoneAuthDataProvider>(context, listen: false)
            .userid
            .toString());
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(
        context,
        CustomFadeTransition(
            widget: AccountSetupScreen(
          userModel: userModel,
        )));
  }

  onFailed() {
//    _showSnackBar(phoneAuthDataProvider.message);
    _showSnackBar("PhoneAuth failed");
  }

  onError() {
//    _showSnackBar(phoneAuthDataProvider.message);
    _showSnackBar(
        "PhoneAuth error ${Provider.of<PhoneAuthDataProvider>(context, listen: false).message}");
  }

  onAutoRetrievalTimeOut() {
    _showSnackBar("PhoneAuth autoretrieval timeout");
//    _showSnackBar(phoneAuthDataProvider.message);
  }
}
