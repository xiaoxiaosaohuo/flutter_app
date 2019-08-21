import 'package:flutter/material.dart';

import 'package:flutter_app/widgets/animation/animate01.dart';
import 'package:flutter_app/widgets/animation/animate02.dart';
import 'package:flutter_app/widgets/animation/chart01.dart';
import '../routers/application.dart';


class AnimationPage extends StatefulWidget{
  AnimationPage();
  @override
    State<StatefulWidget> createState() {
      return AnimationPageState();
    }
}

class AnimationPageState extends State<AnimationPage>{

  final List<String> items = <String>['stack_bar', 'group_bar', 'group_stack_bar'];
  final List<int> colorCodes = <int>[900, 500, 300];

  onPressed(item){
    if(items.indexOf(item) > -1){
      Application.router.navigateTo(context, '/$item');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("Animate"),
        ),
        body:ListView.separated(
          itemCount: items.length,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context,index){
            return GestureDetector(
                child: Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(child: Text('Entry ${items[index]}')),
                    ),
                onTap:()=>this.onPressed(items[index]),
              );
          },
         
          separatorBuilder: (context, index)=> const Divider(),

        )
      );
  }
}