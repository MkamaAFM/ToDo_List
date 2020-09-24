import 'package:flutter/material.dart';

class CustomAppBAr extends StatelessWidget {
  final List<Widget> actions;
  final Widget title;
  final Widget leading;
  const CustomAppBAr({this.actions, this.leading, this.title});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shadowColor: Colors.black,
      snap: true,
      floating: true,
      title: title,
      actions: actions,
      leading: leading,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
