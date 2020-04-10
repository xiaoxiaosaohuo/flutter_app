import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routers.dart';
import 'dart:async';
import 'dart:math';


const int ThemeColor = 0xFFC91B3A;

void main ()=>runApp(MyApp());

class MyApp extends StatelessWidget{

  MyApp(){
    final router = new Router();

    Routes.configureRoutes(router);

    Application.router = router;

    // 声明了一个延迟 3 秒返回 Hello 的 Future，并注册了一个 then 返回拼接后的 Hello 2019
  new Future.value(1).then((v) {
    return new Future.error('boom!');
  }).then((v) {
    return new Future.value('hello');
  }).catchError((error) {
    print('error: $error');
  });

  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Flutter",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          ),
        home:LoginPage(),
        onGenerateRoute: Application.router.generator,
      );
    }
}

