import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/util/bottom_sheet.dart' as btm;
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/custom_icons.dart';
import 'package:pandumu/util/navigation_bar_controller.dart';

class ProfileScreen extends StatefulWidget {
  final String userid;

  const ProfileScreen({Key key, this.userid}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int _index;
  final databaseReference = Firestore.instance;
  bool loading = false;
  String name = '',
      username = '',
      bio = '',
      bpTitle = '',
      bpContent = '',
      joined = '',
      location = '';

  @override
  void initState() {
    setState(() {
      _index = 3;
    });
    getData();
    controller = TabController(vsync: this, length: 4, initialIndex: 3);
    controller.addListener(_handleTabSelection);
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
      backgroundColor: Color(0xFFF1F5F6),
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
                margin: EdgeInsets.only(bottom: 2),
                color: Colors.white,
                child: TabBar(
                  controller: controller,
                  unselectedLabelColor: Colors.grey,
                  labelColor: blueLight,
                  indicatorColor: blueLight,
                  tabs: <Widget>[
                    Tab(
                      child: Image.asset(
                        _index == 0
                            ? "assets/icons/bottom_bar/travelog_on.png"
                            : "assets/icons/bottom_bar/travelog_off.png",
                        width: ScreenUtil.getInstance().setWidth(24),
                        height: ScreenUtil.getInstance().setHeight(24),
                        fit: BoxFit.contain,
                        scale: 1,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.image,
                          size: ScreenUtil.getInstance().setWidth(24)),
                    ),
                    Tab(
                      child: Image.asset(
                        _index == 2
                            ? "assets/icons/bottom_bar/travelmart_on.png"
                            : "assets/icons/bottom_bar/travelmart_off.png",
                        width: ScreenUtil.getInstance().setWidth(24),
                        height: ScreenUtil.getInstance().setHeight(24),
                        fit: BoxFit.contain,
                        scale: 1,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.account_circle,
                          size: ScreenUtil.getInstance().setWidth(24)),
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
                    _profile(),
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

  Widget _profile() {
    return SingleChildScrollView(
      child: loading
          ? Container(width: 50, height: 50, child: CircularProgressIndicator())
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: _cardOne()),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: _cardTwo())
              ],
            ),
    );
  }

  _handleTabSelection() {
    setState(() {
      _index = controller.index;
    });
  }

  Widget _cardTwo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(bpTitle,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(20),
                  color: bluePrimary)),
          SizedBox(height: 20.0),
          Text(bpContent,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(14),
                  color: Colors.black))
        ],
      );

  Widget _cardOne() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 5.0),
                  Text('@$username', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/icons/star_full.png",
                        fit: BoxFit.contain,
                        width: ScreenUtil.getInstance().setWidth(24),
                      ),
                      Image.asset(
                        "assets/icons/star_full.png",
                        fit: BoxFit.contain,
                        width: ScreenUtil.getInstance().setWidth(24),
                      ),
                      Image.asset(
                        "assets/icons/star_full.png",
                        fit: BoxFit.contain,
                        width: ScreenUtil.getInstance().setWidth(24),
                      ),
                      Image.asset(
                        "assets/icons/star_full.png",
                        fit: BoxFit.contain,
                        width: ScreenUtil.getInstance().setWidth(24),
                      ),
                      Image.asset(
                        "assets/icons/star_half.png",
                        fit: BoxFit.contain,
                        width: ScreenUtil.getInstance().setWidth(24),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Custom.chat,
                        size: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('137',
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                ],
              ),
              OutlineButton(
                  child: Text("Edit Profile",
                      style: TextStyle(fontSize: 12, color: bluePrimaryLight)),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  borderSide: BorderSide(color: bluePrimaryLight))
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            bio,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Icon(Icons.link, size: 16, color: Colors.grey),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "pagista.tumblr.com",
                style: TextStyle(fontSize: 12, color: blueLightSecond),
              ),
              SizedBox(
                width: 16.0,
              ),
              Icon(Icons.pin_drop, size: 16, color: Colors.grey),
              SizedBox(
                width: 5.0,
              ),
              Text(location,
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Joined $joined",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Text(
                "377",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Following",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                "241",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Followers",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      );

  void getData() {
    setState(() {
      loading = true;
    });
    databaseReference
        .collection('user')
        .document(widget.userid)
        .snapshots()
        .listen((data) async {
      setState(() {
        name = data.data['name'];
        username = data.data['username'];
        bio = data.data['bio'];
        bpTitle = data.data['bpTitle'];
        bpContent = data.data['bpContent'];
        joined = data.data['joined'];
        location = data.data['location'];
        loading = false;
      });
    }).onError((error) {
      print('Error pas dapet data');
    });
  }
}
