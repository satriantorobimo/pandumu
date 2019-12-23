import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/navigation_bar_controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  height: ScreenUtil.getInstance().setHeight(150),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/beach.jpg"),
                    ),
                  )),
              Container(
                color: const Color(0xFFF1F5F6), // Tab Bar color change
                child: TabBar(
                  controller: controller,
                  unselectedLabelColor: Colors.grey,
                  labelColor: const Color(0xFF18B8EF),
                  indicatorColor: const Color(0xFF18B8EF),
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        "Travelog",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(12)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(12)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Shop & Services",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(12)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(12)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: TabBarView(
                  // Tab Bar View
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  children: <Widget>[
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: ScreenUtil.getInstance().setHeight(60),
              right: ScreenUtil.getInstance().setWidth(15),
              child: Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFDFF1F2),
                  border: Border.all(
                      color: Colors.white,
                      width: ScreenUtil.getInstance().setWidth(3)),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/images/pp.jpg"),
                  ),
                ),
                width: ScreenUtil.getInstance().setWidth(75),
                height: ScreenUtil.getInstance().setHeight(75),
              )),
          Positioned(
              top: ScreenUtil.getInstance().setHeight(75),
              left: ScreenUtil.getInstance().setWidth(15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      CustomFadeTransition(
                          widget: BottomNavigationBarController()));
                },
                child: Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  width: ScreenUtil.getInstance().setWidth(35),
                  height: ScreenUtil.getInstance().setHeight(35),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
