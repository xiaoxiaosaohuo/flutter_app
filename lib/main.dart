import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routers.dart';

const int ThemeColor = 0xFFC91B3A;

void main ()=>runApp(MyApp());

class MyApp extends StatelessWidget{

  MyApp(){
    final router = new Router();

    Routes.configureRoutes(router);

    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Flutter",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          ),
        home:LoginPage(),
        onGenerateRoute: Application.router.generator,
      );
    }
}

