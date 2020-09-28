import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePic extends StatelessWidget {
  final num marginBottom;
  final num marginLeft;
  final num marginTop;
  final num width;
  final num height;

  const ProfilePic(
      {Key key,
      @required this.marginBottom,
      @required this.marginLeft,
      @required this.marginTop,
      @required this.width,
      @required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Container(
        margin: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(marginLeft),
            bottom: ScreenUtil.getInstance().setHeight(marginBottom),
            top: ScreenUtil.getInstance().setHeight(marginTop)),
        width: ScreenUtil.getInstance().setWidth(width),
        height: ScreenUtil.getInstance().setHeight(height),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/images/pp.jpg"))));
  }
}
