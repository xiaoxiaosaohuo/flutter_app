import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/animation/route_animation/route_animation.dart';
class AnimateRoutePage extends StatefulWidget {
  AnimateRoutePage({Key key,this.name}) : super(key: key);
  final String name;
  _AnimateRoutePageState createState() => _AnimateRoutePageState();
}

class _AnimateRoutePageState extends State<AnimateRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由动画")
      ),
      body: RouteAnimation(),
    );
  }
}