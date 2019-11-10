import 'package:flutter/material.dart';

class TravelogScreen extends StatefulWidget {
  const TravelogScreen({Key key}) : super(key: key);

  @override
  _TravelogScreenState createState() => _TravelogScreenState();
}

class _TravelogScreenState extends State<TravelogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travelog'),
        centerTitle: true,
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
