import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/screen/detail/widget/log_detail_screen.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String type;

  const DetailScreen({Key key, this.title, this.type}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(50),
            height: ScreenUtil.getInstance().setHeight(50),
            margin:
                EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(8)),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: widget.type == 'log' ? LogDetailScreen() : Container(),
    );
  }
}
