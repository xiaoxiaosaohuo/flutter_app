import 'package:flutter/material.dart';
class AirAsiaBar extends StatelessWidget {
  const AirAsiaBar({Key key,this.height}) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red,Color(0xFFE64C85)]
            ),
          ),
        ),
        AppBar(
          title: Text(
            "AirAsia",
            style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'NothingYouCouldDo'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,

        )
      ],
    );
  }
}