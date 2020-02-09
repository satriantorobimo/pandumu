import 'package:flutter/material.dart';
import 'package:pandumu/util/custom_icons.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool tab1 = true;
  bool tab2 = false;
  bool tab3 = false;
  bool tab4 = false;
  final List<int> numbers = [1, 2];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab1 = true;
                        tab2 = false;
                        tab3 = false;
                        tab4 = false;
                      });
                    },
                    child: Text(
                      "All",
                      style: TextStyle(
                          color: tab1 ? const Color(0xFF18B8EF) : Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab1 = false;
                        tab2 = true;
                        tab3 = false;
                        tab4 = false;
                      });
                    },
                    child: tab2
                        ? Image.asset(
                            "assets/icons/review_sort/destination_on.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          )
                        : Image.asset(
                            "assets/icons/review_sort/destination_off.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab1 = false;
                        tab2 = false;
                        tab3 = true;
                        tab4 = false;
                      });
                    },
                    child: tab3
                        ? Image.asset(
                            "assets/icons/review_sort/accommodation_on.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          )
                        : Image.asset(
                            "assets/icons/review_sort/accommodation_off.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab1 = false;
                        tab2 = false;
                        tab3 = false;
                        tab4 = true;
                      });
                    },
                    child: tab4
                        ? Image.asset(
                            "assets/icons/review_sort/food_on.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          )
                        : Image.asset(
                            "assets/icons/review_sort/food_off.png",
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            scale: 1,
                          ),
                  )
                ],
              ),
            ),
            //Divider
            Divider(),
            //Divider
            Container(
                padding: const EdgeInsets.only(right: 8),
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
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 8),
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
                                      "assets/icons/review_sort/accommodation_off.png",
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
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                    SizedBox(height: 2),
                                    Text('User`s Location - 29/03/19 - 12.30',
                                        style: TextStyle(color: Colors.grey)),
                                    SizedBox(height: 8),
                                    Container(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: RichText(
                                          text: TextSpan(
                                              text:
                                                  'Lorem ipsum dolor sit amet adipiscing elite, amerite de lorem',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF2877C6))),
                                          textAlign: TextAlign.justify,
                                        )),
                                    SizedBox(height: 8),
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/icons/star_full.png",
                                          fit: BoxFit.contain,
                                          scale: 8,
                                        ),
                                        Image.asset(
                                          "assets/icons/star_full.png",
                                          fit: BoxFit.contain,
                                          scale: 8,
                                        ),
                                        Image.asset(
                                          "assets/icons/star_full.png",
                                          fit: BoxFit.contain,
                                          scale: 8,
                                        ),
                                        Image.asset(
                                          "assets/icons/star_full.png",
                                          fit: BoxFit.contain,
                                          scale: 8,
                                        ),
                                        Image.asset(
                                          "assets/icons/star_half.png",
                                          fit: BoxFit.contain,
                                          scale: 8,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(16),
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      'Etiam laoreet cursus dui at vestibulum. Nulla non erat non volutpat velit pellentesque euismod quis et elit. Maecenas volutpat turpis mauris.',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                              textAlign: TextAlign.justify,
                            )),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 2.3,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                    color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.3,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                    color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: numbers.length,
                ))
          ],
        ),
      ),
    );
  }
}
