import 'package:flutter/material.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_icons.dart';

class InvitationsScreen extends StatefulWidget {
  @override
  _InvitationsScreenState createState() => _InvitationsScreenState();
}

class _InvitationsScreenState extends State<InvitationsScreen> {
  final List<int> numbers = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, position) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 8),
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
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Display Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(width: 8),
                              Text('@username',
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(width: 8),
                              Text('- 23h',
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(height: 4),
                          Container(
                              padding: const EdgeInsets.only(right: 16),
                              child: RichText(
                                text: TextSpan(
                                    text:
                                        'Cari barengan ke Morotai GIRLS only Bogor / Jakarta ada yang maukah?',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF2877C6))),
                                textAlign: TextAlign.left,
                              )),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 28),
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
              Container(
                margin: const EdgeInsets.only(left: 28, top: 4),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.group, size: 20, color: Colors.grey),
                    SizedBox(width: 35),
                    Expanded(
                      child: Text(
                        '3 - 5 orang',
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 28, bottom: 4, top: 4),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.pin_drop, size: 20, color: Colors.grey),
                    SizedBox(width: 35),
                    Expanded(
                      child: Text(
                        'Pulau Sumsum, Morotai, Maluku',
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: RichText(
                  text: TextSpan(
                      text:
                          'Sharecost ya. Meeting point bisa di Soetta atau Ternate. Kak ',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '@trvlbgr ',
                            style: TextStyle(color: blueLight)),
                        TextSpan(text: 'bole tolong share yah makasih')
                      ]),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Custom.chat,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '999',
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Custom.forward, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('999',
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.grey))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Custom.heart_empty, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('999',
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.grey))
                      ],
                    ),
                    Icon(Icons.more_vert, size: 16, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: RaisedButton(
                        color: blueLight,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: blueLight)),
                        onPressed: () => _joinTrip(context),
                        child: Center(
                          child: Text(
                            'JOIN',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Roboto'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider()
            ],
          );
        },
        itemCount: numbers.length,
      ),
    );
  }

  _joinTrip(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text('Sure you want to join the Trip?',
                  style: TextStyle(fontSize: 16, color: Color(0xFF2877C6))),
            ),
            SizedBox(height: 24),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: 100,
                    padding: const EdgeInsets.all(7.0),
                    child: RaisedButton(
                      color: blueLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: blueLight)),
                      onPressed: () => Navigator.pop(context),
                      child: Center(
                        child: Text(
                          'JOIN',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Roboto'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 100,
                    padding: const EdgeInsets.all(7.0),
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: blueLight)),
                      onPressed: () => Navigator.pop(context),
                      child: Center(
                        child: Text(
                          'CANCEL',
                          style:
                              TextStyle(color: blueLight, fontFamily: 'Roboto'),
                        ),
                      ),
                    ),
                  ),
                ]),
          ],
        ));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
