import 'package:flutter/material.dart';
import 'package:flutter_app/pages/bottom_drawer.dart';
import 'package:flutter_app/widgets/fliter_menu/diagonal_clipper.dart';
DragController controller = DragController();

class BottomDrawerPage extends StatefulWidget {

 @override
 _BottomDrawerPageState createState() => _BottomDrawerPageState();
}

class _BottomDrawerPageState extends State<BottomDrawerPage> {

  double _imageHeight = 256.0;

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Menu'),
      ),
      body: Stack(
        children: <Widget>[
          buildImage(),
          _buildTopHeader(),
        ]
      ),
    );
  }

  Widget buildImage(){
    return ClipPath(
      clipper: DialogonalClipper(),
      child:Image.asset(
        'assets/images/italy01.jpg',
        fit: BoxFit.fitHeight,
        height: _imageHeight,
        colorBlendMode: BlendMode.srcOver,
        color: Color.fromARGB(120, 20, 10, 40),
      )
    ) ;
  }

  Widget _buildTopHeader (){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu,size: 32.0,color:Colors.white,),
          new Expanded(
          child: new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              "Timeline",
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        new Icon(Icons.linear_scale, color: Colors.white),
        ],
      ),
    );
  }
}