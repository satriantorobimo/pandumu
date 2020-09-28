import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/util/color.dart';

class NameWidget extends StatelessWidget {
  final String name;

  const NameWidget({Key key, this.name}) : super(key: key);
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
              child: Text("Name",
                  style:
                      TextStyle(fontSize: ScreenUtil.getInstance().setSp(16)))),
          Text(name,
              style: TextStyle(
                  color: blueLightSecond,
                  fontSize: ScreenUtil.getInstance().setSp(16))),
        ],
      ),
    );
  }
}
