import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app/widgets/animation/slide_card/index.dart';
class FlutterNestedScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('嵌套列表'),
      ),
      body: SlideCard()
    );
  }
}