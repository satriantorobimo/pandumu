import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pandumu/home/screen/home.dart';
import 'package:pandumu/pop_up/screen/edit_bod_screen.dart';
import 'package:pandumu/pop_up/screen/edit_bussines_profile.dart';
import 'package:pandumu/pop_up/screen/edit_location_screen.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/crop_circle.dart';
import 'package:pandumu/util/crop_rectangle.dart';
import 'package:pandumu/util/custom_fade_transition.dart';
import 'package:pandumu/util/model_register.dart';

class EditPtofileScreen extends StatefulWidget {
  final UserDataRegisModel userDataRegisModel;

  const EditPtofileScreen({Key key, this.userDataRegisModel}) : super(key: key);

  @override
  _EditPtofileScreenState createState() => _EditPtofileScreenState();
}

class _EditPtofileScreenState extends State<EditPtofileScreen> {
  File _imageHeader;
  File _imagePp;
  bool imageHeader = false;
  bool imagePp = false;
  String getBod = "";
  String getLocation = "";
  String getTitle = "";
  String getContent = "";

  final bioController = TextEditingController();
  final databaseReference = Firestore.instance;

  @override
  void dispose() {
    bioController.dispose();
    super.dispose();
  }

  Future getImageHeader(bool camera) async {
    var image;

    if (camera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() async {
      print("Image awal : $image");
      final result = await Navigator.push(
          context, CustomFadeTransition(widget: CropRectangle(images: image)));
      _imageHeader = result;
      print("Image cropped : $_imageHeader");
      imageHeader = true;
    });
  }

  Future getImagePp(bool camera) async {
    var image;

    if (camera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() async {
      final result = await Navigator.push(
          context, CustomFadeTransition(widget: CropCirlce(imagesPp: image)));
      _imagePp = result;
      imagePp = true;
    });
  }

