import 'package:flutter/material.dart';
import 'dart:math' as math;


// 折叠效果

class SliverDemo1 extends StatefulWidget {
  SliverDemo1({Key key}) : super(key: key);

  @override
  _SliverDemo1State createState() => _SliverDemo1State();
}

class _SliverDemo1State extends State<SliverDemo1> {
  ScrollController _controller = new ScrollController();
  GlobalKey sliverKey = GlobalKey();

  void handleTapHeader(int index){
    print(_controller);
    var currentOffset = _controller.offset;
    // var context= sliverKey.currentContext;
    print(currentOffset);
    _controller.animateTo(
      2000.0,
      duration:const Duration(milliseconds: 300),
      curve:Curves.ease
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Collapsing List Demo')),
        body: CollapsingList(handleTapHeader:handleTapHeader,controller:_controller,sliverKey:sliverKey),
      );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, 
      double shrinkOffset, 
      bool overlapsContent) 
  {
    return new SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {

  CollapsingList({this.handleTapHeader,this.controller,this.sliverKey});
  final Function handleTapHeader;
  final ScrollController controller;
  final GlobalKey sliverKey;

  SliverPersistentHeader makeHeader(String headerText,int index) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        child: GestureDetector(
          onTap: ()=>handleTapHeader(index),
          child: Container(
            color: Colors.lightBlue, child: Center(child:
                Text(headerText))),
          ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller:controller,
      slivers: <Widget>[
        makeHeader('Header Section 1',0),
        SliverGrid.count(
          crossAxisCount: 3,
          children: [
            Container(color: Colors.red, height: 150.0),
            Container(color: Colors.purple, height: 150.0),
            Container(color: Colors.green, height: 150.0),
            Container(color: Colors.orange, height: 150.0),
            Container(color: Colors.yellow, height: 150.0),
            Container(color: Colors.pink, height: 150.0),
            Container(color: Colors.cyan, height: 150.0),
            Container(color: Colors.indigo, height: 150.0),
            Container(color: Colors.blue, height: 150.0),
          ],
        ),
        makeHeader('Header Section 2',1),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
            ],
          ),
        ),
        makeHeader('Header Section 3',2),
        SliverGrid(
          key:sliverKey,
          gridDelegate: 
              new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: new Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        makeHeader('Header Section 4',3),
        // Yes, this could also be a SliverFixedExtentList. Writing 
        // this way just for an example of SliverList construction.
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.cyan, height: 150.0),
              Container(color: Colors.indigo, height: 150.0),
              Container(color: Colors.blue, height: 150.0),
            ],
          ),
        ),
      ],
    );
  }
}