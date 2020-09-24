import 'package:ToDo_List/settings/basic_settings.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: IconSize,
        icon: FlareActor(
          'flare_assets/animating_setting_icon.flr',
          fit: BoxFit.fitWidth,
          animation: 'idle',
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => BasicSettings());
        });
  }
}
