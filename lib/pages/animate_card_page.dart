import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter_app/widgets/animation/card_data.dart';
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
          Container(
            width: double.infinity,
            height: 50.0,
            color:Colors.grey
          )
        ],
      ),
      )
      );
  }
}


class Card extends StatelessWidget {

  Card({Key key,this.viewModel}) : super(key: key);

  final CardViewModel viewModel;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child:Image.asset(viewModel.backdropAssetPath,fit: BoxFit.cover,),
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
            Expanded(child: Container(color:Colors.red),),
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
            Expanded(child: Container(color:Colors.blue),),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finishScrollController = new AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )
      ..addListener(() {
        setState(() {
          scrollPercent =
              lerpDouble(finishScrollStart, finishScrollEnd, finishScrollController.value);

          // if (widget.onScroll != null) {
          //   widget.onScroll(scrollPercent);
          // }
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
    setState(() {
     scrollPercent = (startDragPercentScroll + (-singleCardDragPercent / widget.cards.length))
          .clamp(0.0, 1.0 - (1 / widget.cards.length));
      print('percentScroll: $scrollPercent');
      // if (widget.onScroll != null) {
      //   widget.onScroll(scrollPercent);
      // }
    });
  }

  void _onPanEnd(DragEndDetails details) {
    finishScrollStart = scrollPercent;
    ///计算动画终点。
    finishScrollEnd = (scrollPercent * widget.cards.length).round() / widget.cards.length;
    finishScrollController.forward(from: 0.0);

    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  
  List<Widget> _buildCards(){
    int index = -1;
    return widget.cards.map((CardViewModel viewModel) {
      ++index;
      return _buildCard(viewModel,index, widget.cards.length, scrollPercent);
    }).toList();;
  }
  Widget _buildCard(CardViewModel viewModel,int cardIndex,int cardCount,double scrollPercent){
    /// 计算滑动了多少个card （cardScrollPercent），
    /// cardIndex - cardScrollPercent ，以第二个card 为例，offset.x 是2.0，如果减掉1.5个卡片，它在x轴偏移0.5,第三个卡片就是1.5
    final cardScrollPercent = scrollPercent * cardCount;
    print('卧槽啊999==$cardIndex===${cardIndex - cardScrollPercent}');
    return FractionalTranslation(
      translation: Offset(cardIndex - cardScrollPercent,0.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(viewModel:viewModel),
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