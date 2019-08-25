import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:flutter_app/widgets/rate.dart';
// import '../routers/application.dart';
class _MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(10.0, 10.0, size.width - 10.0,  size.height- 10.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
      return true;
  }

}



class _StarCliper extends CustomClipper<Path>{

  final double radius;

  _StarCliper({this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (Math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36);// 36为五角星的角度
    double radius_in = (radius * Math.sin(radian / 2) / Math
        .cos(radian)); // 中间五边形的半径

    path.moveTo((radius * Math.cos(radian / 2)), 0.0);// 此点为多边形的起点
    path.lineTo((radius * Math.cos(radian / 2) + radius_in
        * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) * 2),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius_in
        * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(
        (radius * Math.cos(radian / 2) + radius
            * Math.sin(radian)), (radius + radius
        * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2)),
        (radius + radius_in));
    path.lineTo(
        (radius * Math.cos(radian / 2) - radius
            * Math.sin(radian)), (radius + radius
        * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in
        * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in
        * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));

    path.close();// 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(_StarCliper oldClipper) {
      return this.radius != oldClipper.radius;
  }

}


class WidgetPage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return WidgetPageState();
    }
}

class WidgetPageState extends State<WidgetPage>{
  int starValue = 0;
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
            ),
             new ClipRect(
                clipper: new _MyClipper(),
                child:new SizedBox(
                  width: 100.0,
                  height:100.0,
                  child:  new Image.network("https://inews.gtimg.com/newsapp_bt/0/3744524785/641",fit: BoxFit.fill,),
                ) ,
              ),
              StaticRatingBar(),
              ClipPath(
                clipper: new _StarCliper(radius: 50.0),
                child: new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new Image.network(
                    "https://inews.gtimg.com/newsapp_bt/0/3744524785/641",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              RatingBar(
                    size: 30.0,
                    radiusRatio: 1.4,
                    onChange: (int value) {
                      setState(() {
                        starValue = value;
                      });
                    },
              ),
          ],
        )
        )
        

        
      );
  }
}