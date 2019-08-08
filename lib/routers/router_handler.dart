import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/pages/animation_page.dart';
// app的首页
Handler mainHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new MainPage();
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


