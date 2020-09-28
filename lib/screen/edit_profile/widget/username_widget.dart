import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/util/color.dart';

class UsernameWidget extends StatelessWidget {
  final String userName;

  const UsernameWidget({Key key, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(16))),
          ),
          Text("@" + userName,
              style: TextStyle(
                  color: blueLightSecond,
                  fontSize: ScreenUtil.getInstance().setSp(16))),
        ],
      ),
    );
  }
}
