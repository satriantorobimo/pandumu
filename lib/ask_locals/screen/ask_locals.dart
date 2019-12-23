import 'package:flutter/material.dart';
import 'package:pandumu/ask_locals/screen/ask/ask.dart';
import 'package:pandumu/ask_locals/screen/chat/chat.dart';
import 'package:pandumu/ask_locals/screen/meet_traveler/meet_traveler.dart';
import 'package:pandumu/profile_pic/screen/profile_pic.dart';

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
      appBar: AppBar(
        title: Text('Ask Locals'),
        centerTitle: true,
        leading: ProfilePic(),
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
        backgroundColor: Color(0xFF18B8EF),
        onPressed: () {},
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
