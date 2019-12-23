import 'package:flutter/material.dart';

class JoinedScreen extends StatefulWidget {
  @override
  _JoinedScreenState createState() => _JoinedScreenState();
}

class _JoinedScreenState extends State<JoinedScreen> {
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
                                textAlign: TextAlign.justify,
                              )),
                          SizedBox(height: 16),
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
        },
        itemCount: numbers.length,
      ),
    );
  }
}
