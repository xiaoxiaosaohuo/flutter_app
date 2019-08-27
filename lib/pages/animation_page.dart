import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/grid/color_grid.dart';
import 'package:flutter_app/widgets/grid/route_grid.dart';
import 'package:flutter_app/widgets/animation/card_animate.dart';
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
    return Scaffold(
       appBar: AppBar(
          title: Text("Animate"),
        ),
        body:ListView(
          children: <Widget>[
               ColorGrids(),
               RouteAnimate(),
               CardFlipper(),
               SizedBox(width: double.infinity,height: 100,)
          ],
        )
        
      );
  }
}