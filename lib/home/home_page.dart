import 'package:ToDo_List/app_bar.dart';
import 'package:ToDo_List/app_state/theme_state.dart';
import 'package:ToDo_List/home/add_button.dart';
import 'package:ToDo_List/home/setting_button.dart';
import 'package:ToDo_List/home/task_list/task_list.dart';
import 'package:ToDo_List/main.dart';
import 'package:ToDo_List/settings/setting_dialogs/appbar_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../page_animation.dart';

class HomePage extends StatelessWidget {
  final Animation<double> pageRouteAnimation;
  HomePage(this.pageRouteAnimation);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          PageFadeAnimation(animation: pageRouteAnimation, child: AddButton()),
      body: CustomScrollView(
        slivers: [
          Consumer<ThemeState>(
            builder: (context, state, child) => CustomAppBAr(
              title: InkWell(
                  onTap: () async {
                    state.changeAppbarName(await showDialog(
                      context: context,
                      builder: (context) => AppbarNameDialog(state.appbarName),
                    ));
                  },
                  child: Text(state.appbarName)),
              actions: [SettingButton()],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            TaskList(false),
            TaskList(true),
            SizedBox(
              height: DefaultPaddingValue * 5,
            )
          ]))
        ],
      ),
    );
  }
}
