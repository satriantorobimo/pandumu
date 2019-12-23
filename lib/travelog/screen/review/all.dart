import 'package:flutter/material.dart';
import 'package:pandumu/util/custom_icons.dart';

class ReviewAllScreen extends StatefulWidget {
  @override
  _ReviewAllScreenState createState() => _ReviewAllScreenState();
}

class _ReviewAllScreenState extends State<ReviewAllScreen> {
  final List<int> numbers = [1, 2];

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
                            SizedBox(height: 8),
                            Image.asset(
                              "assets/icons/travelog/log_off.png",
                              fit: BoxFit.contain,
                              scale: 2,
                            )
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
                              child: Text(
                                  'Really want to do solo travelling ke Indonesia Timur... apa daya working days gw jahanaaam hmm~'),
                            ),
                            SizedBox(height: 16),
                            Row(
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
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Custom.heart_empty,
                                        size: 15, color: Colors.grey),
                                    SizedBox(width: 8),
                                    Text('999',
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey))
                                  ],
                                ),
                                Icon(Icons.share, size: 15, color: Colors.grey),
                                Padding(
                                  padding: const EdgeInsets.only(right: 64),
                                  child: Icon(Icons.bookmark_border,
                                      size: 15, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Divider()
              ],
            );
          },
          itemCount: numbers.length,
        ));
  }
}
