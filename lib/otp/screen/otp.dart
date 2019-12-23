import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/account_setup/screen/account_setup.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const OtpScreen({Key key, this.phoneNumber, this.verificationId})
      : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _pinEditingController = TextEditingController();
  PinDecoration _pinDecoration =
      UnderlineDecoration(enteredColor: Colors.black, color: Colors.grey);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String pinOtp;
  bool isLoading = false;
  bool enableButton = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(260),
            decoration: BoxDecoration(color: const Color(0xFF166EC6)),
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
                              color: const Color(0xFF899899)),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' +62',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: widget.phoneNumber,
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
                        autoFocus: true,
                        textInputAction: TextInputAction.go,
                        onChanged: (pin) {
                          print("OTP : ${pin.length}");
                          setState(() {
                            pinOtp = "";
                            pinOtp = pin;
                          });
                          if (pinOtp.length == 6) {
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
                            pinOtp = pin;
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
                color: const Color(0xFF007FFD),
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.getInstance().setSp(14),
                fontFamily: 'Roboto'),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(5),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Sign In',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: ScreenUtil.getInstance().setSp(20),
                  fontFamily: 'Roboto',
                  color: const Color(0xFF007FFD),
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
        // verifyPhone();
        Navigator.pushReplacement(
            context, CustomFadeTransition(widget: AccountSetupScreen()));
      },
      color: const Color(0xFF007FFD),
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: const Color(0xFF007FFD))));

  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: widget.verificationId,
        // smsCode: pinOtp,
        smsCode: "123456",
      );
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      setState(() {
        isLoading = true;
      });
      Navigator.pushReplacement(
          context, CustomFadeTransition(widget: AccountSetupScreen()));
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("error $e");
    }
  }
}
