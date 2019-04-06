import 'package:flutter/material.dart';

class Caculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      // TODO: implement createState
      return CaculatorState();
    }
}

class CaculatorState extends State<StatefulWidget>{
  var num1 = 0,num2 = 0,sum = 0;
  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");

  void handleAdd(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1+num2;
    });
  }
  void handleSub(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1-num2;
    });
  }
  void handleMul(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1*num2;
    });
  }
  void handleDiv(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1~/num2;
    });
  }
  void handleClear(){
    setState(() {
          t1.text='0';
          t2.text = '0';
        });
  }
  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title:'计算器',
        theme: ThemeData(primarySwatch: Colors.red),
        home:Scaffold(
          appBar: AppBar(
            title: Text("计算器"),
          ),
          body: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "OutPut:$sum",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: '输入1'),
                  controller: t1,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: '输入2'),
                  controller: t2,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      child: Text("+"),
                      color: Colors.greenAccent,
                      onPressed: handleAdd,
                    ),
                    MaterialButton(
                      child: Text("-"),
                      color: Colors.greenAccent,
                      onPressed: handleSub,
                    )
                  ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("*"),
                      color: Colors.greenAccent,
                      onPressed: handleMul,
                    ),
                    RaisedButton(
                      child: Text("/"),
                      color: Colors.greenAccent,
                      onPressed: handleDiv,
                    )
                  ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("clear"),
                        color: Colors.red,
                        onPressed: handleClear,
                      )
                    ],
                  )
              ],
            )
          ),
        )
      );
    }
}