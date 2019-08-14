import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' show lerpDouble;

class Chart01 extends StatefulWidget{
  _Chart01State createState()=>_Chart01State();
}

class _Chart01State extends State<Chart01> with TickerProviderStateMixin{
  final random = Random();
  int dataSet = 50;
  AnimationController animationController;
  Tween<double> tween;
  double startHeight;   // Strike one.
  double currentHeight; // Strike two.
  double endHeight;     // Strike three. Refactor.
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 500),vsync: this);
    tween = Tween<double>(begin: 0.0,end:dataSet.toDouble());
    animationController.forward(); 
  }
  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
      tween = Tween<double>(
        begin: tween.evaluate(animationController),
        end:dataSet.toDouble()
      );
      animationController.forward(from: 0.0);
    });
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Animate"),
        ),
        body: Container(
          child: Center(
            child: CustomPaint(
              size: Size(200.0, 100.0),
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


class BarChartPainter extends CustomPainter{
  static const barWidth = 10.0;
  BarChartPainter(this.animation):super(repaint:animation);
  final Animation<double> animation;

  @override
    void paint(Canvas canvas, Size size) {
      final  barHeight = animation.value;
      final paint = Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(
        (size.width - barWidth) / 2.0,
        size.height - barHeight,
        barWidth,
        barHeight,
        ),
        paint);
    }
    @override
    bool shouldRepaint(BarChartPainter old) => false;
}