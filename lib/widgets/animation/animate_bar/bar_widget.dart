import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app/widgets/animation/animate_bar/bar.dart';

class Bar extends StatefulWidget{
  _BarState createState()=>_BarState();
}

class _BarState extends State<Bar> with TickerProviderStateMixin{
  static const size = const Size(300.0, 300.0);
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
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment:Alignment.center,
            child: CustomPaint(
                size: Size(300,300),
                painter: BarChartPainter(tween.animate(animationController)),
            ),
          ),
          SizedBox(height: 20),
          RaisedButton(
            color: Colors.red,
            child: Text('refresh'),
            onPressed:this.changeData,
            shape: BeveledRectangleBorder(
              side: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          )
        ],
      );
      
    }
    @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
