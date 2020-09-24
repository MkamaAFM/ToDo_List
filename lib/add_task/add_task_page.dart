import 'package:ToDo_List/add_task/add_subtask.dart';
import 'package:ToDo_List/add_task/choose_color.dart';
import 'package:ToDo_List/add_task/floating_button.dart';
import 'package:ToDo_List/add_task/name_&_description_textfield.dart';
import 'package:ToDo_List/add_task/priority_slider.dart';
import 'package:ToDo_List/app_bar.dart';
import 'package:ToDo_List/app_state/add_task_state.dart';
import 'package:ToDo_List/page_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'close_button.dart' as customWidget;

class AddTaskPage extends StatelessWidget {
  final Animation<double> pageRouteAnimation;
  AddTaskPage(this.pageRouteAnimation);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddTaskState>(
      create: (context) => AddTaskState(),
      child: PageFadeAnimation(
        animation: pageRouteAnimation,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: PageSlideAnimation(
              startPosition: Offset(3, 0),
              animation: pageRouteAnimation,
              child: SaveTaskButton()),
          body: CustomScrollView(
            slivers: [
              CustomAppBAr(
                leading: customWidget.CloseButton(),
                title: Text('Add Task'),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                PageSlideAnimation(
                    startingInterval: .1,
                    child: NameTextfield(),
                    animation: pageRouteAnimation,
                    startPosition: Offset(1, 0)),
                PageSlideAnimation(
                    startingInterval: .2,
                    child: PrioritySlider(),
                    animation: pageRouteAnimation,
                    startPosition: Offset(-1, 0)),
                PageSlideAnimation(
                    startingInterval: .3,
                    child: AddSubTask(),
                    animation: pageRouteAnimation,
                    startPosition: Offset(0, 2)),
                PageSlideAnimation(
                    startingInterval: .3,
                    child: ChooseColor(),
                    animation: pageRouteAnimation,
                    startPosition: Offset(0, 3)),
                SizedBox(
                  height: DefaultPaddingValue * 5,
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
