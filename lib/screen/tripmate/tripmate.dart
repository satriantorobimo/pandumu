import 'package:flutter/material.dart';

class TripMateScreen extends StatefulWidget {
  const TripMateScreen({Key key}) : super(key: key);

  @override
  _TripMateScreenState createState() => _TripMateScreenState();
}

class _TripMateScreenState extends State<TripMateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TripMate'),
        centerTitle: true,
      ),
    );
  }
}
