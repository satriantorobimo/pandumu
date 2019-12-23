import 'package:flutter/material.dart';
import 'package:pandumu/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/travelog/screen/review/all.dart';
import 'package:pandumu/travelog/screen/review/review.dart';

class TravelogScreen extends StatefulWidget {
  const TravelogScreen({Key key}) : super(key: key);

  @override
  _TravelogScreenState createState() => _TravelogScreenState();
}

class _TravelogScreenState extends State<TravelogScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  bool tab1 = false;
  bool tab2 = false;
  bool tab3 = false;
  bool tab4 = false;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 5);
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
        title: Text('Travelog'),
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
        child: Image.asset(
          "assets/images/add_new_post.png",
          fit: BoxFit.contain,
          scale: 4,
        ),
        backgroundColor: Color(0xFF18B8EF),
        onPressed: () {},
      ),
      body: Column(
        // Column
        children: <Widget>[
          Container(
            color: const Color(0xFFF1F5F6), // Tab Bar color change
            child: TabBar(
              isScrollable: false,
              controller: controller,
              unselectedLabelColor: Colors.grey,
              labelColor: const Color(0xFF18B8EF),
              indicatorWeight: 2,
              indicatorColor: const Color(0xFF18B8EF),
              onTap: (a) {
                print(a);
                if (a == 1) {
                  setState(() {
                    tab1 = true;
                    tab2 = false;
                    tab3 = false;
                    tab4 = false;
                  });
                } else if (a == 2) {
                  setState(() {
                    tab1 = false;
                    tab2 = true;
                    tab3 = false;
                    tab4 = false;
                  });
                } else if (a == 3) {
                  setState(() {
                    tab1 = false;
                    tab2 = false;
                    tab3 = true;
                    tab4 = false;
                  });
                } else if (a == 4) {
                  setState(() {
                    tab1 = false;
                    tab2 = false;
                    tab3 = false;
                    tab4 = true;
                  });
                } else {
                  setState(() {
                    tab1 = false;
                    tab2 = false;
                    tab3 = false;
                    tab4 = false;
                  });
                }
              },
              tabs: <Widget>[
                Tab(
                  child: Text("All"),
                ),
                Tab(
                  child: !tab1
                      ? Image.asset(
                          "assets/icons/travelog/log_off.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          scale: 1,
                        )
                      : Image.asset(
                          "assets/icons/travelog/log_on.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          scale: 1,
                        ),
                ),
                Tab(
                  child: !tab2
                      ? Image.asset(
                          "assets/icons/travelog/blog_off.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          scale: 1,
                        )
                      : Image.asset(
                          "assets/icons/travelog/blog_on.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          scale: 1,
                        ),
                ),
                Tab(
                  child: !tab3
                      ? Image.asset(
                          "assets/icons/travelog/review_off.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          scale: 1,
                        )
                      : Image.asset(
                          "assets/icons/travelog/review_on.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          scale: 1,
                        ),
                ),
                Tab(
                  child: !tab4
                      ? Image.asset(
                          "assets/icons/travelog/itinerary_off.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          scale: 1,
                        )
                      : Image.asset(
                          "assets/icons/travelog/itinerary_on.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                          scale: 1,
                        ),
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
                ReviewAllScreen(),
                Container(),
                Container(),
                ReviewScreen(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
