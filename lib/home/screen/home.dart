import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/profile_pic/screen/profile_pic.dart';
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
  final List<int> numbers = [1, 2, 3, 4];
  final List<int> firends = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(fontFamily: 'Roboto')),
        centerTitle: true,
        leading: ProfilePic(),
        actions: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(50),
            height: ScreenUtil.getInstance().setHeight(50),
            margin:
                EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(8)),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            //Meet Traveller Card
            // Container(
            //   color: const Color(0xFFF1F5F6),
            //   child: Column(
            //     children: <Widget>[
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Container(
            //             margin:
            //                 const EdgeInsets.only(left: 16, top: 16, bottom: 8),
            //             width: 20.0,
            //             height: 20.0,
            //             child: Icon(Icons.person),
            //           ),
            //           Container(
            //             margin:
            //                 const EdgeInsets.only(left: 10, top: 26, bottom: 8),
            //             width: MediaQuery.of(context).size.width * 0.7,
            //             child: Text('Meet Travellers',
            //                 style: TextStyle(
            //                     fontFamily: 'Roboto',
            //                     color: const Color(0xFF2877C6),
            //                     fontSize: 18.0)),
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               if (meetTravellerShow) {
            //                 setState(() {
            //                   meetTravellerShow = false;
            //                 });
            //               } else {
            //                 setState(() {
            //                   meetTravellerShow = true;
            //                 });
            //               }
            //             },
            //             child: Container(
            //               margin: const EdgeInsets.only(
            //                   right: 16.0, top: 16, bottom: 8),
            //               child: Icon(Custom.down_open,
            //                   size: 20.0, color: const Color(0xFF18B8EF)),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Visibility(
            //         child: GestureDetector(
            //           onTap: () {
            //             print('dismiss');
            //           },
            //           child: Container(
            //             margin: const EdgeInsets.all(16.0),
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 borderRadius: BorderRadius.circular(8.0),
            //                 border: Border.all(color: Colors.red)),
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 children: <Widget>[
            //                   Text(
            //                       'Temukan pejalan di sekitarmu, atau pejalan lokal di kota yang hendak kautuju. Yakinlah bahwa hidup akan lebih mudah dengan banyak berteman dan saling membantu (oh, shut up!)'),
            //                   Container(
            //                     margin: const EdgeInsets.only(
            //                         top: 8, bottom: 8, right: 8),
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: <Widget>[
            //                         Text('DISMISS',
            //                             style: TextStyle(color: Colors.red)),
            //                         SizedBox(width: 5),
            //                         Icon(
            //                           Custom.cancel_circled,
            //                           color: Colors.red,
            //                           size: 18,
            //                         )
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         visible: meetTravellerShow,
            //       ),
            //       SizedBox(height: 16)
            //     ],
            //   ),
            // ),

            //List View Friends
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.getInstance().setWidth(16),
                      vertical: ScreenUtil.getInstance().setHeight(15),
                    ),
                    height: ScreenUtil.getInstance().setHeight(150),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: firends.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.only(
                                  right: ScreenUtil.getInstance().setWidth(24)),
                              width: ScreenUtil.getInstance().setWidth(83),
                              child: Image.network(
                                  'https://via.placeholder.com/150'));
                        }),
                  ),
                  GestureDetector(
                    child: Container(
                        width: ScreenUtil.getInstance().setWidth(80),
                        height: ScreenUtil.getInstance().setHeight(20),
                        margin: EdgeInsets.only(
                            right: ScreenUtil.getInstance().setWidth(16)),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF18B8EF))),
                        child: Center(
                          child: Text(
                            'Find More',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: ScreenUtil.getInstance().setSp(12),
                                color: const Color(0xFF18B8EF)),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(16),
                  )
                ],
              ),
            ),

            // //TripMate Card
            // Container(
            //   color: const Color(0xFFF1F5F6),
            //   child: Column(
            //     children: <Widget>[
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[
            //           Container(
            //             margin:
            //                 const EdgeInsets.only(left: 16, top: 16, bottom: 8),
            //             width: 20.0,
            //             height: 20.0,
            //             child: Icon(Icons.directions_run),
            //           ),
            //           Container(
            //             margin:
            //                 const EdgeInsets.only(left: 10, top: 26, bottom: 8),
            //             width: MediaQuery.of(context).size.width * 0.7,
            //             child: Text('TripMate',
            //                 style: TextStyle(
            //                     fontFamily: 'Roboto',
            //                     color: const Color(0xFF2877C6),
            //                     fontSize: 18.0)),
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               if (tripMateShow) {
            //                 setState(() {
            //                   tripMateShow = false;
            //                 });
            //               } else {
            //                 setState(() {
            //                   tripMateShow = true;
            //                 });
            //               }
            //             },
            //             child: Container(
            //               margin: const EdgeInsets.only(
            //                   right: 16.0, top: 16, bottom: 8),
            //               child: Icon(Custom.down_open,
            //                   size: 20.0, color: const Color(0xFF18B8EF)),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Visibility(
            //         child: GestureDetector(
            //           onTap: () {
            //             print('dismiss');
            //           },
            //           child: Container(
            //             margin: const EdgeInsets.all(16.0),
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 borderRadius: BorderRadius.circular(8.0),
            //                 border: Border.all(color: Colors.red)),
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 children: <Widget>[
            //                   Text(
            //                       'Ikuti ajakan jalan bareng teman-teman baru. Beban jadi ringan sebab semua bisa direncanakan dan ditanggung bersama. Mau ikut atau mau ngajak, dua-duanya mudah dilakukan.'),
            //                   Container(
            //                     margin: const EdgeInsets.only(
            //                         top: 8, bottom: 8, right: 8),
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: <Widget>[
            //                         Text('DISMISS',
            //                             style: TextStyle(color: Colors.red)),
            //                         SizedBox(width: 5),
            //                         Icon(
            //                           Custom.cancel_circled,
            //                           color: Colors.red,
            //                           size: 18,
            //                         )
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         visible: tripMateShow,
            //       ),
            //       SizedBox(height: 16)
            //     ],
            //   ),
            // ),
            SizedBox(height: ScreenUtil.getInstance().setHeight(16)),
            //Timeline Baru
            Container(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, position) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setHeight(16)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.getInstance().setWidth(16),
                                  right: ScreenUtil.getInstance().setWidth(8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width:
                                        ScreenUtil.getInstance().setWidth(45),
                                    height:
                                        ScreenUtil.getInstance().setHeight(45),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.person),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width: ScreenUtil.getInstance().setWidth(16)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('Display Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil.getInstance()
                                                  .setSp(16))),
                                      SizedBox(
                                          width: ScreenUtil.getInstance()
                                              .setWidth(8)),
                                      Text('@username',
                                          style: TextStyle(color: Colors.grey)),
                                      SizedBox(
                                          width: ScreenUtil.getInstance()
                                              .setWidth(8)),
                                      Text('- 23h',
                                          style: TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                      padding: EdgeInsets.only(
                                          right: ScreenUtil.getInstance()
                                              .setWidth(16)),
                                      child: RichText(
                                        text: TextSpan(
                                            text:
                                                'Cari barengan ke Morotai GIRLS only Bogor / Jakarta ada yang maukah?',
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil.getInstance()
                                                        .setSp(16),
                                                color: Color(0xFF2877C6))),
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
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(28),
                            bottom: ScreenUtil.getInstance().setHeight(4),
                            top: ScreenUtil.getInstance().setHeight(4)),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today,
                                size: ScreenUtil.getInstance().setSp(20),
                                color: Colors.grey),
                            SizedBox(
                                width: ScreenUtil.getInstance().setWidth(35)),
                            Text(
                              '20 - 25 Juli 2019 (6H5M)',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(16)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(28),
                            bottom: ScreenUtil.getInstance().setHeight(4),
                            top: ScreenUtil.getInstance().setHeight(4)),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.group,
                                size: ScreenUtil.getInstance().setSp(20),
                                color: Colors.grey),
                            SizedBox(
                                width: ScreenUtil.getInstance().setWidth(35)),
                            Expanded(
                              child: Text(
                                '3 - 5 orang',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(16)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(28),
                            top: ScreenUtil.getInstance().setHeight(4)),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.pin_drop,
                                size: ScreenUtil.getInstance().setSp(20),
                                color: Colors.grey),
                            SizedBox(
                                width: ScreenUtil.getInstance().setWidth(35)),
                            Expanded(
                              child: Text(
                                'Pulau Sumsum, Morotai, Maluku',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(16)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: RichText(
                          text: TextSpan(
                              text:
                                  'Sharecost ya. Meeting point bisa di Soetta atau Ternate. Kak ',
                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(16),
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '@trvlbgr ',
                                    style: TextStyle(color: Color(0xFF18B8EF))),
                                TextSpan(text: 'bole tolong share yah makasih')
                              ]),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(16),
                            right: ScreenUtil.getInstance().setWidth(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Custom.chat,
                                  size: ScreenUtil.getInstance().setSp(15),
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                    width:
                                        ScreenUtil.getInstance().setWidth(8)),
                                Text(
                                  '999',
                                  style: TextStyle(
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(15),
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Custom.heart_empty,
                                    size: ScreenUtil.getInstance().setSp(15),
                                    color: Colors.grey),
                                SizedBox(width: 8),
                                Text('999',
                                    style: TextStyle(
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(15),
                                        color: Colors.grey))
                              ],
                            ),
                            Icon(Icons.share,
                                size: ScreenUtil.getInstance().setSp(15),
                                color: Colors.grey),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: ScreenUtil.getInstance().setWidth(25)),
                              child: Icon(Icons.bookmark_border,
                                  size: ScreenUtil.getInstance().setSp(15),
                                  color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: RaisedButton(
                                color: Color(0xFF18B8EF),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Color(0xFF18B8EF))),
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    'IKUTI',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto'),
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
            ),
          ],
        ),
      ),
    );
  }
}
