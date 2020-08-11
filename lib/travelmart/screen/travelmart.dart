import 'package:flutter/material.dart';
import 'package:pandumu/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/util/drawer.dart';

class TravelMartScreen extends StatefulWidget {
  const TravelMartScreen({Key key}) : super(key: key);

  @override
  _TravelMartScreenState createState() => _TravelMartScreenState();
}

class _TravelMartScreenState extends State<TravelMartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('TravelMart'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => _scaffoldKey.currentState.openDrawer(),
          child: ProfilePic(
              height: 35,
              width: 35,
              marginBottom: 8,
              marginTop: 8,
              marginLeft: 16),
        ),
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
