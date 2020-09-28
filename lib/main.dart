import 'package:flutter/material.dart';
import 'package:pandumu/provider/provider_auth.dart';
import 'package:pandumu/splashscreen.dart';
import 'package:pandumu/util/color.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PhoneAuthDataProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pandumu',
          theme: ThemeData(primaryColor: bluePrimary, fontFamily: 'Roboto'),
          // home: BottomNavigationBarController(),
          home: SplashScreen(),
        ));
  }
}
