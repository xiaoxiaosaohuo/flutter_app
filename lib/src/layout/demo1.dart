import 'package:flutter/material.dart';

class Demo1 extends StatelessWidget{
//图片的适应模式
  var fitMode = [BoxFit.none,BoxFit.contain, BoxFit.cover,
  BoxFit.fill, BoxFit.fitHeight,BoxFit.fitWidth,BoxFit.scaleDown];

  //循环生成Image控件
formImgs() {
  var imgLi = <Widget>[];
  fitMode.forEach((fit) {
    imgLi.add(Container(
        width: 100,
        height: 50,
        child: Image(
          image: AssetImage("assets/images/1.jpg"),
          fit: fit,
        )));
  });
  return imgLi;
}

  //叠合模式数组
var colorBlendMode = [
  BlendMode.clear,BlendMode.src,BlendMode.dst,
  BlendMode.srcOver,BlendMode.dstOver,BlendMode.srcIn,
  BlendMode.dstIn,BlendMode.srcOut,BlendMode.dstOut,
  BlendMode.srcATop,BlendMode.dstATop,BlendMode.xor,
  BlendMode.plus, BlendMode.modulate,BlendMode.screen,
  BlendMode.overlay,BlendMode.darken,BlendMode.lighten, 
  BlendMode.colorDodge,BlendMode.colorBurn,BlendMode.hardLight,
  BlendMode.softLight,BlendMode.difference,BlendMode.exclusion,
  BlendMode.multiply,BlendMode.hue,BlendMode.saturation,
  BlendMode.color, BlendMode.luminosity,
];


//循环生成Image控件
formImgsColorBlendMode() {
  var imgLi = <Widget>[];
  colorBlendMode.forEach((mode) {
    imgLi.add(Column(children: <Widget>[
      Padding( child:Image(
        width: 60,
        height: 60,
        image: AssetImage("assets/images/1.jpg"),
        color: Colors.red,
        colorBlendMode: mode,
      ), padding: EdgeInsets.all(5),),
      Text(mode.toString().split(".")[1])
    ]));
  });
  return imgLi;
}
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Demo1',
        theme: ThemeData(primarySwatch: Colors.blue),
        home:Scaffold(
            appBar: new AppBar(
					    title: const Text('Widget Demo'),
				    ),
            body:Container(
              child:Wrap(children: <Widget>[
                ...formImgs(),
                ...formImgsColorBlendMode()
              ],) ,
              )
         )
      );
  }
}