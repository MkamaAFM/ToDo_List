import 'package:ToDo_List/hive_db/task_storage.dart';
import 'package:ToDo_List/home/task_list/edit_task_dialogs/add_subtask.dart';
import 'package:ToDo_List/home/task_list/edit_task_dialogs/edit_subtask.dart';
import 'package:ToDo_List/todo/sub_task.dart';
import 'package:flutter/material.dart';
import '../../calculate_finished_task.dart';
import '../../time_format.dart';
import '../../main.dart';

class Subtasks extends StatelessWidget {
  final List<SubTask> subtasks;
  final int taskIndex;
  Subtasks(this.subtasks, this.taskIndex);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text('Subtask${subtasks.length > 1 ? 's' : ''}'
          ' (${calculateFinishedTask(subtasks)}/'
          '${subtasks.length})'),
      children: List.generate(subtasks.length + 1, (index) {
        if (index == subtasks.length)
          // return OutlineButton.icon(
          //     onPressed: () {},
          //     icon: Icon(Icons.add),
          //     label: Text('Add subtask'));
          return ListTile(
            title: Text('Add new subtask'),
            leading: Icon(Icons.add),
            contentPadding: EdgeInsets.zero,
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) => AddSubtask(taskIndex),
              );
            },
          );
        return InkWell(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) => EditSubtask(
                taskIndex: taskIndex,
                subtaskIndex: index,
                name: subtasks[index].name,
                priority: subtasks[index].priority,
              ),
            );
          },
          child: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            onChanged: (value) async {
              await editSubtask(
                  taskIndex: taskIndex, subtaskIndex: index, done: value);
            },
            value: subtasks[index].done,
            title: Text(subtasks[index].name),
            subtitle: Text(
                '${subtasks[index].priority.toString().split('.').last} priority'
                '\t\t${dateFormat(subtasks[index].time, showWeekday: false)}'),
          ),
        );
      }),
    ).topPadding();
  }
}
