import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/animation/animate_bar/bar_widget.dart';
import 'package:flutter_app/widgets/animation/animate_bar/group_bar_widget.dart';
import 'package:flutter_app/widgets/animation/animate_bar/stack_bar_widget.dart';
import 'package:flutter_app/widgets/animation/animate_bar/group_stack_bar_widget.dart';

class BarPage extends StatelessWidget {
  const BarPage({Key key,this.name}) : super(key: key);

  final String name;

  Widget _buildBody(name){
    switch(name){
      case 'bar':
        return Bar();
      case 'group_bar':
        return GroupBar();
      case 'stack_bar':
        return StackBar();
      case 'group_stack_bar':
        return GroupStackBar();
      default:
        break;
    }
   return Text("unknow error");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name)
      ),
      body: _buildBody(name),
    );
  }
}


