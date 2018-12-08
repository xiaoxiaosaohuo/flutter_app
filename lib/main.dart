import 'package:flutter/material.dart';

import './src/products/productsManager.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "欢迎使用flutter",
      theme: new ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: new ImageCard(),
    );
  }
}

class ImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("EasyList")),
        body: ProductsManager(initialProduct: "陆涛1"));
  }
}
