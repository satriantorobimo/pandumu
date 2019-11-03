import 'package:flutter/material.dart';

class AskLocalsScreen extends StatefulWidget {
  const AskLocalsScreen({Key key}) : super(key: key);

  @override
  _AskLocalsScreenState createState() => _AskLocalsScreenState();
}

class _AskLocalsScreenState extends State<AskLocalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Locals'),
        centerTitle: true,
      ),
    );
  }
}
