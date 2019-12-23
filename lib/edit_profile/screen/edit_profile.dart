import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/pop_up/screen/edit_bod_screen.dart';
import 'package:pandumu/pop_up/screen/edit_bussines_profile.dart';
import 'package:pandumu/pop_up/screen/edit_location_screen.dart';
import 'package:pandumu/profile/screen/profile.dart';
import 'package:pandumu/util/custom_fade_transition.dart';

class EditPtofileScreen extends StatefulWidget {
  @override
  _EditPtofileScreenState createState() => _EditPtofileScreenState();
}

class _EditPtofileScreenState extends State<EditPtofileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        leading: Icon(Icons.close),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setHeight(12),
              left: ScreenUtil.getInstance().setWidth(12),
              right: ScreenUtil.getInstance().setWidth(12),
              bottom: ScreenUtil.getInstance().setHeight(12),
            ),
            child: OutlineButton(
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.getInstance().setSp(14),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context, CustomFadeTransition(widget: ProfileScreen()));
              },
              borderSide: BorderSide(color: Colors.white),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(
                      ScreenUtil.getInstance().setWidth(16))),
            ),
          ),
        ],
      ),
      body: Stack(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(125),
                color: const Color(0xFF899899),
                child: Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: ScreenUtil.getInstance().setHeight(45),
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(12),
                  left: ScreenUtil.getInstance().setWidth(12),
                  right: ScreenUtil.getInstance().setWidth(12),
                  bottom: ScreenUtil.getInstance().setHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.getInstance().setWidth(120),
                      child: Text("Username",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(16))),
                    ),
                    Text("@pandumu",
                        style: TextStyle(
                            color: const Color(0xFF00BEFF),
                            fontSize: ScreenUtil.getInstance().setSp(16))),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: ScreenUtil.getInstance().setHeight(45),
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(12),
                  left: ScreenUtil.getInstance().setWidth(12),
                  right: ScreenUtil.getInstance().setWidth(12),
                  bottom: ScreenUtil.getInstance().setHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: ScreenUtil.getInstance().setWidth(120),
                        child: Text("Name",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(16)))),
                    Text("Teman Jalan",
                        style: TextStyle(
                            color: const Color(0xFF00BEFF),
                            fontSize: ScreenUtil.getInstance().setSp(16))),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: ScreenUtil.getInstance().setHeight(70),
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(12),
                  left: ScreenUtil.getInstance().setWidth(12),
                  right: ScreenUtil.getInstance().setWidth(12),
                  bottom: ScreenUtil.getInstance().setHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: ScreenUtil.getInstance().setWidth(120),
                        child: Text("Bio",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(16)))),
                    Text("Briefly tell about yourself",
                        style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            fontSize: ScreenUtil.getInstance().setSp(16))),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: ScreenUtil.getInstance().setHeight(45),
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(12),
                  left: ScreenUtil.getInstance().setWidth(12),
                  right: ScreenUtil.getInstance().setWidth(12),
                  bottom: ScreenUtil.getInstance().setHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.getInstance().setWidth(120),
                      child: Text("Location",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(16))),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(185),
                      child: Text("Location",
                          style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(16))),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CustomFadeTransition(
                                  widget: EditLocationScreen()));
                        },
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: ScreenUtil.getInstance().setSp(24)),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: ScreenUtil.getInstance().setHeight(45),
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(12),
                  left: ScreenUtil.getInstance().setWidth(12),
                  right: ScreenUtil.getInstance().setWidth(12),
                  bottom: ScreenUtil.getInstance().setHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.getInstance().setWidth(120),
                      child: Text("Birth Date",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(16))),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(185),
                      child: Text("Add your date of birth",
                          style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(16))),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CustomFadeTransition(widget: EditBodScreen()));
                        },
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: ScreenUtil.getInstance().setSp(24)),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: ScreenUtil.getInstance().setHeight(40),
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(12),
                  left: ScreenUtil.getInstance().setWidth(12),
                  right: ScreenUtil.getInstance().setWidth(12),
                  bottom: ScreenUtil.getInstance().setHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Business Profile",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16))),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CustomFadeTransition(
                                widget: BussinessProfileScreen()));
                      },
                      child: Text("Edit",
                          style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(16))),
                    ),
                  ],
                ),
              ),
              Divider()
            ],
          ),
          Positioned(
              top: ScreenUtil.getInstance().setHeight(28),
              right: ScreenUtil.getInstance().setWidth(15),
              child: Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFDFF1F2),
                  border: Border.all(
                      color: Colors.white,
                      width: ScreenUtil.getInstance().setWidth(2)),
                ),
                width: ScreenUtil.getInstance().setHeight(80),
                height: ScreenUtil.getInstance().setWidth(80),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
