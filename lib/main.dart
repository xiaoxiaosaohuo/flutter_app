
import 'package:flutter/material.dart';
import 'package:flutter_app/src/instagram_home.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Instagram",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(
           title: TextStyle(color: Colors.black, fontFamily: "Aveny"),
        ),
        textTheme: TextTheme(title: TextStyle(color: Colors.black))
      ),
      // debugShowCheckedModeBanner: true,
      home: new InstagramHome(),
    );
  }
}