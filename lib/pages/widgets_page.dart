import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:flutter_app/widgets/rate.dart';
import 'package:flutter_app/widgets/list/basic_list.dart';
import 'package:flutter_app/widgets/list/sticky_list.dart';
import 'package:flutter_app/widgets/list/customer_list.dart';
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
        body:CustomSliverList()
      );
  }
}