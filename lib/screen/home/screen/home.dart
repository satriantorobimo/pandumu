import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/screen/profile_pic/screen/profile_pic.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_icons.dart';
import 'package:pandumu/util/drawer.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _scrollViewController;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: MyDrawer(),
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Home', style: TextStyle(fontFamily: 'Roboto')),
                centerTitle: true,
                leading: GestureDetector(
                    child: ProfilePic(
                        height: 35,
                        width: 35,
                        marginBottom: 8,
                        marginTop: 8,
                        marginLeft: 16),
                    onTap: () => _scaffoldKey.currentState.openDrawer()),
                actions: <Widget>[
                  Container(
                    width: ScreenUtil.getInstance().setWidth(50),
                    height: ScreenUtil.getInstance().setHeight(50),
                    margin: EdgeInsets.only(
                        bottom: ScreenUtil.getInstance().setHeight(8)),
                    child: Icon(Icons.search),
                  )
                ],
                pinned: false,
                snap: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
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
                                      right: ScreenUtil.getInstance()
                                          .setWidth(24)),
                                  width: ScreenUtil.getInstance().setWidth(83),
                                  child: Image.network(
                                      'https://via.placeholder.com/150'));
                            }),
                      ),
                      GestureDetector(
                        child: Container(
                            margin: EdgeInsets.only(
                                right: ScreenUtil.getInstance().setWidth(16)),
                            child: Text(
                              'FIND MORE',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: ScreenUtil.getInstance().setSp(14),
                                  color: blueLight),
                            )),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(16),
                      )
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil.getInstance().setHeight(16)),
                //Timeline Baru
                Container(
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
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
                                  margin:
                                      const EdgeInsets.only(left: 16, right: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text('Display Name',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          SizedBox(width: 8),
                                          Text('@username',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          SizedBox(width: 8),
                                          Text('- 23h',
                                              style:
                                                  TextStyle(color: Colors.grey))
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                          padding:
                                              const EdgeInsets.only(right: 16),
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
                                Icon(Icons.calendar_today,
                                    size: 20, color: Colors.grey),
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
                            margin: const EdgeInsets.only(
                                left: 28, bottom: 4, top: 4),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.pin_drop,
                                    size: 20, color: Colors.grey),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '@trvlbgr ',
                                        style: TextStyle(color: blueLight)),
                                    TextSpan(
                                        text: 'bole tolong share yah makasih')
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
                                      style: TextStyle(
                                          fontSize: 13.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Custom.forward,
                                        size: 16, color: Colors.grey),
                                    SizedBox(width: 8),
                                    Text('999',
                                        style: TextStyle(
                                            fontSize: 13.0, color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Custom.heart_empty,
                                        size: 16, color: Colors.grey),
                                    SizedBox(width: 8),
                                    Text('999',
                                        style: TextStyle(
                                            fontSize: 13.0, color: Colors.grey))
                                  ],
                                ),
                                Icon(Icons.more_vert,
                                    size: 16, color: Colors.grey),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: RaisedButton(
                                    color: blueLight,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(18.0),
                                        side: BorderSide(color: blueLight)),
                                    onPressed: () {},
                                    child: Center(
                                      child: Text(
                                        'JOIN',
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
        ));
  }
}
