import 'package:flutter/material.dart';


class PageViewDemo3 extends StatefulWidget {
  @override
  _PageViewDemo3State createState() => _PageViewDemo3State();
}

class _PageViewDemo3State extends State<PageViewDemo3> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  var currentPageValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      setState(() {
        currentPageValue = _controller.page;
      });
    });
  }

 
  
  @override
  Widget build(BuildContext context) {
    print(currentPageValue);
    return Scaffold(
      appBar: AppBar(title: Text('PageViewDemo3'),),
      body: PageView.builder(
        controller: _controller,
        itemBuilder: (context, position) {
          if (position == currentPageValue.floor()) {
            return Transform(
              // transform: Matrix4.identity()..rotateX(currentPageValue - position),
              transform: Matrix4.identity()..setEntry(3, 2, 0.004)..rotateY(currentPageValue - position)..rotateZ(currentPageValue - position),
              child: Container(
                color: position % 2 == 0 ? Colors.blue : Colors.pink,
                child: Center(
                  child: Text(
                    "Page",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
              ),
            );
          } else if (position == currentPageValue.floor() + 1){
            return Transform(
              // transform: Matrix4.identity()..rotateX(currentPageValue - position),
              transform:Matrix4.identity()..setEntry(3, 2, 0.004)..rotateY(currentPageValue - position)..rotateZ(currentPageValue - position),
              child: Container(
                color: position % 2 == 0 ? Colors.blue : Colors.pink,
                child: Center(
                  child: Text(
                    "Page",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              color: position % 2 == 0 ? Colors.blue : Colors.pink,
              child: Center(
                child: Text(
                  "Page",
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            );
          }
        },
        itemCount: 10,
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}