  void _settingModalBottomSheet(context, String type) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        if (type == "header") {
                          getImageHeader(false);
                        } else {
                          getImagePp(false);
                        }
                        Navigator.pop(context);
                      }),
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Camera'),
                    onTap: () {
                      if (type == "header") {
                        getImageHeader(true);
                      } else {
                        getImagePp(true);
                      }
                      Navigator.pop(context);
                    },
                  ),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        leading: Icon(Icons.close),
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
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.getInstance().setSp(14),
                ),
              ),
              onPressed: () {
                _saveDataRegister();
              },
              borderSide: BorderSide(color: Colors.white),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(
                      ScreenUtil.getInstance().setWidth(16))),
            ),
          ),
        ],
      ),
      body: Stack(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _settingModalBottomSheet(context, "header");
                },
                child: Container(
                  height: ScreenUtil.getInstance().setHeight(125),
                  color: imageHeader ? Colors.transparent : darkGrey,
                  child: imageHeader
                      ? Image.file(_imageHeader, fit: BoxFit.cover)
                      : Center(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
          Container(
            margin:
                EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(125)),
            child: ListView(
              children: <Widget>[
                Container(
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
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(16))),
                      ),
                      Text("@" + widget.userDataRegisModel.userName,
                          style: TextStyle(
                              color: blueLightSecond,
                              fontSize: ScreenUtil.getInstance().setSp(16))),
                    ],
                  ),
                ),
                Divider(),
                Container(
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
                              style: TextStyle(
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(16)))),
                      Text(widget.userDataRegisModel.name,
                          style: TextStyle(
                              color: blueLightSecond,
                              fontSize: ScreenUtil.getInstance().setSp(16))),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: ScreenUtil.getInstance().setHeight(165),
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
                          child: Text("Bio",
                              style: TextStyle(
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(16)))),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(200),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: 8,
                          maxLength: 140,
                          controller: bioController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Briefly tell about yourself",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(16))),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: ScreenUtil.getInstance().setHeight(45),
                  padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(12),
                    left: ScreenUtil.getInstance().setWidth(12),
                    right: ScreenUtil.getInstance().setWidth(12),
                    bottom: ScreenUtil.getInstance().setHeight(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: ScreenUtil.getInstance().setWidth(120),
                        child: Text("Location",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(16))),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(185),
                        child: Text(
                            getLocation == "" ? "Location" : getLocation,
                            style: TextStyle(
                                color: getLocation == ""
                                    ? Colors.grey
                                    : blueLightSecond,
                                fontStyle:
                                    getLocation == "" ? FontStyle.italic : null,
                                fontSize: ScreenUtil.getInstance().setSp(16))),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(20),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push(
                                context,
                                CustomFadeTransition(
                                    widget: EditLocationScreen(
                                        currentLocation: getLocation)));
                            setState(() {
                              if (result != null) getLocation = result;
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: ScreenUtil.getInstance().setSp(24)),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: ScreenUtil.getInstance().setHeight(45),
                  padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(12),
                    left: ScreenUtil.getInstance().setWidth(12),
                    right: ScreenUtil.getInstance().setWidth(12),
                    bottom: ScreenUtil.getInstance().setHeight(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: ScreenUtil.getInstance().setWidth(120),
                        child: Text("Birth Date",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(16))),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(185),
                        child: Text(
                            getBod == "" ? "Add your date of birth" : getBod,
                            style: TextStyle(
                                color: getBod == ""
                                    ? Colors.grey
                                    : blueLightSecond,
                                fontStyle:
                                    getBod == "" ? FontStyle.italic : null,
                                fontSize: ScreenUtil.getInstance().setSp(16))),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(20),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push(
                                context,
                                CustomFadeTransition(
                                    widget: EditBodScreen(currentBod: getBod)));
                            print(result);
                            setState(() {
                              if (result != null) getBod = result;
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: ScreenUtil.getInstance().setSp(24)),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: ScreenUtil.getInstance().setHeight(45),
                  padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(12),
                    left: ScreenUtil.getInstance().setWidth(12),
                    right: ScreenUtil.getInstance().setWidth(12),
                    bottom: ScreenUtil.getInstance().setHeight(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: ScreenUtil.getInstance().setWidth(120),
                        child: Text("Business Profile",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(16))),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(20),
                        child: GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push(
                                context,
                                CustomFadeTransition(
                                    widget: BussinessProfileScreen()));
                            List data = result;
                            setState(() {
                              getTitle = data[0].toString();
                              getContent = data[1].toString();
                            });
                          },
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: ScreenUtil.getInstance().setSp(24)),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                getTitle != ""
                    ? Container(
                        padding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(12),
                          left: ScreenUtil.getInstance().setWidth(12),
                          right: ScreenUtil.getInstance().setWidth(12),
                          bottom: ScreenUtil.getInstance().setHeight(12),
                        ),
                        child: Text(getTitle,
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(20),
                                color: blueLightSecond)),
                      )
                    : Container(),
                getContent != ""
                    ? Container(
                        padding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(12),
                          left: ScreenUtil.getInstance().setWidth(12),
                          right: ScreenUtil.getInstance().setWidth(12),
                          bottom: ScreenUtil.getInstance().setHeight(12),
                        ),
                        child: Text(getContent,
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: Colors.black)),
                      )
                    : Container()
              ],
            ),
          ),
          Positioned(
              top: ScreenUtil.getInstance().setHeight(28),
              right: ScreenUtil.getInstance().setWidth(15),
              child: GestureDetector(
                onTap: () {
                  _settingModalBottomSheet(context, "pp");
                },
                child: Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        imagePp ? Colors.transparent : const Color(0xFFDFF1F2),
                    border: Border.all(
                        color: Colors.white,
                        width: ScreenUtil.getInstance().setWidth(2)),
                  ),
                  width: ScreenUtil.getInstance().setHeight(80),
                  height: ScreenUtil.getInstance().setWidth(80),
                  child: imagePp
                      ? CircleAvatar(
                          radius: 10, backgroundImage: FileImage(_imagePp))
                      : Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                ),
              )),
        ],
      ),
    );
  }

  void _saveDataRegister() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM yyyy').format(now);

    DocumentReference ref = await databaseReference.collection("user").add({
      'username': widget.userDataRegisModel.userName,
      'name': widget.userDataRegisModel.name,
      'password': widget.userDataRegisModel.password,
      'email': widget.userDataRegisModel.email,
      'phone': widget.userDataRegisModel.phone,
      'bio': bioController.text,
      'location': getLocation,
      'bod': getBod,
      'bodShow': false,
      'bpTitle': getTitle,
      'bpContent': getContent,
      'gender': '',
      'joined': formattedDate
    }).catchError((e) {
      print('Error add data : $e');
    });
    Navigator.pushReplacement(
        context, CustomFadeTransition(widget: HomeScreen()));
  }
}
