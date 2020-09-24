import 'package:flutter/material.dart';

class PageSlideAnimation extends StatelessWidget {
  final Widget child;
  final Animation animation;
  final Offset startPosition;
  final double startingInterval, endingInterval;
  PageSlideAnimation(
      {@required this.child,
      @required this.animation,
      @required this.startPosition,
      this.startingInterval = 0,
      this.endingInterval = 1});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: child,
      animation: animation,
      builder: (context, widget) => SlideTransition(
        position: Tween<Offset>(begin: startPosition, end: Offset(0, 0))
            .animate(CurvedAnimation(
                parent: animation,
                curve: Interval(startingInterval, endingInterval,
                    curve: Curves.easeOut))),
        child: widget,
      ),
    );
  }
}

class PageFadeAnimation extends StatelessWidget {
  final Animation animation;
  final Widget child;
  PageFadeAnimation({@required this.child, @required this.animation});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, widget) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: widget,
      ),
    );
  }
}
