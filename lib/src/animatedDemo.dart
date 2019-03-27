import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';
import 'dart:math' as math;


class AnimatedDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      // TODO: implement createState
      return AnimatedState();
    }
}
//mixin SingleTickerProviderStateMixin 单个动画

class AnimatedState extends State<AnimatedDemo> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      _animationController = AnimationController(
        duration: Duration(seconds: 5),
        vsync: this
      );
      _animationController..repeat();
      //动画监听后，会刷新页面。
      // _animationController.addListener((){
      //   setState(() {
          
      //   });
      // });
    }
    @override
    void dispose() {
        // TODO: implement dispose
        super.dispose();
        _animationController.dispose();
      }
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
          body:Center(
            child: RandomContainer(
              height: 200,
              width: 200,
              child:Center(
                child: AnimatedBuilder(
                animation: _animationController,
                  child: Container(
                    // constraints: BoxConstraints(maxWidth: 50),
                    height: 100.0,
                    width: 100.0,
                    color: Colors.red,
                  ),
                builder: (context,child)=>Transform.rotate(
                  angle: _animationController.value*2.0*math.pi,
                  child: child,
                )
              ),
              )
              
            ),
          )
        );
      }
}