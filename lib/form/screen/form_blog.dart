import 'package:pandumu/util/custom_image_delegate.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/util/color.dart';
import 'package:zefyr/zefyr.dart';

class FormBlogScreen extends StatefulWidget {
  @override
  _FormBlogScreenState createState() => _FormBlogScreenState();
}

class _FormBlogScreenState extends State<FormBlogScreen> {
  /// Allows to control the editor and the document.
  ZefyrController _controller;

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Here we must load the document and pass it to Zefyr controller.
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  /// Loads the document to be edited in Zefyr.
  NotusDocument _loadDocument() {
    // For simplicity we hardcode a simple document with one line of text
    // saying "Zefyr Quick Start".
    // (Note that delta must always end with newline.)
    final Delta delta = Delta()
      ..insert("Summarize your story in a clear catchy sentence\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    final editor = new ZefyrEditor(
      focusNode: _focusNode,
      controller: _controller,
      imageDelegate: CustomImageDelegate(),
      padding: EdgeInsets.all(16),
    );
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
      body: ZefyrScaffold(
        child: editor,
      ),
    );
  }
}
