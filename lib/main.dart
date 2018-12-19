import 'package:flutter/material.dart';
import 'dart:convert';
import './src/routes/route1.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
void main() => runApp(new MyApp());


Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
void _loadJson() {
  loadAsset().then((value){
    JsonDecoder decoder = new JsonDecoder();
    var json = decoder.convert(value);
    print(json['title']);
  });
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _loadJson();
    return new MaterialApp(
      title: 'Counter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Counter',initValue: 3,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.initValue: 1}) : super(key: key);
  final String title;
  final int initValue;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter ;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  void initState() {
    super.initState();
    //初始化状态  
    _counter=widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display2,
            ),
            FlatButton(
              child: Text('打开新页面'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, 
                 new MaterialPageRoute(builder: (context) {
                  return new Route1();
                })
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
