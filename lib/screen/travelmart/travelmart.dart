import 'package:flutter/material.dart';

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
      ),
    );
  }
}
