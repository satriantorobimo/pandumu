import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/model/user/user_model.dart';
import 'package:pandumu/screen/login/screen/login2.dart';
import 'package:pandumu/screen/otp/screen/otp.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/model_register.dart';
import 'package:pandumu/provider/provider_auth.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final numberController = TextEditingController();
  final codeController = TextEditingController();
  String verificationId;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool enableButton = false;
  UserModel userModel = UserModel();

  final scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "scaffold-get-phone");

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    numberController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    codeController.text = "+62";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: scaffoldKey,
      backgroundColor: Colors.white,
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
    final loader = Provider.of<PhoneAuthDataProvider>(context).loading;
    return Container(
      height: ScreenUtil.getInstance().setHeight(225),
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
                  Text(
                    "Enter your mobile phone",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(14),
                        color: darkGrey),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            width: ScreenUtil.getInstance().setWidth(40),
                            child: Center(
                              child: TextField(
                                controller: codeController,
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(18)),
                                readOnly: true,
                              ),
                            )),
                        Container(
                          width: ScreenUtil.getInstance().setWidth(180),
                          child: TextField(
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(13),
                            ],
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(18)),
                            controller: Provider.of<PhoneAuthDataProvider>(
                                    context,
                                    listen: false)
                                .phoneNumberController,
                            onChanged: (text) {
                              print("Length : ${text.length}");
                              if (text.length >= 10) {
                                setState(() {
                                  enableButton = true;
                                });
                              } else {
                                setState(() {
                                  enableButton = false;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  Container(
                      width: ScreenUtil.getInstance().setWidth(120),
                      child: loader
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
          'Submit',
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
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil.getInstance().setSp(20),
        ),
      ),
      onPressed: () {
        userModel.phone = numberController.text;
        // TODO: Make a function for request OTP
        startPhoneAuth();
      },
      color: bluePrimaryLight,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: bluePrimaryLight)));

  Future<void> verifyPhone() async {
    String telp = "+62" + userModel.phone;
    bool isSent = false;
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: telp, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message}');
          });
      isSent = true;
    } catch (e) {
      // handleError(e);
      print("error $e");
    }
    if (isSent) {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
          context,
          CustomFadeTransition(
              widget: OtpScreen(
            userModel: userModel,
            verificationId: this.verificationId,
          )));
    } else {
      print("Is Sent $isSent");
      setState(() {
        isLoading = false;
      });
    }
  }

  // handleError(PlatformException error) {
  //   print(error);
  //   switch (error.code) {
  //     case 'ERROR_INVALID_VERIFICATION_CODE':
  //       FocusScope.of(context).requestFocus(new FocusNode());
  //       setState(() {
  //         errorMessage = 'Invalid Code';
  //       });
  //       Navigator.of(context).pop();
  //       smsOTPDialog(context).then((value) {
  //         print('sign in');
  //       });
  //       break;
  //     default:
  //       setState(() {
  //         errorMessage = error.message;
  //       });

  //       break;
  //   }
  // }

  _showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text('$text'),
    );
//    if (mounted) Scaffold.of(context).showSnackBar(snackBar);
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  startPhoneAuth() async {
    final phoneAuthDataProvider =
        Provider.of<PhoneAuthDataProvider>(context, listen: false);
    phoneAuthDataProvider.loading = true;
    // var countryProvider = Provider.of<CountryProvider>(context, listen: false);
    bool validPhone = await phoneAuthDataProvider.instantiate(
        dialCode: '+62',
        onCodeSent: () {
          Navigator.pushReplacement(
              context,
              CustomFadeTransition(
                  widget: OtpScreen(
                userModel: userModel,
              )));
        },
        onFailed: () {
          _showSnackBar(phoneAuthDataProvider.message);
        },
        onError: () {
          _showSnackBar(phoneAuthDataProvider.message);
        });
    if (!validPhone) {
      phoneAuthDataProvider.loading = false;
      _showSnackBar("Oops! Number seems invaild");
      return;
    }
  }
}
