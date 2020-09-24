import 'package:ToDo_List/hive_db/hive_type_id.dart';
import 'package:hive/hive.dart';
import 'todo.dart';
part 'sub_task.g.dart';

@HiveType(typeId: SubtaskTypeID)
class SubTask extends ToDo {}
