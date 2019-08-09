import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}


class GrowTransition extends StatelessWidget{
  GrowTransition({this.child,this.animation});

  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context,child)=>Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
        child: child,
      ),
    );
  }
}

class Animate02 extends StatefulWidget{
  _Animate02State createState()=>_Animate02State();
}

class _Animate02State extends State<Animate02> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this
      );
      animation = Tween<double>(begin: 0,end:300).animate(controller);
      controller.forward();
    }

    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return GrowTransition(
          child: LogoWidget(),
          animation: animation,
          );
      }
    dispose() {
      controller.dispose();
      super.dispose();
    }
}