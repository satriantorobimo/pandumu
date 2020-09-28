import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pandumu/util/color.dart';

class FormReview extends StatefulWidget {
  final String type;

  const FormReview({Key key, this.type}) : super(key: key);

  @override
  _FormReviewState createState() => _FormReviewState();
}

class _FormReviewState extends State<FormReview> {
  final String titleAccomodation = 'New Accommodation Review';
  final String titleFood = 'New Food/Culinary Review';
  final String titleDestination = 'New Destination Review';

  TextEditingController titleController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController bedRoomController = TextEditingController();
  TextEditingController foodController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController rateDestinationController = TextEditingController();
  TextEditingController elaborateReviewController = TextEditingController();

  String title = "";
  String brand = "";
  String destination = "";
  String year = "";
  String month = "";
  String bedRoom = "";
  String food = "";
  String service = "";
  String price = "";
  String location = "";
  String rateDestination = "";
  String elaborateReview = "";

  @override
  void dispose() {
    super.dispose();
    titleController?.dispose();
    brandController?.dispose();
    destinationController?.dispose();
    yearController?.dispose();
    monthController?.dispose();
    bedRoomController?.dispose();
    foodController?.dispose();
    serviceController?.dispose();
    priceController?.dispose();
    locationController?.dispose();
    rateDestinationController?.dispose();
    elaborateReviewController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            child: Icon(Icons.close),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          actions: <Widget>[
            Container(
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(12),
                  left: ScreenUtil.getInstance().setWidth(12),
                  right: ScreenUtil.getInstance().setWidth(12),
                  bottom: ScreenUtil.getInstance().setHeight(12),
                ),
                child: FlatButton(
                    child: Text(
                      'Publish',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().setSp(14),
                      ),
                    ),
                    onPressed: () {},
                    color: blueLightSecond,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(color: blueLightSecond)))),
          ],
          title: OutlineButton(
            child: Text(
              'Save as Draft',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil.getInstance().setSp(14),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            borderSide: BorderSide(color: Colors.white),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(
                    ScreenUtil.getInstance().setWidth(16))),
          ),
        ),
        body: widget.type == 'food'
            ? bodyFood()
            : widget.type == 'destination'
                ? bodyDestination()
                : bodyAccomodation());
  }

  Widget bodyFood() => Column(
        children: <Widget>[
          Container(
            color: whiteSmoke,
            padding: EdgeInsets.all(16),
            child: Center(
                child: Text(titleFood, style: TextStyle(color: bluePrimary))),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Text("Brand",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      controller: brandController,
                      onSubmitted: (text) {
                        setState(() {
                          brand = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Restaurant/Cafe/Food stall name",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("When did your last visit?",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: yearController,
                          onSubmitted: (text) {
                            setState(() {
                              year = text;
                            });
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              hintText: "Year",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(12))),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: monthController,
                          onSubmitted: (text) {
                            setState(() {
                              month = text;
                            });
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              hintText: "Month",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(12))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("Review Title",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 74,
                      controller: titleController,
                      onSubmitted: (text) {
                        setState(() {
                          title = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText:
                              "Summarize your story in a clear catchy sentence",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Container(
                        child: Text("FOOD",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 140,
                      controller: foodController,
                      onSubmitted: (text) {
                        setState(() {
                          food = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Why? Explain briefly",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Container(
                        child: Text("SERVICE",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 140,
                      controller: serviceController,
                      onSubmitted: (text) {
                        setState(() {
                          service = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Why? Explain briefly",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Container(
                        child: Text("PRICE",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 140,
                      controller: priceController,
                      onSubmitted: (text) {
                        setState(() {
                          price = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Why? Explain briefly",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text("LOCATION/ATMOSPHERE",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 140,
                      controller: locationController,
                      onSubmitted: (text) {
                        setState(() {
                          location = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Why? Explain briefly",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.image, color: Colors.grey),
                      ),
                      SizedBox(width: 8),
                      Container(
                        child: Text("Add featured images?",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: blueLightSecond)),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("ELABORATE YOUR REVIEW",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      controller: elaborateReviewController,
                      onSubmitted: (text) {
                        setState(() {
                          elaborateReview = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintMaxLines: 2,
                          hintText:
                              "Elaborate your experience/review. You can add images and/or videos to better elaborate it.",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  Widget bodyAccomodation() => Column(
        children: <Widget>[
          Container(
            color: whiteSmoke,
            padding: EdgeInsets.all(16),
            child: Center(
                child: Text(titleAccomodation,
                    style: TextStyle(color: bluePrimary))),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Text("Brand",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      controller: brandController,
                      onSubmitted: (text) {
                        setState(() {
                          brand = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Accommodation name",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("When did your last visit?",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: yearController,
                          onSubmitted: (text) {
                            setState(() {
                              year = text;
                            });
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              hintText: "Year",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(12))),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: monthController,
                          onSubmitted: (text) {
                            setState(() {
                              month = text;
                            });
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              hintText: "Month",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(12))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("Review Title",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 74,
                      controller: titleController,
                      onSubmitted: (text) {
                        setState(() {
                          title = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText:
                              "Summarize your story in a clear catchy sentence",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Container(
                        child: Text("BEDROOM",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 140,
                      controller: bedRoomController,
                      onSubmitted: (text) {
                        setState(() {
                          bedRoom = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Why? Explain briefly",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Container(
                        child: Text("SERVICE",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 140,
                      controller: serviceController,
                      onSubmitted: (text) {
                        setState(() {
                          service = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Why? Explain briefly",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Container(
                        child: Text("PRICE",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 140,
                      controller: priceController,
                      onSubmitted: (text) {
                        setState(() {
                          price = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Why? Explain briefly",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text("LOCATION/ATMOSPHERE",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 140,
                      controller: locationController,
                      onSubmitted: (text) {
                        setState(() {
                          location = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Why? Explain briefly",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.image, color: Colors.grey),
                      ),
                      SizedBox(width: 8),
                      Container(
                        child: Text("Add featured images?",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: blueLightSecond)),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("ELABORATE YOUR REVIEW",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      controller: elaborateReviewController,
                      onSubmitted: (text) {
                        setState(() {
                          elaborateReview = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintMaxLines: 2,
                          hintText:
                              "Elaborate your experience/review. You can add images and/or videos to better elaborate it.",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  Widget bodyDestination() => Column(
        children: <Widget>[
          Container(
            color: whiteSmoke,
            padding: EdgeInsets.all(16),
            child: Center(
                child: Text(titleDestination,
                    style: TextStyle(color: bluePrimary))),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Text("Destination",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      controller: destinationController,
                      onSubmitted: (text) {
                        setState(() {
                          destination = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Type or pick from list",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("When did your last visit?",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: yearController,
                          onSubmitted: (text) {
                            setState(() {
                              year = text;
                            });
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              hintText: "Year",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(12))),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          controller: monthController,
                          onSubmitted: (text) {
                            setState(() {
                              month = text;
                            });
                          },
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              hintText: "Month",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(12))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("Review Title",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      maxLength: 74,
                      controller: titleController,
                      onSubmitted: (text) {
                        setState(() {
                          title = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintText:
                              "Summarize your story in a clear catchy sentence",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                          child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text("RATE THE DESTINATION",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: bluePrimary)),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.image, color: Colors.grey),
                      ),
                      SizedBox(width: 8),
                      Container(
                        child: Text("Add featured images?",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(14),
                                color: blueLightSecond)),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Text("ELABORATE YOUR REVIEW",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(16),
                            color: blueLightSecond)),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      controller: elaborateReviewController,
                      onSubmitted: (text) {
                        setState(() {
                          elaborateReview = text;
                        });
                      },
                      decoration: InputDecoration(
                          hintMaxLines: 2,
                          hintText:
                              "Elaborate your experience/review. You can add images and/or videos to better elaborate it.",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: ScreenUtil.getInstance().setSp(12))),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
}
