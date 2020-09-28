import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/util/color.dart';

class ReviewFormScreen extends StatefulWidget {
  final String form;

  const ReviewFormScreen({Key key, this.form}) : super(key: key);
  @override
  _ReviewFormScreenState createState() => _ReviewFormScreenState();
}

class _ReviewFormScreenState extends State<ReviewFormScreen> {
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
      body: Column(
        children: <Widget>[
          Container(
            color: whiteSmoke,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text("Your Review"),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[],
              ),
            ),
          )
        ],
      ),
    );
  }
}
