import 'package:flutter/material.dart';
import 'package:flutter_app/src/animatedDemo.dart';

void main ()=>runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: AnimatedDemo(),
    );
  }
}


