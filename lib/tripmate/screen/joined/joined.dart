import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pandumu/tripmate/model/tripmate_model.dart';
import 'package:pandumu/util/color.dart';

class JoinedScreen extends StatefulWidget {
  @override
  _JoinedScreenState createState() => _JoinedScreenState();
}

class _JoinedScreenState extends State<JoinedScreen> {
  List tripMateModel;
  bool isLoading = true;

  @override
  void initState() {
    Timer(Duration(seconds: 5), () => checkLogin());
    super.initState();
  }

  checkLogin() {
    tripMateModel.add(TripMateModel(
        'Atmariyani Estiningtyas',
        '@atm',
        'Cari barengan ke Morotai GIRLS only Bogor/Jakarta ada yang maukah?',
        'joined'));
    tripMateModel.add(TripMateModel('Johnny Iskandar', '@iskandar',
        'Kulineran ke Kota Cirebon, yuk!', 'request'));
    tripMateModel.add(TripMateModel(
        'Abinaya Basupati',
        '@abinaya',
        'Pantai Mandorak, yuk, habis lebaran. Makin rame yg ikut makin seru',
        'joined'));

    print(tripMateModel);
    print(tripMateModel.length);

    setState(() {
      isLoading = false;
    });
  }

  final List<int> numbers = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if ((numbers[index] & 1) == 0) {
            return _joined('a', 'b', 'c');
          } else {
            return _request('a', 'b', 'c');
          }
        },
        itemCount: numbers.length,
      ),
    );
  }

  Widget _joined(String name, String username, String nameTrip) => Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Display Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(width: 8),
                          Text('@username',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 8),
                          Text('- 23h', style: TextStyle(color: Colors.grey))
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                          padding: const EdgeInsets.only(right: 16),
                          child: RichText(
                            text: TextSpan(
                                text:
                                    'Cari barengan ke Morotai GIRLS only Bogor / Jakarta ada yang maukah?',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF2877C6))),
                            textAlign: TextAlign.justify,
                          )),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 28, bottom: 8, top: 8),
            child: Row(
              children: <Widget>[
                Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                SizedBox(width: 35),
                Text(
                  '20 - 25 Juli 2019 (6H5M)',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Divider()
        ],
      );

  Widget _request(String name, String username, String nameTrip) => Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(right: 16),
                          child: RichText(
                            text: TextSpan(
                                text:
                                    '@username requests to join your Trip: Name of the Trip',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF2877C6))),
                            textAlign: TextAlign.justify,
                          )),
                      SizedBox(height: 8),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 110,
                              padding: const EdgeInsets.all(7.0),
                              child: RaisedButton(
                                color: blueLight,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: blueLight)),
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    'APPROVE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 110,
                              padding: const EdgeInsets.all(7.0),
                              child: RaisedButton(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)),
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    'REJECT',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto'),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      );
}
