import 'package:flutter/material.dart';
import 'dart:math';

import 'CustomPhysics.dart';
class CustomScrollphysics extends StatefulWidget {
  CustomScrollphysics({Key key}) : super(key: key);

  @override
  _CustomScrollphysicsState createState() => _CustomScrollphysicsState();
}

class _CustomScrollphysicsState extends State<CustomScrollphysics> {

  final _controller = ScrollController();

  final List<int> pages = List.generate(4, (index) => index);

  ScrollPhysics _physics;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension =
              _controller.position.maxScrollExtent / (pages.length - 1);
             
          _physics = CustomScrollPhysics(itemDimension: dimension);
        });
      }
    });
  }

  Color get randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          physics: _physics,
          itemCount: pages.length,
          itemBuilder: (context, index) => Container(
            height: double.infinity,
            width: 300,
            color: randomColor,
            margin: const EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }
}