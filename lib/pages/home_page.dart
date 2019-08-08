import 'package:flutter/material.dart';

// import '../routers/application.dart';

class HomePage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return HomePageState();
    }
}

class HomePageState extends State<HomePage>{
  int count = 0;
  onPressed(){
    this.setState((){
      count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Text('$count'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: this.onPressed,
          child: Icon(Icons.add),
          ),
      );
  }
}