import 'package:flutter/material.dart';
import 'package:flutter_app/src/LoginPage.dart';
void main ()=>runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Login Page",
        theme: ThemeData(primarySwatch: Colors.blue),
        home:LoginPage()
      );
    }
}

