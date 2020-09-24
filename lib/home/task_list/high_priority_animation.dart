import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class PriorityTaskAnimation extends StatefulWidget {
  final Priority priority;
  final Color color;
  PriorityTaskAnimation(this.priority, this.color);
  @override
  _PriorityTaskAnimationState createState() => _PriorityTaskAnimationState();
}

class _PriorityTaskAnimationState extends State<PriorityTaskAnimation>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: .7,
        upperBound: 1);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);

    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) animationController.reverse();
      if (status == AnimationStatus.dismissed) animationController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double colorboxSize = 16 * (widget.priority.index.toDouble() + 1);
    final Container child = Container(
      margin: EdgeInsets.only(bottom: DefaultPaddingValue / 2),
      width: colorboxSize,
      height: colorboxSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Theme.of(context).brightness == Brightness.light
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              width: .5),
          color: widget.color),
    );

    if (widget.priority != Priority.High) return child;
    return AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (context, child) {
          return ScaleTransition(child: child, scale: animation);
        });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
