import 'package:flutter/material.dart';
import 'package:pandumu/screen/ask_locals/ask_locals.dart';
import 'package:pandumu/screen/home/home.dart';
import 'package:pandumu/screen/travelmart/travelmart.dart';
import 'package:pandumu/screen/travelog/travelog.dart';
import 'package:pandumu/screen/tripmate/tripmate.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    HomeScreen(
      key: PageStorageKey('home'),
    ),
    TravelogScreen(
      key: PageStorageKey('travelog'),
    ),
    TripMateScreen(
      key: PageStorageKey('tripmate'),
    ),
    AskLocalsScreen(
      key: PageStorageKey('asklocals'),
    ),
    TravelMartScreen(
      key: PageStorageKey('travelmart'),
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF18B8EF),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), title: Text('Travelog')),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_walk), title: Text('TripMate')),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), title: Text('Ask Locals')),
          BottomNavigationBarItem(
              icon: Icon(Icons.redeem), title: Text('TravelMart')),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
