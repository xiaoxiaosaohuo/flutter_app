import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;
class AnimatedFab extends StatefulWidget {
  AnimatedFab({Key key,this.onClick}) : super(key: key);

  final VoidCallback onClick;

  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<Color> _colorAnimation;

  final double expandedSize = 180.0;
  final double hiddenSize = 20.0;

  double get animateSize => lerp(hiddenSize,expandedSize);

  double lerp(double begin,double end){
    return lerpDouble(begin, end, _animationController.value);
  }
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    _colorAnimation = ColorTween(begin: Colors.pink,end: Colors.pink[800]).animate(_animationController);
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context,Widget child){
          return SizedBox(
            width: expandedSize,
            height: expandedSize,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context,Widget child){
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    _buildExpandedBackground(),
                    _buildOption(Icons.check_circle, 0.0),
                    _buildOption(Icons.flash_on, -math.pi /3),
                    _buildOption(Icons.access_time, -2 * math.pi / 3),
                    _buildOption(Icons.error_outline, math.pi),
                    _bulidFabCore(),
                  ],
                );
              },
            ),
          ); 
      },
    );
  }

  Widget _bulidFabCore(){
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return FloatingActionButton(
      onPressed: _onFabTap,
      child:Transform(
        transform:  Matrix4.identity()..scale(1.0, scaleFactor),
        alignment: Alignment.center,
        child:  Icon(
        _animationController.value > 0.5 ? Icons.close : Icons.filter_list,
        ),
      ), 
      backgroundColor: _colorAnimation.value,
    );
  }


  Widget _buildExpandedBackground(){
    double size = animateSize;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.pink),
    );
  }

  Widget _buildOption(IconData icon, double angle) {
    double iconSize = 0.0;
    if (_animationController.value > 0.8) {
      iconSize = 26.0 * (_animationController.value - 0.8) * 5;
    }
    return  Transform.rotate(
      angle: angle,
      child:Container(
      child:  Align(
        alignment: Alignment.topCenter,
        child:  Padding(
          padding:  EdgeInsets.only(top: 8.0),
          child:  IconButton(
            onPressed: _onIconClick,
            icon:  Transform.rotate(
              angle: -angle,
              child:  Icon(
                icon,
                color: Colors.white,
              ),
            ),
            iconSize:iconSize,
            alignment: Alignment.center,
            padding:  EdgeInsets.all(0.0),
          ),
        ),
      ),
      )
    );
  }


  _onFabTap(){
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }
  
  open() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    }
  }

  close() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  _onIconClick() {
    widget.onClick();
    close();
  }

}