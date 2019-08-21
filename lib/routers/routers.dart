import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';

class Routes{
  static String root = "/";
  static String home = "/main";
  static String login = "/login";
  static String animation = '/animation';
  static String stackBar = '/stack_bar';
  static String groupStackBar = '/group_stack_bar';
  static String groupBar = '/group_bar';
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(login, handler: loginHandler);
    router.define(home, handler: mainHandler);
    router.define(animation,handler: animationHandler);
    router.define(stackBar,handler:stackBarHandler);
    router.define(groupStackBar,handler:groupStackBarHandler);
    router.define(groupBar,handler:groupBarHandler);
    
  }
}