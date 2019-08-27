import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/animation/route_animation/animate_button.dart';
import 'package:flutter_app/widgets/animation/route_animation/animate_text.dart';
import 'package:flutter_app/widgets/animation/route_animation/header_widget.dart';
class RouteAnimation extends StatefulWidget {
  @override
  _RouteAnimationState createState() => _RouteAnimationState();
}

class _RouteAnimationState extends State<RouteAnimation> {
  Animation<double> controller;
  Animation<Offset> imageTranslation;
  Animation<Offset> textTranslation;
  Animation<Offset> buttonTranslation;
  Animation<double> imageOpacity;
  Animation<double> textOpacity;
  Animation<double> buttonOpacity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller == null) {
      controller = ModalRoute.of(context).animation;
      imageTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.67, curve: Curves.fastOutSlowIn),
        ),
      );
      imageOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.67, curve: Curves.easeIn),
        ),
      );
      textTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.34, 0.84, curve: Curves.ease),
        ),
      );
      textOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.34, 0.84, curve: Curves.linear),
        ),
      );
      buttonTranslation = Tween(
        begin: Offset(0.0, 2.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.67, 1.0, curve: Curves.easeIn),
        ),
      );
      buttonOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.67, 1.0, curve: Curves.easeIn),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Column(
          children: <Widget>[
            FractionalTranslation(
              translation: imageTranslation.value,
              child: HeaderImage(),
            ),
            Expanded(
              child: FractionalTranslation(
                translation: textTranslation.value,
                child: AnimateText(),
              ),
            ),
            FractionalTranslation(
              translation: buttonTranslation.value,
              child: AnimateButton(),
            ),
            SizedBox(height: 34.0),
          ],
        );
      },
    );
  }
}