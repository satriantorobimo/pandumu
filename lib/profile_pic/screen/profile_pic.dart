import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Container(
        margin: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(16),
            bottom: ScreenUtil.getInstance().setHeight(8),
            top: ScreenUtil.getInstance().setHeight(8)),
        width: ScreenUtil.getInstance().setWidth(35),
        height: ScreenUtil.getInstance().setHeight(35),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/images/pp.jpg"))));
  }
}
