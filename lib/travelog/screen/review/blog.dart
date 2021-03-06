import 'package:flutter/material.dart';
import 'package:pandumu/util/color.dart';
import 'package:pandumu/util/custom_icons.dart';
import 'package:pandumu/util/image_crop.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  padding: const EdgeInsets.only(top: 20),
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
                            SizedBox(height: 4),
                            Container(
                                padding: const EdgeInsets.only(right: 16),
                                child: RichText(
                                  text: TextSpan(
                                      text:
                                          'Destinasi Wisata Keluarga Terbaru di Malang, Surganya Pencinta Fotografi',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: bluePrimary,
                                          fontWeight: FontWeight.bold)),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(height: 4),
                            Container(
                                padding: const EdgeInsets.only(right: 16),
                                child: RichText(
                                  text: TextSpan(
                                      text:
                                          'Malang bisa jadi destinasi sempurna. Wisatanya selalu baru. Kulinernya banyak bikin kangen. Kunjungi daftar destinasi wisata keluarga terbaru di Malang ini.',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black)),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(height: 4),
                            ImageCrop(
                                url:
                                    'https://photographycourse.net/wp-content/uploads/2014/11/Landscape-Photography-steps.jpg'),
                            SizedBox(height: 8),
                            Row(
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
                                          fontSize: 12.0, color: Colors.grey),
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
                                            fontSize: 12.0, color: Colors.grey))
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Custom.heart_empty,
                                        size: 16, color: Colors.grey),
                                    SizedBox(width: 8),
                                    Text('999',
                                        style: TextStyle(
                                            fontSize: 12.0, color: Colors.grey))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 32),
                                  child: Icon(Icons.more_vert,
                                      size: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Divider()
              ],
            );
          },
          itemCount: numbers.length,
        ));
  }
}
