import 'package:ToDo_List/main.dart';
import 'package:ToDo_List/page_router.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'add-close_button',
      child: SizedBox(
          width: IconSize,
          height: IconSize,
          child: FlareActor(
            'flare_assets/add-close_icon_button.flr',
            animation: 'idle_add',
          ),
        ),
      onPressed: () {
        Navigator.pushNamed(context, AddTaskRoute);
      },
    );
  }
}
