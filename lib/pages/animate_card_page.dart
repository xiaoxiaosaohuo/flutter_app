import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter_app/widgets/animation/card_data.dart';

enum Direction {
  LEFT, RIGHT
}


class AnimateCardPage extends StatefulWidget {
  AnimateCardPage({Key key,this.name}) : super(key: key);
   final String name;

  _AnimateCardPageState createState() => _AnimateCardPageState();
}

class _AnimateCardPageState extends State<AnimateCardPage> {
  double scrollPercent = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //card 
          Expanded(child: CardFlipper(
            cards: demoCards,
            onScroll: (double scrollPercent) {
              setState(() => this.scrollPercent = scrollPercent);
            }),
            ),
          //bottom 
           new BottomBar(
            cardCount: demoCards.length,
            scrollPercent: scrollPercent,
          ),
        ],
      ),
      )
      );
  }
}


class Card extends StatelessWidget {

  Card({Key key,this.viewModel,this.parallaxPercent}) : super(key: key);

  final CardViewModel viewModel;
  final double parallaxPercent; // [0.0, 1.0] (0.0 for all the way right, 1.0 for all the way left)

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: new Container(
            child: new FractionalTranslation(
              translation: new Offset(parallaxPercent * 2.0, 0.0),
              child: new OverflowBox(
                maxWidth: double.infinity,
                child: new Image.asset(
                  viewModel.backdropAssetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0,left: 20.0,right:20.0),
              child: Text(
                '${viewModel.address}'.toUpperCase(),
                style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.white,
                  fontFamily: 'petita',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0
                  ),
                ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${viewModel.minHeightInFeet} - ${viewModel.maxHeightInFeet}',
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 140.0,
                    fontFamily: 'petita',
                    letterSpacing: -5.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0,top:30.0),
                  child: Text(
                    'FT',
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 22.0,
                      fontFamily: 'petita',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            //温度
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Text(
                   '${viewModel.tempInDegrees.toStringAsFixed(1)}º',
                    style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'petita',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: Container(),),
            Padding(
              padding: EdgeInsets.only(top:50.0,bottom:50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Padding(
                 padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                       '${viewModel.weatherType}',
                        style:TextStyle(
                              color: Colors.white,
                              fontFamily: 'petita',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Icon(
                          Icons.wb_cloudy,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${viewModel.windSpeedInMph}mph ${viewModel.cardinalDirection}',
                        style: new TextStyle(
                          color: Colors.white,
                          fontFamily: 'petita',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            
          ],
        )
      ],
    );
  }
}



class CardFlipper extends StatefulWidget {
  
  CardFlipper({
    this.cards,
    this.onScroll,
  });

  final List<CardViewModel> cards;
  final Function onScroll;


  _CardFlipperState createState() => _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper> with TickerProviderStateMixin  {

  double scrollPercent = 0.0;
  Offset startDrag; //初始拖动位置
  double startDragPercentScroll; //初始拖动百分比
  double finishScrollStart; 
  double finishScrollEnd;
  AnimationController finishScrollController;
  Direction direction = Direction.LEFT;

  @override
  void initState() {
    super.initState();
    finishScrollController = new AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          scrollPercent =
              lerpDouble(finishScrollStart, finishScrollEnd, finishScrollController.value);

          if (widget.onScroll != null) {
            widget.onScroll(scrollPercent);
          }
        });
      })
      ..addStatusListener((AnimationStatus status) {});

  }
  @override
  void dispose() {
    finishScrollController.dispose();
    super.dispose();
  }
  ///记录开始拖动的位置和拖动时的卡片整体滚动占比
  void _onPanStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }
  ///计算拖动时的拖动距离dragDistance，单个卡片被拖动距离占屏幕宽度比singleCardDragPercent
  void _onPanUpdate(DragUpdateDetails details) {
    final currDrag = details.globalPosition;
    final dragDistance = currDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size.width;
    final numCards = widget.cards.length;

    if (singleCardDragPercent > 0) {
      direction = Direction.LEFT;
    } else {
      direction = Direction.RIGHT;
    }


    setState(() {
     scrollPercent = (startDragPercentScroll + (-singleCardDragPercent / numCards))
          .clamp(0.0, 1.0 - (1 / numCards));
      print('percentScroll: $scrollPercent');
      if (widget.onScroll != null) {
        widget.onScroll(scrollPercent);
      }
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final numCards = widget.cards.length;
    finishScrollStart = scrollPercent;
    ///计算动画终点。

    if (direction == Direction.LEFT) {
      finishScrollEnd = (scrollPercent * numCards).floor() / numCards;
    } else {
      finishScrollEnd = (scrollPercent * numCards).ceil() / numCards;
    }
    finishScrollController.forward(from: 0.0);

    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  
  Matrix4 _buildCardProjection(double scrollPercent) {
    // Pre-multiplied matrix of a projection matrix and a view matrix.
    //
    // Projection matrix is a simplified perspective matrix
    // http://web.iitd.ac.in/~hegde/cad/lecture/L9_persproj.pdf
    // in the form of
    // [[1.0, 0.0, 0.0, 0.0],
    //  [0.0, 1.0, 0.0, 0.0],
    //  [0.0, 0.0, 1.0, 0.0],
    //  [0.0, 0.0, -perspective, 1.0]]
    //
    // View matrix is a simplified camera view matrix.
    // Basically re-scales to keep object at original size at angle = 0 at
    // any radius in the form of
    // [[1.0, 0.0, 0.0, 0.0],
    //  [0.0, 1.0, 0.0, 0.0],
    //  [0.0, 0.0, 1.0, -radius],
    //  [0.0, 0.0, 0.0, 1.0]]
    final perspective = 0.002;
    final radius = 1.0;
    final angle = scrollPercent * pi / 8;

  Matrix4 projection = new Matrix4.identity()
      ..setEntry(0, 0, 1 / radius)
      ..setEntry(1, 1, 1 / radius)
      ..setEntry(3, 2, -perspective)
      ..setEntry(2, 3, -radius)
      ..setEntry(3, 3, perspective * radius + 1.0);

    // Corrected projection to simulate original design.
    // Translates the card further back into the "scene" depending on the absolute angle.
    // X-translation is to bring the cards closer together while swiping to reduce blank-space so it matches the original.
    
    projection *= 
        new Matrix4.translationValues(angle * 100.0, 0.0, -0.0 + angle.abs() * -700.0) *
        new Matrix4.rotationY(angle);

    return projection;
  }

  List<Widget> _buildCards(){
    int index = -1;
    return widget.cards.map((CardViewModel viewModel) {
      ++index;
      return _buildCard(viewModel,index, widget.cards.length, scrollPercent);
    }).toList();
  }
  Widget _buildCard(CardViewModel viewModel,int cardIndex,int cardCount,double scrollPercent){
    /// 计算滑动了多少个card （cardScrollPercent），
    /// cardIndex - cardScrollPercent ，以第二个card 为例，offset.x 是2.0，如果减掉1.5个卡片，它在x轴偏移0.5,第三个卡片就是1.5
    final cardScrollPercent = scrollPercent * cardCount;
    final parallax = scrollPercent - (cardIndex / widget.cards.length);

    print('卧槽啊999==$cardIndex===${cardIndex - cardScrollPercent}');
    return FractionalTranslation(
      translation: Offset(cardIndex - cardScrollPercent,0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Transform(
          transform: _buildCardProjection(cardScrollPercent - cardIndex),
          alignment: FractionalOffset.center,
          child: new Card(
            viewModel: viewModel,
            parallaxPercent: parallax,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onPanStart,
      onHorizontalDragUpdate: _onPanUpdate,
      onHorizontalDragEnd: _onPanEnd,
      behavior:HitTestBehavior.translucent,
        child: Stack(
            children: _buildCards(),
          ),
    );
    
  }
}


class BottomBar extends StatelessWidget {
  final int cardCount;
  final double scrollPercent;

  BottomBar({
    this.cardCount,
    this.scrollPercent,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Center(
                child: new Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
            new Expanded(
              child: new Center(
                child: new Container(
                  width: double.infinity,
                  height: 5.0,
                  child: new ScrollIndicator(
                    cardCount: cardCount,
                    scrollPercent: scrollPercent,
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new Center(
                child: new Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollIndicator extends StatelessWidget {
  final int cardCount;
  final double scrollPercent;

  ScrollIndicator({
    this.cardCount,
    this.scrollPercent,
  });

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: new ScrollIndicatorPainter(
        cardCount: cardCount,
        scrollPercent: scrollPercent,
      ),
      child: new Container(),
    );
  }
}

class ScrollIndicatorPainter extends CustomPainter {
  final int cardCount;
  final double scrollPercent;
  final Paint trackPaint;
  final Paint thumbPaint;

  ScrollIndicatorPainter({
    this.cardCount,
    this.scrollPercent,
  })  : trackPaint = new Paint()
          ..color = const Color(0xFF444444)
          ..style = PaintingStyle.fill,
        thumbPaint = new Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw track
    canvas.drawRRect(
      new RRect.fromRectAndCorners(
        new Rect.fromLTWH(
          0.0,
          0.0,
          size.width,
          size.height,
        ),
        topLeft: new Radius.circular(3.0),
        topRight: new Radius.circular(3.0),
        bottomLeft: new Radius.circular(3.0),
        bottomRight: new Radius.circular(3.0),
      ),
      trackPaint,
    );

    // Draw thumb
    final thumbWidth = size.width / cardCount;
    final thumbLeft = scrollPercent * size.width;

    Path thumbPath = new Path();
    thumbPath.addRRect(
      new RRect.fromRectAndCorners(
        new Rect.fromLTWH(
          thumbLeft,
          0.0,
          thumbWidth,
          size.height,
        ),
        topLeft: new Radius.circular(3.0),
        topRight: new Radius.circular(3.0),
        bottomLeft: new Radius.circular(3.0),
        bottomRight: new Radius.circular(3.0),
      ),
    );

    // Thumb shape
    canvas.drawPath(
      thumbPath,
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}