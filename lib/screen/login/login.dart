import 'package:flutter/material.dart';
import 'package:pandumu/util/navigation_bar_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _buildPageContent() {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: const Color(0xFFF1F5F6),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
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
              )),
              SizedBox(
                height: 50,
              ),
              ListTile(
                  title: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    hintText: "Email address",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    )),
              )),
              Divider(
                color: Colors.grey.shade600,
              ),
              ListTile(
                  title: TextField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    )),
              )),
              Divider(
                color: Colors.grey.shade600,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavigationBarController()));
                      },
                      color: Color(0xFF18B8EF),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Forgot your password?',
                style: TextStyle(color: Colors.grey.shade500),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(),
    );
  }
}
