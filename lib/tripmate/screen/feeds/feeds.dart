import 'package:flutter/material.dart';
import 'package:pandumu/util/custom_icons.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final List<int> numbers = [1];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, position) {
          return Column(
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
                          SizedBox(height: 8),
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
                          SizedBox(height: 16),
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
                margin: const EdgeInsets.only(left: 28, top: 8),
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
                margin: const EdgeInsets.only(left: 28, bottom: 8, top: 8),
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
              SizedBox(height: 8),
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
                            style: TextStyle(color: Color(0xFF18B8EF))),
                        TextSpan(text: 'bole tolong share yah makasih')
                      ]),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Custom.chat,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '999',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Custom.heart_empty, size: 15, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('999',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.grey))
                      ],
                    ),
                    Icon(Icons.share, size: 15, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Icon(Icons.bookmark_border,
                          size: 15, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: RaisedButton(
                        color: Color(0xFF18B8EF),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xFF18B8EF))),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'IKUTI',
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
}
