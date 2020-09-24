import 'package:ToDo_List/hive_db/task_storage.dart';
import 'package:ToDo_List/home/task_list/edit_task_dialogs/add_subtask.dart';
import 'package:ToDo_List/home/task_list/edit_task_dialogs/edit_color_&_priority_dialog.dart';
import 'package:ToDo_List/home/task_list/edit_task_dialogs/edit_task_description.dart';
import 'package:ToDo_List/home/task_list/edit_task_dialogs/edit_task_name.dart';
import 'package:ToDo_List/home/task_list/sub_task.dart';
import 'package:ToDo_List/main.dart';
import 'package:ToDo_List/task_colors.dart';
import 'package:ToDo_List/todo/task.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import '../../calculate_finished_task.dart';
import '../../taskname_textstyle.dart';
import '../../time_format.dart';
import 'high_priority_animation.dart';

class TaskList extends StatelessWidget {
  final bool finishedTask;
  const TaskList(this.finishedTask);
  @override
  Widget build(BuildContext context) {
    Widget taskList(Box<Task> taskBox) => ListView.builder(
        reverse: true,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: taskBox.length,
        itemBuilder: (context, index) {
          final Task task = taskBox.getAt(index);
          if (task.done != finishedTask) return SizedBox.shrink();
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => EditColorAndPriority(
                            index: index,
                            priority: task.priority,
                            color: task.color,
                          ),
                        );
                      },
                      child: PriorityTaskAnimation(
                          task.priority, taskColors[task.color]),
                    ),
                    Checkbox(
                        value: task.done,
                        onChanged: (value) async {
                          await editTask(index: index, done: value);
                        })
                  ],
                ),
                InkWell(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditTaskName(index, task.name),
                    );
                  },
                  child: Text(
                    task.name,
                    style: tasknameTextstyle(task.priority, context),
                  ),
                ),
                InkWell(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditColorAndPriority(
                          index: index, priority: task.priority),
                    );
                  },
                  child: Text(
                    '${task.priority.toString().split('.').last} priority\n'
                    '${dateFormat(task.time)}'
                    '\t·\t${timeFormat(task.time)}',
                    style: Theme.of(context).textTheme.overline,
                  ).topPadding(8),
                ).bottomPadding(),
                if (task.description != null)
                  InkWell(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            EditTaskDescription(index, task.description),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          task.description,
                          style: Theme.of(context).textTheme.subtitle2,
                        ).topPadding(DefaultPaddingValue / 4),
                      ],
                    ).topPadding(),
                  ),
                if (task.subtask.isNotEmpty) Subtasks(task.subtask, index),
                if (task.subtask.isEmpty)
                  OutlineButton.icon(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AddSubtask(index),
                            );
                          },
                          label: Text('Add subtask'))
                      .topPadding()
              ],
            ).allSidePadding(),
          ).bottomPadding();
        });

    return ValueListenableBuilder(
      valueListenable: Hive.box<Task>(TaskHiveBox).listenable(),
      builder: (context, Box taskBox, child) {
        if (taskBox.isEmpty)
          return Container(
            padding: EdgeInsets.all(DefaultPaddingValue),
            // alignment: Alignment.center,
            child: Text(
              'You don\'t have any task',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
        if (finishedTask)
          return ExpansionTile(
            leading: Icon(Icons.done),
            title: Text('Finished task '
                '(${calculateFinishedTask(taskBox.values.toList())})'),
            children: [taskList(taskBox)],
          );
        return taskList(taskBox);
      },
    );
  }
}

