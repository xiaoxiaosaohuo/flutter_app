import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:flutter_app/widgets/rate.dart';
import 'package:flutter_app/widgets/sliver_list/basic_list.dart';
import 'package:flutter_app/widgets/sliver_list/sticky_list.dart';
import 'package:flutter_app/widgets/sliver_list/customer_list.dart';
import 'package:flutter_app/widgets/list/index.dart';
class WidgetPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return WidgetPageState();
    }
}

class WidgetPageState extends State<WidgetPage>{
  int starValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //     title: Text("Widget"),
      //   ),
        body:ListViewDemo()
      );
  }
}