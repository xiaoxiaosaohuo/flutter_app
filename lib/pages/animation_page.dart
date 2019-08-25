import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/widgets/animation/animate01.dart';
import 'package:flutter_app/widgets/animation/animate02.dart';
import '../routers/application.dart';
import 'package:flutter_app/routers/routers.dart';

class AnimationPage extends StatefulWidget{
  AnimationPage();
  @override
    State<StatefulWidget> createState() {
      return AnimationPageState();
    }
}

class AnimationPageState extends State<AnimationPage>{

  final List<String> items = <String>['bar','stack_bar', 'group_bar', 'group_stack_bar','animate_route'];
  final List<int> colorCodes = <int>[900, 800, 600,500,400];

  onPressed(item){
    if(items.indexOf(item) > -1){
      final bool isBar = item.indexOf('bar') > -1;
      final page = isBar ? 'bar_page' :'animate_route_page';
      var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
          return child;
      };
      if (isBar) {
        return Application.router.navigateTo(context, '/$page?pageName=$item',);
      }else{
        return Application.router.navigateTo(
          context, Routes.animateRoutePage + "?pageName=$item",
          transition: TransitionType.custom, /// 指定是自定义动画
          transitionBuilder: transition, /// 自定义的动画
          transitionDuration: const Duration(milliseconds: 1500), /// 时间
        );
      }
      
      
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