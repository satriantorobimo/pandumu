import 'package:flutter/material.dart';
import 'package:pandumu/screen/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/screen/tripmate/screen/feeds/invitations.dart';
import 'package:pandumu/screen/tripmate/screen/joined/joined.dart';
import 'package:pandumu/util/color.dart';
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
            color: whiteSmoke, // Tab Bar color change
            child: TabBar(
              controller: controller,
              unselectedLabelColor: Colors.grey,
              labelColor: blueLight,
              indicatorWeight: 2,
              indicatorColor: blueLight,
              tabs: <Widget>[
                Tab(
                  child: Text("Invitations"),
                ),
                Tab(
                  child: Text("Joined"),
                ),
                Tab(
                  child: Text("Let's Trip!"),
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
                InvitationsScreen(),
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
