import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool card1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 16, bottom: 8),
          width: 50.0,
          height: 50.0,
          decoration: new BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person),
        ),
        actions: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            margin: const EdgeInsets.only(bottom: 8),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.grey.shade200,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin:
                            const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        width: 20.0,
                        height: 20.0,
                        child: Icon(Icons.person),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 24, top: 16, bottom: 8),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text('Meet Travellers',
                            style: TextStyle(
                                color: const Color(0xFF18B8EF),
                                fontSize: 24.0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (card1) {
                            setState(() {
                              card1 = false;
                            });
                          } else {
                            setState(() {
                              card1 = true;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 16.0, top: 16, bottom: 8),
                          child: Icon(Icons.arrow_drop_down,
                              size: 32.0, color: const Color(0xFF18B8EF)),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    child: Container(
                      margin: const EdgeInsets.all(16.0),
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.red)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                                'Temukan pejalan di sekitarmu, atau pejalan lokal di kota yang hendak kautuju. Yakinlah bahwa hidup akan lebih mudah dengan banyak berteman dan saling membantu (oh, shut up!)'),
                            Container(
                              margin: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                children: <Widget>[
                                  Text('Dismiss',
                                      style: TextStyle(color: Colors.red)),
                                  Icon(Icons.close, color: Colors.red)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    visible: card1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
