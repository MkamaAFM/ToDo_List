import 'package:ToDo_List/hive_db/hive_type_id.dart';
import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: PriorityTypeID)
enum Priority {
  @HiveField(0)
  Low,
  @HiveField(1)
  Normal,
  @HiveField(2)
  High,
}

@HiveType(typeId: ToDoTypeID)
class ToDo {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  Priority priority = Priority.Normal;
  @HiveField(2)
  bool done = false;
  @HiveField(3)
  final DateTime time = DateTime.now();
}
