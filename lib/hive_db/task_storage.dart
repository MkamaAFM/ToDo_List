import 'package:ToDo_List/todo/sub_task.dart';
import 'package:ToDo_List/todo/task.dart';
import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

const String TaskHiveBox = 'task_hive_box';

Future saveTask(Task task) async {
  final Box taskBox = Hive.box<Task>(TaskHiveBox);
  await taskBox.add(task);
}

Future deleteTask(int index) async {
  final Box taskBox = Hive.box<Task>(TaskHiveBox);
  await taskBox.deleteAt(index);
}

Future editTask(
    {@required int index,
    String name,
    String description,
    Priority priority,
    int color,
    bool done}) async {
  final Box taskBox = Hive.box<Task>(TaskHiveBox);
  final Task task = taskBox.getAt(index);
  if (name != null) task.name = name;
  if (description != null) task.description = description;
  if (priority != null) task.priority = priority;
  if (color != null) task.color = color;
  if (done != null) task.done = done;
  await taskBox.putAt(index, task);
}

Future editSubtask({
  @required int taskIndex,
  @required subtaskIndex,
  String name,
  Priority priority,
  bool done,
}) async {
  final Box taskBox = Hive.box<Task>(TaskHiveBox);
  final Task task = taskBox.getAt(taskIndex);
  if (name != null) task.subtask[subtaskIndex].name = name;
  if (priority != null) task.subtask[subtaskIndex].priority = priority;
  if (done != null) task.subtask[subtaskIndex].done = done;
  await taskBox.putAt(taskIndex, task);
}

Future deleteSubtask(
    {@required int taskIndex, @required int subtaskIndex}) async {
  final Box taskBox = Hive.box<Task>(TaskHiveBox);
  final Task task = taskBox.getAt(taskIndex);
  task.subtask.removeAt(subtaskIndex);
  await taskBox.putAt(taskIndex, task);
}

Future addSubtask(int index, SubTask subtask) async {
  final Box taskBox = Hive.box<Task>(TaskHiveBox);
  final Task task = taskBox.getAt(index);
  task.subtask.add(subtask);
  await taskBox.putAt(index, task);
}
