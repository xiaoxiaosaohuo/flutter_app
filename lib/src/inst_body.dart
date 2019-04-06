import 'package:flutter/material.dart';
import 'package:flutter_app/src/inst_list.dart';

class InstBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      // TODO: implement build
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: InstaList(),
            
          )
        ],
      );
    }
}