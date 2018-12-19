import 'package:flutter/material.dart';

class Route1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("路由一"),
      ),
      body:Center(
        child: new TabA(),
      )
    );
  }
}


class TabA extends StatefulWidget {
  TabA({Key key}) : super(key: key);

  @override
  _TabA createState() => new _TabA();
}

class _TabA extends State<TabA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child:new Center(
        child: new Container(
          child: new Center(
            child: new Text(
              _active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          margin: const EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      )
    );
  }
}
