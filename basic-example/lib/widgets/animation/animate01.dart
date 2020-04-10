import 'package:flutter/material.dart';


class AnimatedLogo extends AnimatedWidget{
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);
  AnimatedLogo({Key key,Animation<double> animation,}):super(key:key,listenable:animation);
  @override
    Widget build(BuildContext context) {
      final Animation<double> animation = listenable;
      return Center(
        child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
      )
      );
    }
}

class Animate01 extends StatefulWidget {
 
  _Animate01State createState() => _Animate01State();
}

class _Animate01State extends State<Animate01> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    // #docregion addListener
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
    ..addStatusListener((status){
      if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation:animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}