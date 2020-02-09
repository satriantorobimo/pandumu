import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditLocationScreen extends StatefulWidget {
  final String currentLocation;

  EditLocationScreen({Key key, this.currentLocation}) : super(key: key);

  @override
  _EditLocationScreenState createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  TextEditingController locationController = TextEditingController();

  String search = "";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F6),
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () {
            if (widget.currentLocation == null)
              Navigator.pop(context);
            else
              Navigator.pop(context, widget.currentLocation);
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
              child: search.length < 3
                  ? checkDisableButton()
                  : checkEnableButton()),
        ],
        title: Text("Location"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.getInstance().setWidth(16)),
                child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: locationController,
                    onChanged: (text) {
                      if (text.length < 3) {
                        setState(() {
                          search = "";
                        });
                      } else {
                        setState(() {
                          search = text;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Add your location',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(14)),
                        suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(Icons.close,
                                size: ScreenUtil.getInstance().setSp(16)),
                            onPressed: () {
                              setState(() {
                                search = "";
                              });
                              locationController.clear();
                            }))),
              )),
          SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
          search == "" || search.length < 3
              ? Container()
              : Expanded(
                  child: Container(
                    color: Colors.white,
                    child: StreamBuilder(
                        stream: Firestore.instance
                            .collection("district")
                            .orderBy("nama")
                            // .where("nama", isGreaterThanOrEqualTo: search)
                            // .where("nama", isLessThanOrEqualTo: search)
                            .snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        Divider(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                padding: const EdgeInsets.only(top: 5.0),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot ds =
                                      snapshot.data.documents[index];
                                  return GestureDetector(
                                    onTap: () =>
                                        locationController.text = ds["nama"],
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(ds["nama"]),
                                    ),
                                  );
                                });
                          }
                          return Container();
                        }),
                  ),
                )
        ],
      ),
    );
  }

  Widget checkDisableButton() => OutlineButton(
        child: Text(
          'Done',
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
        'Done',
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil.getInstance().setSp(14),
        ),
      ),
      onPressed: () {
        Navigator.pop(context, locationController.text);
      },
      color: const Color(0xFF00BEFF),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: const Color(0xFF00BEFF))));
}
