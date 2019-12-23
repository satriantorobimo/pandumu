import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditBodScreen extends StatefulWidget {
  @override
  _EditBodScreenState createState() => _EditBodScreenState();
}

class _EditBodScreenState extends State<EditBodScreen> {
  TextEditingController bodController = TextEditingController();

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
                'Continue',
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
        title: Text("Birth Date"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.getInstance().setWidth(16)),
                child: TextField(
                    controller: bodController,
                    decoration: InputDecoration(
                      hintText: 'Add your date of birth',
                      border: InputBorder.none,
                      icon: Icon(Icons.calendar_today,
                          size: ScreenUtil.getInstance().setSp(16)),
                      hintStyle: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(14)),
                    )),
              )),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(100),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil.getInstance().setWidth(20)),
            child: Text(
              "Who sees this?",
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(18),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF899899)),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(10),
          ),
          Container(
              width: double.infinity,
              height: ScreenUtil.getInstance().setHeight(60),
              decoration: myBoxDecoration(),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.getInstance().setWidth(16),
                      top: ScreenUtil.getInstance().setHeight(8)),
                  child: Text(
                    "Month and day",
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(16),
                    ),
                  ))),
          Container(
              width: double.infinity,
              height: ScreenUtil.getInstance().setHeight(60),
              decoration: myBoxDecoration(),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.getInstance().setWidth(16),
                      top: ScreenUtil.getInstance().setHeight(8)),
                  child: Text(
                    "Year",
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(16),
                    ),
                  ))),
        ],
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1.0, color: const Color(0xFF899899)),
        ));
  }
}
