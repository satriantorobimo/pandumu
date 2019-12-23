import 'package:flutter/material.dart';
import 'package:pandumu/profile_pic/screen/profile_pic.dart';

class TravelMartScreen extends StatefulWidget {
  const TravelMartScreen({Key key}) : super(key: key);

  @override
  _TravelMartScreenState createState() => _TravelMartScreenState();
}

class _TravelMartScreenState extends State<TravelMartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelMart'),
        centerTitle: true,
        leading: ProfilePic(),
        actions: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            margin: const EdgeInsets.only(bottom: 8),
            child: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
