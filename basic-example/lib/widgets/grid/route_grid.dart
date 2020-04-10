import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/routers/routers.dart';

class RouteAnimate extends StatefulWidget {
  RouteAnimate({Key key}) : super(key: key);

  _RouteAnimateState createState() => _RouteAnimateState();
}

class _RouteAnimateState extends State<RouteAnimate> {

  renderRouteItem(){
    return GestureDetector(
      onTap:this.goToRoutePage,
      child:Container(
        color: Colors.redAccent,
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.width/2,
        child: Text('route animate'),
      ),
    ); 
  }
  goToRoutePage(){
     var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
          return child;
      };
    Application.router.navigateTo(
      context, 
      Routes.animateRoutePage + "?pageName=animate_route",
      transition: TransitionType.custom, /// 指定是自定义动画
      transitionBuilder: transition, /// 自定义的动画
      transitionDuration: const Duration(milliseconds: 1500), /// 时间
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
                'Route',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
          ),
          this.renderRouteItem()
          
        ],
    );
  }
}