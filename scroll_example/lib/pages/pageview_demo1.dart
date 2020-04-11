import 'package:flutter/material.dart';


class PageViewDemo1 extends StatefulWidget {
  @override
  _PageViewDemo1State createState() => _PageViewDemo1State();
}

class _PageViewDemo1State extends State<PageViewDemo1> {
  PageController _controller = PageController(
    initialPage: 1,
    viewportFraction: 0.8
  );
  @override
  Widget build(BuildContext context) {
    print(_controller);
    return Scaffold(
      appBar: AppBar(title: Text('PageViewDemo1'),),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.deepPurple,
          ),
        ],
        physics: BouncingScrollPhysics(),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
