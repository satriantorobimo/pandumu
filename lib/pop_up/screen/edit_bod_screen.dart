import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pandumu/util/color.dart';

class EditBodScreen extends StatefulWidget {
  final String currentBod;

  EditBodScreen({Key key, this.currentBod}) : super(key: key);
  @override
  _EditBodScreenState createState() => _EditBodScreenState();
}

class _EditBodScreenState extends State<EditBodScreen> {
  TextEditingController bodController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String formattedDate = "";

  bool datePick = false;
  String setMontDay = "Only Me";
  String setYear = "Only Me";

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd MMMM yyyy').format(selectedDate);
        datePick = true;
      });
  }

  void _settingModalBottomSheet(context, int type) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Color(0xFF737373),
            height: ScreenUtil.getInstance().setHeight(265),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          type == 0 ? "Birth Month and Day" : "Birth Year",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Divider(),
                  Expanded(
                      child: ListView(
                    children: <Widget>[
                      _listBottomSheet(type, "Public", 0),
                      Divider(),
                      _listBottomSheet(type, "My followers", 1),
                      Divider(),
                      _listBottomSheet(type, "People I follow", 2),
                      Divider(),
                      _listBottomSheet(type, "We follow each other", 3),
                      Divider(),
                      _listBottomSheet(type, "Only Me", 4),
                    ],
                  ))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () {
            if (widget.currentBod == null)
              Navigator.pop(context);
            else
              Navigator.pop(context, widget.currentBod);
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
              child: formattedDate.length == 0
                  ? checkDisableButton()
                  : checkEnableButton()),
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
              padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.calendar_today,
                      size: ScreenUtil.getInstance().setSp(16),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil.getInstance().setWidth(10),
                  ),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      child: Text(
                          !datePick ? 'Add your date of birth' : formattedDate,
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color:
                                  !datePick ? Colors.grey : blueLightSecond)),
                    ),
                  )
                ],
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
                  color: darkGrey),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(10),
          ),
          Container(
              width: double.infinity,
              height: ScreenUtil.getInstance().setHeight(70),
              decoration: myBoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.getInstance().setWidth(16),
                          top: ScreenUtil.getInstance().setHeight(8)),
                      child: Text(
                        "Month and day",
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(16),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil.getInstance().setWidth(16),
                        top: ScreenUtil.getInstance().setHeight(8),
                        right: ScreenUtil.getInstance().setWidth(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil.getInstance().setWidth(120),
                          child: Text(setMontDay,
                              style: TextStyle(
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(12))),
                        ),
                        Container(
                          width: ScreenUtil.getInstance().setWidth(20),
                          child: GestureDetector(
                            onTap: () => _settingModalBottomSheet(context, 0),
                            child: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey,
                                size: ScreenUtil.getInstance().setSp(24)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Container(
              width: double.infinity,
              height: ScreenUtil.getInstance().setHeight(70),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.getInstance().setWidth(16),
                          top: ScreenUtil.getInstance().setHeight(8)),
                      child: Text(
                        "Year",
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(16),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil.getInstance().setWidth(16),
                        top: ScreenUtil.getInstance().setHeight(8),
                        right: ScreenUtil.getInstance().setWidth(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil.getInstance().setWidth(120),
                          child: Text(setYear,
                              style: TextStyle(
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(12))),
                        ),
                        Container(
                          width: ScreenUtil.getInstance().setWidth(20),
                          child: GestureDetector(
                            onTap: () => _settingModalBottomSheet(context, 1),
                            child: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey,
                                size: ScreenUtil.getInstance().setSp(24)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(15),
          ),
          Container(
            width: double.infinity,
            height: ScreenUtil.getInstance().setHeight(70),
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(16),
                    top: ScreenUtil.getInstance().setHeight(30)),
                child: Text(
                  "Remove Birth Date",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(12),
                      color: Colors.red),
                )),
          )
        ],
      ),
    );
  }

  Widget _listBottomSheet(int type, String text, int choose) {
    String _text = text;

    return GestureDetector(
      onTap: () {
        if (type == 0) {
          setState(() {
            setMontDay = _text;
          });
        } else {
          setState(() {
            setYear = _text;
          });
        }
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(20.0)),
                child: type == 0
                    ? _text == setMontDay
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          )
                        : Container(
                            width: 25,
                            height: 25,
                          )
                    : _text == setYear
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          )
                        : Container(
                            width: 25,
                            height: 25,
                          )),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil.getInstance().setWidth(50.0)),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1.0, color: darkGrey),
        ));
  }

  Widget checkDisableButton() => OutlineButton(
        child: Text(
          'Continue',
          style: TextStyle(
            color: Colors.grey,
            fontSize: ScreenUtil.getInstance().setSp(14),
          ),
        ),
        onPressed: null,
        borderSide: BorderSide(color: Colors.white),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      );

  Widget checkEnableButton() => FlatButton(
      child: Text(
        'Continue',
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil.getInstance().setSp(14),
        ),
      ),
      onPressed: () {
        Navigator.pop(context, formattedDate);
      },
      color: blueLightSecond,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: blueLightSecond)));
}
