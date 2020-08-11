import 'package:flutter/material.dart';
import 'package:pandumu/detail/widget/list_view_comments.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_icons.dart';

class LogDetailScreen extends StatefulWidget {
  @override
  _LogDetailScreenState createState() => _LogDetailScreenState();
}

class _LogDetailScreenState extends State<LogDetailScreen> {
  FocusNode _focus = FocusNode();
  TextEditingController _replyController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool _focusTextField = true;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    debugPrint("Focus: " + _focus.hasFocus.toString());
    if (!_focus.hasFocus) {
      setState(() {
        _focusTextField = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _onStartScroll(scrollNotification.metrics);
                }
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          const EdgeInsets.only(right: 16, left: 16, top: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
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
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                ),
                                Text('Jakarta - 29/11/19 - 10.11',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: RichText(
                        text: TextSpan(
                            text:
                                'Really want to do solo travelling ke Indonesia Timur... apa daya working days gw jahanaaam hmm~',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                '999',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(width: 4),
                              Text('Comments',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey))
                            ],
                          ),
                          SizedBox(width: 8),
                          Row(
                            children: <Widget>[
                              Text(
                                '999',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text('Relogs',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey))
                            ],
                          ),
                          SizedBox(width: 8),
                          Row(
                            children: <Widget>[
                              Text(
                                '999',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              SizedBox(width: 4),
                              Text('Likes',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(right: 45, left: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Custom.chat,
                            size: 24,
                            color: Colors.grey,
                          ),
                          Icon(Custom.forward, size: 24, color: Colors.grey),
                          Icon(Custom.heart_empty,
                              size: 24, color: Colors.grey),
                          Icon(Icons.more_vert, size: 24, color: Colors.grey)
                        ],
                      ),
                    ),
                    Divider(),
                    ListViewComments()
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: _focus.hasFocus || !_focusTextField
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: 'Replying to ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    )),
                                TextSpan(
                                  text: '@username',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: blueLight,
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(height: 12),
                            TextField(
                              focusNode: _focus,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () => {print('Expanded')},
                                  icon: Icon(
                                    Icons.expand_more,
                                    color: blueLight,
                                    size: 24,
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xFFD6E8ED),
                                hintText: 'Reply',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0.0),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                    borderSide: BorderSide.none),
                              ),
                              controller: _replyController,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: <Widget>[
                                Icon(Icons.image, size: 24),
                                SizedBox(width: 4),
                                Icon(Icons.image, size: 24),
                                SizedBox(width: 4),
                                Icon(Icons.image, size: 24),
                                SizedBox(width: 181),
                                Icon(Icons.radio_button_unchecked, size: 24),
                                SizedBox(width: 4),
                                Container(
                                  height: 38,
                                  width: 90,
                                  padding: const EdgeInsets.all(7.0),
                                  child: RaisedButton(
                                    color: bluePrimary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: bluePrimary)),
                                    onPressed: () {},
                                    child: Center(
                                      child: Text(
                                        'REPLY',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              _focusTextField = false;
                            });
                            _scrollController.animateTo(
                              0.0,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFFD6E8ED),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Container(
                                  margin: const EdgeInsets.only(left: 12),
                                  child: Text('Reply',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blueGrey)))),
                        )),
            ),
          ],
        ),
      ),
    );
  }

  _onStartScroll(ScrollMetrics metrics) {
    print("Scroll Start");
    if (!_focusTextField) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      setState(() {
        _focusTextField = true;
      });
    }
  }
}
