import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/screen/ask_locals/screen/ask_locals.dart';
import 'package:pandumu/screen/home/screen/home.dart';
import 'package:pandumu/screen/travelmart/screen/travelmart.dart';
import 'package:pandumu/screen/travelog/screen/travelog.dart';
import 'package:pandumu/screen/tripmate/screen/tripmate.dart';
import 'package:pandumu/util/color.dart';

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
        selectedItemColor: blueLight,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_bar/home_off.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              activeIcon: Image.asset(
                "assets/icons/bottom_bar/home_on.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              title: Text('Home',
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)))),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_bar/travelog_off.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              activeIcon: Image.asset(
                "assets/icons/bottom_bar/travelog_on.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              title: Text('Travelog',
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)))),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_bar/tripmate_off.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              activeIcon: Image.asset(
                "assets/icons/bottom_bar/tripmate_on.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              title: Text('TripMate',
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)))),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_bar/asklocals_off.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              activeIcon: Image.asset(
                "assets/icons/bottom_bar/asklocals_on.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              title: Text('Ask Locals',
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)))),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/bottom_bar/travelmart_off.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              activeIcon: Image.asset(
                "assets/icons/bottom_bar/travelmart_on.png",
                width: ScreenUtil.getInstance().setWidth(24),
                height: ScreenUtil.getInstance().setHeight(24),
                fit: BoxFit.contain,
                scale: 1,
              ),
              title: Text('TravelMart',
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)))),
        ],
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
