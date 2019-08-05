import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/LoginPage.dart';
// app的首页
Handler homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  },
);

Handler loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {

    return new LoginPage();
  },
);


