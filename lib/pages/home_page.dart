import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<HomePage>{

  final List<BottomNavigationBarItem> bottomItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.camera),
        title: Text('camera')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('home')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.widgets),
        title: Text('widgets')
      ),
  ];
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
          items:bottomItems

        ),
        body:Center(
          child: Text("home"),
        )
      );
    }
}