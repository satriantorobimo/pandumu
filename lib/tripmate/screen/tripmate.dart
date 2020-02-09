import 'package:flutter/material.dart';
import 'package:pandumu/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/tripmate/screen/feeds/feeds.dart';
import 'package:pandumu/tripmate/screen/joined/joined.dart';
import 'package:pandumu/util/drawer.dart';

class TripMateScreen extends StatefulWidget {
  const TripMateScreen({Key key}) : super(key: key);

  @override
  _TripMateScreenState createState() => _TripMateScreenState();
}

class _TripMateScreenState extends State<TripMateScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  bool tab1 = false;
  bool tab2 = false;
  bool tab3 = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('TripMate'),
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
      body: Column(
        // Column
        children: <Widget>[
          Container(
            color: const Color(0xFFF1F5F6), // Tab Bar color change
            child: TabBar(
              controller: controller,
              unselectedLabelColor: Colors.grey,
              labelColor: const Color(0xFF18B8EF),
              indicatorWeight: 2,
              indicatorColor: const Color(0xFF18B8EF),
              tabs: <Widget>[
                Tab(
                  child: Text("Feeds"),
                ),
                Tab(
                  child: Text("Joined"),
                ),
                Tab(
                  child: Text("Ajak Jalan"),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: TabBarView(
              // Tab Bar View
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: <Widget>[
                FeedsScreen(),
                JoinedScreen(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
