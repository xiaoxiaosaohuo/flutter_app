import 'package:flutter/material.dart';
import 'package:scroll_example/pages/listview_demo2.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewDemo2(),
    );
  }
}
