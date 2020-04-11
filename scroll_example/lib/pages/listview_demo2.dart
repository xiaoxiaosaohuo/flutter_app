import 'package:flutter/material.dart';

// pixels：当前滚动位置。
// maxScrollExtent：最大可滚动长度。
// extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
// extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
// extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
// atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。

class ListViewDemo2 extends StatefulWidget {
  ListViewDemo2({Key key}) : super(key: key);

  @override
  _ListViewDemo2State createState() => _ListViewDemo2State();
}

class _ListViewDemo2State extends State<ListViewDemo2> {
  String progress = '0%';

  bool handleNotification (ScrollNotification notification){
    double _progress = notification.metrics.pixels /
        notification.metrics.maxScrollExtent;
    //重新构建
    setState(() {
      progress = "${(_progress * 100).toInt()}%";
    });
    print("BottomEdge: ${notification.metrics.extentAfter == 0}");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(title: Text('demo'),),
      body:Container(
       child: NotificationListener<ScrollNotification>(
         onNotification: handleNotification,
         child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
             ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                }
            ),
            CircleAvatar(
              radius: 30.0,
              child: Text(progress),
              backgroundColor: Colors.black54,
            )
          ],
         )
         ),
      )
    );
    
    
  }
}