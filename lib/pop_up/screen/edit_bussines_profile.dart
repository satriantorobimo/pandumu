import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BussinessProfileScreen extends StatefulWidget {
  @override
  _BussinessProfileScreenState createState() => _BussinessProfileScreenState();
}

class _BussinessProfileScreenState extends State<BussinessProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () {
            Navigator.pop(context);
          },
        ),
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
                'Publish',
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
    );
  }
}
