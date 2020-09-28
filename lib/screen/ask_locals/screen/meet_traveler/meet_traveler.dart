import 'package:flutter/material.dart';

class MeetTravelerScreen extends StatefulWidget {
  @override
  _MeetTravelerScreenState createState() => _MeetTravelerScreenState();
}

class _MeetTravelerScreenState extends State<MeetTravelerScreen> {
  bool gridView = false;
  bool genderWomen = false;
  bool genderMen = false;
  bool star = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                            "assets/icons/meet_traveler_sort/location_off.png"),
                        Expanded(
                          child: Text(
                            "Mataram, Nusa Tenggara",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (star) {
                        setState(() {
                          star = false;
                        });
                      } else {
                        setState(() {
                          star = true;
                        });
                      }
                    },
                    child: !star
                        ? Image.asset(
                            "assets/icons/meet_traveler_sort/onlyguides_off.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/icons/meet_traveler_sort/onlyguides_on.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (genderWomen) {
                        setState(() {
                          genderWomen = false;
                        });
                      } else {
                        setState(() {
                          genderWomen = true;
                        });
                      }
                    },
                    child: !genderWomen
                        ? Image.asset(
                            "assets/icons/meet_traveler_sort/onlywomen_off.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          )
                        : Image.asset(
                            "assets/icons/meet_traveler_sort/onlywomen_on.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (genderMen) {
                        setState(() {
                          genderMen = false;
                        });
                      } else {
                        setState(() {
                          genderMen = true;
                        });
                      }
                    },
                    child: !genderMen
                        ? Image.asset(
                            "assets/icons/meet_traveler_sort/onlymen_off.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          )
                        : Image.asset(
                            "assets/icons/meet_traveler_sort/onlymen_on.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (gridView) {
                        setState(() {
                          gridView = false;
                        });
                      }
                    },
                    child: gridView
                        ? Image.asset(
                            "assets/icons/meet_traveler_sort/listview_off.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          )
                        : Image.asset(
                            "assets/icons/meet_traveler_sort/listview_on.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!gridView) {
                        setState(() {
                          gridView = true;
                        });
                      }
                    },
                    child: !gridView
                        ? Image.asset(
                            "assets/icons/meet_traveler_sort/gridview_off.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          )
                        : Image.asset(
                            "assets/icons/meet_traveler_sort/gridview_on.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          ),
                  )
                ],
              ),
            ),
            gridView
                ? GridView.count(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    crossAxisCount: 3,
                    children: List<Widget>.generate(18, (index) {
                      return GridTile(
                        child: Card(
                            //color: Colors.blue.shade200,
                            child: Center(
                          child:
                              Image.network('https://via.placeholder.com/150'),
                        )),
                      );
                    }),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
