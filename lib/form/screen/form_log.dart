import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/util/color.dart';

class FormLogScreen extends StatefulWidget {
  @override
  _FormLogScreenState createState() => _FormLogScreenState();
}

class _FormLogScreenState extends State<FormLogScreen> {
  TextEditingController composeController = TextEditingController();

  String compose = "";

  @override
  void dispose() {
    super.dispose();
    composeController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Container(
              padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(12),
                left: ScreenUtil.getInstance().setWidth(12),
                right: ScreenUtil.getInstance().setWidth(12),
                bottom: ScreenUtil.getInstance().setHeight(12),
              ),
              child: FlatButton(
                  child: Text(
                    'Publish',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.getInstance().setSp(14),
                    ),
                  ),
                  onPressed: () {},
                  color: blueLightSecond,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: blueLightSecond)))),
        ],
        title: OutlineButton(
          child: Text(
            'Save as Draft',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().setSp(14),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          borderSide: BorderSide(color: Colors.white),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(
                  ScreenUtil.getInstance().setWidth(16))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ProfilePic(
                height: 32,
                width: 32,
                marginBottom: 0,
                marginTop: 0,
                marginLeft: 0),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                maxLines: null,
                controller: composeController,
                onSubmitted: (text) {
                  setState(() {
                    compose = text;
                  });
                },
                decoration: InputDecoration.collapsed(
                    hintText: "What’s to share?",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: ScreenUtil.getInstance().setSp(12))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
