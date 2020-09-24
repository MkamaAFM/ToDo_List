import 'package:ToDo_List/todo/sub_task.dart';
import 'package:ToDo_List/todo/task.dart';
import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/material.dart';

class AddTaskState extends Task with ChangeNotifier {
  set setName(String name) {
    super.name = name;
    notifyListeners();
  }

  set setDescription(String description) {
    super.description = description;
    notifyListeners();
  }

  set setPriority(double value) {
    final double jumpValue = .1;
    if (value <= jumpValue)
      super.priority = Priority.Low;
    else if (value <= jumpValue * 2)
      super.priority = Priority.Normal;
    else
      super.priority = Priority.High;
    notifyListeners();
  }

  set setColor(int color) {
    if (color != null) {
      super.color = color;
      notifyListeners();
    }
  }

  void addSubtask(SubTask subTask) {
    if (subTask != null) {
      super.subtask.add(subTask);
      notifyListeners();
    }
  }

  void deleteSubtask(int index) {
    super.subtask.removeAt(index);
    notifyListeners();
  }

  double get getPriorityValue =>
      (super.priority.index + 1 / Priority.values.length) / 10;

  String get getPriorityLabel => super.priority.toString().split('.').last;

  bool missingValues() => super.name.isEmpty;
}
