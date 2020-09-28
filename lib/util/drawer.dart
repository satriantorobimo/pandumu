import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/screen/login/screen/login2.dart';
import 'package:pandumu/screen/profile/screen/profile.dart';
import 'package:pandumu/screen/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(250),
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ProfilePic(
                      height: 56,
                      width: 56,
                      marginBottom: 0,
                      marginTop: 0,
                      marginLeft: 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Kemala Pagista",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(18)),
                      ),
                      Text(
                        "@pagista",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(5)),
                  Row(
                    children: <Widget>[
                      Text("377",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(12),
                              color: Colors.black)),
                      SizedBox(width: ScreenUtil.getInstance().setWidth(2)),
                      Text("Following",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(12),
                              color: Colors.grey)),
                      SizedBox(width: ScreenUtil.getInstance().setWidth(10)),
                      Text("241",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(12),
                              color: Colors.black)),
                      SizedBox(width: ScreenUtil.getInstance().setWidth(2)),
                      Text("Followers",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(12),
                              color: Colors.grey)),
                    ],
                  )
                ],
              ),
              margin: EdgeInsets.only(bottom: 0.0),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: Text("Profile"),
                    leading: Icon(Icons.person),
                    onTap: () async {
                      var prefs = await SharedPreferences.getInstance();
                      String userid = prefs.getString('userid');
                      Navigator.pushReplacement(
                          context,
                          CustomFadeTransition(
                              widget: ProfileScreen(userid: userid)));
                    },
                  ),
                  ListTile(
                    title: Text("Bookmarks"),
                    leading: Icon(Icons.bookmark_border),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Shop & Services"),
                    leading: Icon(Icons.shopping_basket),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Purchares"),
                    leading: Icon(Icons.shopping_cart),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Revenues"),
                    leading: Icon(Icons.attach_money),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Drafts"),
                    leading: Icon(Icons.drafts),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Settings & Privacy"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Help"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Logout"),
                    onTap: () async {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isLogin', false);
                      prefs.remove('username');
                      Navigator.pushReplacement(context,
                          CustomFadeTransition(widget: LoginScreen2()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
