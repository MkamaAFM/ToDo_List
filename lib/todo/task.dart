import 'package:ToDo_List/hive_db/hive_type_id.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../task_colors.dart';
import 'sub_task.dart';
import 'todo.dart';
part 'task.g.dart';

@HiveType(typeId: TaskTypeID)
class Task extends ToDo {
  @HiveField(4)
  String description;
  @HiveField(5)
  int color = 2;
  @HiveField(6)
  List<SubTask> subtask = <SubTask>[];
  //TODO: add reminder and alarm
  Color get getColor=>taskColors[color];
}
