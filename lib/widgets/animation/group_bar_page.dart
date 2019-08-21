import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app/widgets/animation/group_bar.dart';

class GroupBar extends StatefulWidget{
  _GroupBarState createState()=>_GroupBarState();
}

class _GroupBarState extends State<GroupBar> with TickerProviderStateMixin{
  static const size = const Size(200.0, 100.0);
  final random = Random();
  
  AnimationController animationController;
  BarChartTween tween;// Strike three. Refactor.


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 500),vsync: this);
    tween = BarChartTween(
        BarChart.empty(size),
        BarChart.random(size, random),
    );
    animationController.forward(); 
  }
  void changeData() {
    setState(() {
      tween = BarChartTween(tween.evaluate(animationController),BarChart.random(size,random));
      animationController.forward(from: 0.0);
    });
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Stack-Bar"),
        ),
        body: Container(
          child: Center(
            child: CustomPaint(
              size: Size(200,100),
              painter: BarChartPainter(tween.animate(animationController)),
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: changeData,
        ),
      );
    }
    @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
