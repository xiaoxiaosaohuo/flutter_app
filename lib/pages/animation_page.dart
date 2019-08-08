import 'package:flutter/material.dart';

// import '../routers/application.dart';

class AnimationPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return AnimationPageState();
    }
}

class AnimationPageState extends State<AnimationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Text("Animation"),
        )
      );
  }
}