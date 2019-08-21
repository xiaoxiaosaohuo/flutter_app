import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/pages/animation_page.dart';
import 'package:flutter_app/widgets/animation/stack_bar_page.dart';
import 'package:flutter_app/widgets/animation/group_stack_bar_page.dart';
import 'package:flutter_app/widgets/animation/group_bar_page.dart';
import 'package:flutter_app/pages/main_page.dart';
// app的首页
Handler mainHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainPage ();
  },
);

Handler loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    return new LoginPage();
  },
);

Handler animationHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    return new AnimationPage();
  },
);

Handler stackBarHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    return new StackBar();
  },
);

Handler groupStackBarHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    return new GroupStackBar();
  },
);

Handler groupBarHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    return new GroupBar();
  },
);

