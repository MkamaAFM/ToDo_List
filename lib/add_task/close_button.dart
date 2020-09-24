import 'package:ToDo_List/main.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'add-close_button',
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          iconSize: IconSize,
          icon: FlareActor(
            'flare_assets/add-close_icon_button.flr',
            animation: 'idle_close',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
