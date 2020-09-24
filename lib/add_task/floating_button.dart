import 'package:ToDo_List/app_state/add_task_state.dart';
import 'package:ToDo_List/hive_db/task_storage.dart';
import 'package:ToDo_List/todo/task.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class SaveTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddTaskState state = Provider.of<AddTaskState>(context);
    return FloatingActionButton(
        heroTag: '',
        child: SizedBox(
          width: IconSize,
          height: IconSize,
          child: FlareActor(
            'flare_assets/add-close_icon_button.flr',
            animation: 'idle_add',
          ),
        ),
        onPressed: state.missingValues()
            ? null
            : () async {
                final Task task = state;
                await saveTask(task);
                Navigator.pop(context);
              });
  }
}
