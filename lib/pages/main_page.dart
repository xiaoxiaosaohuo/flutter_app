import 'package:flutter/material.dart';
import 'package:flutter_app/pages/animation_page.dart';
import 'package:flutter_app/pages/widgets_page.dart';
import 'package:flutter_app/pages/home_page.dart';
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> bottomItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.music_video),
        title: Text('animation')
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
  final List<Widget> _children = [AnimationPage(),HomePage(),WidgetPage()];
  onTapBottomNavitation(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items:bottomItems,
          onTap:this.onTapBottomNavitation

        ),
        body:IndexedStack(
          index: _currentIndex,
          children: _children,
        )
      );
    }
}