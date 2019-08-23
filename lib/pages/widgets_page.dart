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
          child:ClipOval(
            child:SizedBox(
              width: 100.0,
              height:100.0,
              child:Image.network("https://image-static.segmentfault.com/179/909/1799097727-5b127e854e508",fit: BoxFit.fill,),
            ),
          ),
        )
      );
  }
}