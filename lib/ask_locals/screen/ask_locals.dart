import 'package:flutter/material.dart';
import 'package:pandumu/ask_locals/screen/ask/ask.dart';
import 'package:pandumu/ask_locals/screen/chat/chat.dart';
import 'package:pandumu/ask_locals/screen/meet_traveler/meet_traveler.dart';
import 'package:pandumu/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/drawer.dart';

class AskLocalsScreen extends StatefulWidget {
  const AskLocalsScreen({Key key}) : super(key: key);

  @override
  _AskLocalsScreenState createState() => _AskLocalsScreenState();
}

class _AskLocalsScreenState extends State<AskLocalsScreen>
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
        title: Text('Ask Locals'),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.question_answer),
        // Image.asset(
        //   "assets/images/add_new_post.png",
        //   fit: BoxFit.contain,
        //   scale: 4,
        // ),
        backgroundColor: blueLight,
        onPressed: () {},
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
                  child: Text("Ask Locals"),
                ),
                Tab(
                  child: Text("Meet Travelers"),
                ),
                Tab(
                  child: Text("Chat"),
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
                AskScreen(),
                MeetTravelerScreen(),
                ChatScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
