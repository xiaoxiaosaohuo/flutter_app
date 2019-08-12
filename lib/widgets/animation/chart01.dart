import 'package:flutter/material.dart';
import 'dart:math';

class Chart01 extends StatefulWidget{
  _Chart01State createState()=>_Chart01State();
}

class _Chart01State extends State<Chart01>{
  final random = Random();
  int dataSet = 50;

  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
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
              painter: BarChartPainter(dataSet.toDouble()),
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: changeData,
        ),
      );
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