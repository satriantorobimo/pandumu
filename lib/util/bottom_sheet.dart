import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/screen/form/screen/form_blog.dart';
import 'package:pandumu/screen/form/screen/form_log.dart';
import 'package:pandumu/screen/form/screen/form_review.dart';
import 'package:pandumu/util/custom_fade_transition.dart';

void settingModalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Color(0xFF737373),
          height: ScreenUtil.getInstance().setHeight(400),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Write New Post",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Divider(),
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    listBottomSheet("main", "Log", 0, context),
                    Divider(),
                    listBottomSheet("main", "Blog", 1, context),
                    Divider(),
                    listBottomSheet("main", "Review", 2, context),
                    Divider(),
                    listBottomSheet("main", "Itinerary", 3, context),
                    Divider(),
                    listBottomSheet("main", "Ask Locals", 4, context),
                    Divider(),
                    listBottomSheet("main", "Trip Mate", 5, context),
                    Divider(),
                    listBottomSheet("main", "Request for Quotation", 6, context)
                  ],
                ))
              ],
            ),
          ),
        );
      });
}

void settingModalBottomSheetReview(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Color(0xFF737373),
          height: ScreenUtil.getInstance().setHeight(190),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Write New Post",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Divider(),
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    listBottomSheet("review", "Destination Review", 0, context),
                    Divider(),
                    listBottomSheet(
                        "review", "Accommodation Review", 1, context),
                    Divider(),
                    listBottomSheet(
                        "review", "Food/Culinary Review", 2, context),
                  ],
                ))
              ],
            ),
          ),
        );
      });
}

void settingModalBottomSheetAskLocal(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Color(0xFF737373),
          height: ScreenUtil.getInstance().setHeight(240),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Write New Post",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Divider(),
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    listBottomSheet("ask", "Destination Info", 0, context),
                    Divider(),
                    listBottomSheet("ask", "Accommodation Info", 1, context),
                    Divider(),
                    listBottomSheet("ask", "Food/Culinary Info", 2, context),
                    Divider(),
                    listBottomSheet(
                        "ask", "Route/Transportation Info", 3, context),
                  ],
                ))
              ],
            ),
          ),
        );
      });
}

Widget listBottomSheet(
    String type, String text, int choose, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (type == 'main') {
        if (choose == 2) {
          Navigator.pop(context);
          settingModalBottomSheetReview(context);
        } else if (choose == 4) {
          Navigator.pop(context);
          settingModalBottomSheetAskLocal(context);
        } else if (choose == 1) {
          Navigator.push(
              context, CustomFadeTransition(widget: FormBlogScreen()));
        } else if (choose == 0) {
          Navigator.push(
              context, CustomFadeTransition(widget: FormLogScreen()));
        }
      } else if (type == 'review') {
        if (choose == 0) {
          Navigator.push(context,
              CustomFadeTransition(widget: FormReview(type: 'destination')));
        } else if (choose == 1) {
          Navigator.push(context,
              CustomFadeTransition(widget: FormReview(type: 'accomodation')));
        } else if (choose == 2) {
          Navigator.push(
              context, CustomFadeTransition(widget: FormReview(type: 'food')));
        }
      } else if (type == 'ask') {}
    },
    child: Padding(
      padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(10.0)),
            child: Icon(Icons.ac_unit),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20.0)),
            child: Text(text),
          ),
        ],
      ),
    ),
  );
}
