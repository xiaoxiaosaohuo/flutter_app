import 'package:flutter/material.dart';

class Route1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("路由一"),
      ),
      body:Center(
        child: Text('这是路由一页面'),
      )
    );
  }
}