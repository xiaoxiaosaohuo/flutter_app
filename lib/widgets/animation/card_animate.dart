import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
class CardFlipper extends StatefulWidget {
  CardFlipper({Key key}) : super(key: key);

  _CardFlipperState createState() => _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper> {


  onPressed(){
    Application.router.navigateTo(context, '/animate_card_page?pageName= CardFlipper',);
  }
  renderBody(){
    return RaisedButton(
      child: Text("点我"),
      onPressed: this.onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
                'CardFlipper',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
          ),
         this.renderBody()
          
        ],
    );
  }
}