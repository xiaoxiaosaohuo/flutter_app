import 'package:flutter/material.dart';

// import '../routers/application.dart';

class WidgetPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return WidgetPageState();
    }
}

class WidgetPageState extends State<WidgetPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("Widget"),
        ),
        body:Center(
          child: Text("WidgetPage"),
        )
      );
  }
}