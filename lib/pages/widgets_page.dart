import 'package:flutter/material.dart';

// import '../routers/application.dart';

class WidgetPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return WidgetPageState();
    }
}

class WidgetPageState extends State<WidgetPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("Widget"),
        ),
        body:
        Container(
          alignment: Alignment.center,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              ClipOval(
                child:SizedBox(
                  width: 100.0,
                  height:100.0,
                  child:Image.network("https://inews.gtimg.com/newsapp_bt/0/3744524785/641",fit: BoxFit.fill,),
                ),
              ),
            ClipRRect(
              borderRadius:BorderRadius.all(
                  Radius.circular(10.0),
              ),
              child: SizedBox(
                width: 150.0,
                height:150.0,
                child:Image.network("https://inews.gtimg.com/newsapp_bt/0/3744524785/641",fit: BoxFit.fill,),

              ),
            )
          ],
        )
        )
        

        
      );
  }
}