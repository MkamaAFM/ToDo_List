import 'todo/todo.dart';

int calculateFinishedTask(List<ToDo> tasks) {
  int finishedTask = 0;
  tasks.forEach((element) {
    if (element.done) finishedTask++;
  });
  return finishedTask;
}