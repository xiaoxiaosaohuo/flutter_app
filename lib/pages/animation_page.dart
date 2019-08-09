import 'package:flutter/material.dart';

import 'package:flutter_app/widgets/animation/animate01.dart';
import 'package:flutter_app/widgets/animation/animate02.dart';
import 'package:flutter_app/widgets/animation/chart01.dart';

class AnimationPage extends StatefulWidget{
  AnimationPage();
  @override
    State<StatefulWidget> createState() {
      return AnimationPageState();
    }
}

class AnimationPageState extends State<AnimationPage>{
  @override
  Widget build(BuildContext context) {
    return Chart01();
    // return Scaffold(
    //     body:Center(
    //       child: Animate01(),
    //     )
    //   );
  }
}