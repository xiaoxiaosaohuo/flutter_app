import 'package:flutter/material.dart';

import 'package:flutter_app/widgets/animation/animate01.dart';

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
          child: Animate01(),
        )
      );
  }
}