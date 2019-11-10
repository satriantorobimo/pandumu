import 'package:flutter/material.dart';
import 'package:pandumu/util/custom_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool meetTravellerShow = false;
  bool tripMateShow = false;
  bool meetTravellerDismiss = false;
  bool tripMateDismiss = false;
  final List<int> numbers = [1, 2];
  final List<int> firends = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(fontFamily: 'Gotham')),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
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
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            //Meet Traveller Card
            Container(
              color: const Color(0xFFF1F5F6),
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
                            const EdgeInsets.only(left: 24, top: 26, bottom: 8),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text('Meet Travellers',
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                color: const Color(0xFF2877C6),
                                fontSize: 20.0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (meetTravellerShow) {
                            setState(() {
                              meetTravellerShow = false;
                            });
                          } else {
                            setState(() {
                              meetTravellerShow = true;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 16.0, top: 16, bottom: 8),
                          child: Icon(Custom.down_open,
                              size: 20.0, color: const Color(0xFF18B8EF)),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    child: GestureDetector(
                      onTap: () {
                        print('dismiss');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.red)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                  'Temukan pejalan di sekitarmu, atau pejalan lokal di kota yang hendak kautuju. Yakinlah bahwa hidup akan lebih mudah dengan banyak berteman dan saling membantu (oh, shut up!)'),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('DISMISS',
                                        style: TextStyle(color: Colors.red)),
                                    SizedBox(width: 5),
                                    Icon(
                                      Custom.cancel_circled,
                                      color: Colors.red,
                                      size: 18,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    visible: meetTravellerShow,
                  ),
                  SizedBox(height: 16)
                ],
              ),
            ),

            //List View Friends
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: firends.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 24),
                              width: MediaQuery.of(context).size.width * 0.22,
                              child: Image.network(
                                  'https://via.placeholder.com/150'));
                        }),
                  ),
                  GestureDetector(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        height: MediaQuery.of(context).size.height * 0.03,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF18B8EF))),
                        child: Center(
                          child: Text(
                            'Find More',
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                fontSize: 12,
                                color: const Color(0xFF18B8EF)),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),

            //TripMate Card
            Container(
              color: const Color(0xFFF1F5F6),
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
                        child: Icon(Icons.directions_run),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 24, top: 26, bottom: 8),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text('TripMate',
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                color: const Color(0xFF2877C6),
                                fontSize: 20.0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (tripMateShow) {
                            setState(() {
                              tripMateShow = false;
                            });
                          } else {
                            setState(() {
                              tripMateShow = true;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 16.0, top: 16, bottom: 8),
                          child: Icon(Custom.down_open,
                              size: 20.0, color: const Color(0xFF18B8EF)),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    child: GestureDetector(
                      onTap: () {
                        print('dismiss');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.red)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                  'Ikuti ajakan jalan bareng teman-teman baru. Beban jadi ringan sebab semua bisa direncanakan dan ditanggung bersama. Mau ikut atau mau ngajak, dua-duanya mudah dilakukan.'),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('DISMISS',
                                        style: TextStyle(color: Colors.red)),
                                    SizedBox(width: 5),
                                    Icon(
                                      Custom.cancel_circled,
                                      color: Colors.red,
                                      size: 18,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    visible: tripMateShow,
                  ),
                  SizedBox(height: 16)
                ],
              ),
            ),

            //Timeline Dunno
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      elevation: 2,
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 16, bottom: 8, top: 8),
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.person),
                              ),
                              SizedBox(width: 16),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Sashikirana Arundati'),
                                    Text('Cianjur   29/03/19   12.30',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Text('@arundati'),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16, bottom: 8, top: 8),
                            child: Text(
                              'Fun Hiking & Opsih BBTNGP, World Environment Day 5 Juni 2019',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Gotham',
                                  color: Color(0xFF2877C6)),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16, bottom: 8, top: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.calendar_today),
                                SizedBox(width: 8),
                                Text(
                                  '7–9 Juni 2019 (3H2M)',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16, bottom: 8, top: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.pin_drop),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Balai Taman Nasional Gunung Gunung Gede Pangrango, Cibodas, Cianjur, Jawa Barat',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: RaisedButton(
                                      color: Color(0xFF18B8EF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Color(0xFF18B8EF))),
                                      onPressed: () {},
                                      child: Center(
                                        child: Text(
                                          'IKUTI',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Gotham'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Custom.chat, size: 16),
                                        SizedBox(width: 8),
                                        Text(
                                          '999',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Custom.forward, size: 16),
                                        SizedBox(width: 8),
                                        Text('999',
                                            style: TextStyle(fontSize: 16.0))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Custom.heart_empty, size: 16),
                                        SizedBox(width: 8),
                                        Text('999',
                                            style: TextStyle(fontSize: 16.0))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Icon(Icons.more_vert, size: 16),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                );
              },
              itemCount: numbers.length,
            ),
          ],
        ),
      ),
    );
  }
}
