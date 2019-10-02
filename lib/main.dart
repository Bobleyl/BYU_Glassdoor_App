import 'package:flutter/material.dart';
import 'SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShift',
      theme: ThemeData(
        primaryColor: Color(0xff002E5D),
        backgroundColor: Color(0xff0062B8),
        accentColor: Color(0xffffffff),
        fontFamily: 'Raleway',
      ),
      home: SplashScreen(),
    );
  }
}