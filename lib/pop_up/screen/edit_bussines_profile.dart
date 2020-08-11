import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/util/color.dart';

class BussinessProfileScreen extends StatefulWidget {
  @override
  _BussinessProfileScreenState createState() => _BussinessProfileScreenState();
}

class _BussinessProfileScreenState extends State<BussinessProfileScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  String title = "";
  String content = "";

  bool onTitleEdit = false;
  bool onContentEdit = false;

  @override
  void dispose() {
    super.dispose();
    titleController?.dispose();
    contentController?.dispose();
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
                  onPressed: () {
                    List<String> data = [];
                    data.add(title);
                    data.add(content);
                    Navigator.pop(context, data);
                  },
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
              child: Text(
                  "Write your travel business profile. Convince people to use your services and buy your products."),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  title == ""
                      ? Container(
                          child: Text("Title",
                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(16),
                                  color: blueLightSecond)),
                        )
                      : Container(),
                  title == ""
                      ? Container(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            maxLength: 74,
                            controller: titleController,
                            onSubmitted: (text) {
                              setState(() {
                                title = text;
                              });
                            },
                            decoration: InputDecoration.collapsed(
                                hintText:
                                    "Summarize your profile in a clear catchy sentence",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(12))),
                          ),
                        )
                      : GestureDetector(
                          child: Container(
                            child: Text(title,
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(20),
                                    color: blueLightSecond)),
                          ),
                          onTap: () {
                            setState(() {
                              titleController.text = title;
                              title = "";
                              print("Title : $title");
                            });
                          },
                        ),
                  SizedBox(height: 35),
                  content == ""
                      ? Container(
                          child: Text("Content",
                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(16),
                                  color: blueLightSecond)),
                        )
                      : Container(),
                  content == ""
                      ? Container(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            maxLines: null,
                            maxLength: 300,
                            controller: contentController,
                            onSubmitted: (text) {
                              setState(() {
                                content = text;
                              });
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: "Tell them your strength",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(12))),
                          ),
                        )
                      : GestureDetector(
                          child: Container(
                            child: Text(content,
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(18),
                                    color: Colors.black)),
                          ),
                          onTap: () {
                            setState(() {
                              contentController.text = content;
                              content = "";
                            });
                          },
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
