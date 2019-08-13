import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' show lerpDouble;

class Chart01 extends StatefulWidget{
  _Chart01State createState()=>_Chart01State();
}

class _Chart01State extends State<Chart01> with TickerProviderStateMixin{
  final random = Random();
  int dataSet = 50;
  AnimationController animation;
  double startHeight;   // Strike one.
  double currentHeight; // Strike two.
  double endHeight;     // Strike three. Refactor.
  @override
  void initState() {
    super.initState();
    animation = AnimationController(duration: Duration(milliseconds: 500),vsync: this)
                ..addListener((){
                  setState((){
                    currentHeight = lerpDouble( // Strike one.
                      startHeight,
                      endHeight,
                      animation.value,
                    );
                  });
                }); 
    startHeight = 0.0;                // Strike two.
    currentHeight = 0.0;
    endHeight = dataSet.toDouble();
    animation.forward(); 
  }
  void changeData() {
    setState(() {
      startHeight = currentHeight;    // Strike three. Refactor.
      dataSet = random.nextInt(100);
      endHeight = dataSet.toDouble();
      animation.forward(from: 0.0);
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
              painter: BarChartPainter(currentHeight),
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
    animation.dispose();
    super.dispose();
  }
}


class BarChartPainter extends CustomPainter{
  static const barWidth = 10.0;
  BarChartPainter(this.barHeight);
  final double barHeight;

  @override
    void paint(Canvas canvas, Size size) {
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
    bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}