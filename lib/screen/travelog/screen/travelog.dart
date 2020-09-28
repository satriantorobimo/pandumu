import 'package:flutter/material.dart';
import 'package:pandumu/screen/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/screen/travelog/screen/review/all.dart';
import 'package:pandumu/screen/travelog/screen/review/blog.dart';
import 'package:pandumu/screen/travelog/screen/review/log.dart';
import 'package:pandumu/screen/travelog/screen/review/review.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/drawer.dart';
import 'package:pandumu/util/bottom_sheet.dart' as btm;

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

  ScrollController _scrollViewController;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
        key: _scaffoldKey,
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Image.asset(
            "assets/images/add_new_post.png",
            fit: BoxFit.contain,
            scale: 4,
          ),
          backgroundColor: blueLight,
          onPressed: () {
            btm.settingModalBottomSheet(context);
          },
        ),
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Travelog'),
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
                pinned: false,
                snap: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: Column(
            // Column
            children: <Widget>[
              Container(
                color: whiteSmoke, // Tab Bar color change
                child: TabBar(
                  isScrollable: false,
                  controller: controller,
                  unselectedLabelColor: Colors.grey,
                  labelColor: blueLight,
                  indicatorWeight: 2,
                  indicatorColor: blueLight,
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
                    LogScreen(),
                    BlogScreen(),
                    ReviewScreen(),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
