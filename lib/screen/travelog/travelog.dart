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
      ),
    );
  }
}