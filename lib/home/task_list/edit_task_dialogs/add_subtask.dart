import 'package:ToDo_List/hive_db/task_storage.dart';
import 'package:ToDo_List/todo/sub_task.dart';
import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';

class AddSubtask extends StatefulWidget {
  final int taskIndex;
  const AddSubtask(this.taskIndex);
  @override
  _AddSubtaskState createState() => _AddSubtaskState();
}

class _AddSubtaskState extends State<AddSubtask> {
  TextEditingController controller;
  Priority priority;
  @override
  void initState() {
    controller = TextEditingController();
    priority = Priority.Normal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add subtask'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              minLines: 1,
              maxLines: 5,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  labelText: 'Subtask name',
                  hintText: 'Write the name of subtask here'),
            ).allSidePadding(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      DefaultPaddingValue,
                      DefaultPaddingValue,
                      DefaultPaddingValue,
                      DefaultPaddingValue / 4),
                  child: Text(
                    'Priority',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(DefaultPaddingValue,
                      DefaultPaddingValue / 4, DefaultPaddingValue, 0),
                  child: Wrap(
                    spacing: DefaultPaddingValue / 2,
                    children: List.generate(
                        Priority.values.length,
                        (index) => ChoiceChip(
                              label: Text(Priority.values[index]
                                  .toString()
                                  .split('.')
                                  .last),
                              selected: priority == Priority.values[index],
                              onSelected: (value) {
                                setState(() {
                                  priority = Priority.values[index];
                                });
                              },
                            )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        FlatButton(
            onPressed: controller.text.isEmpty
                ? null
                : () async {
                    await addSubtask(
                        widget.taskIndex,
                        SubTask()
                          ..name = controller.text
                          ..priority = priority);
                    Navigator.pop(context);
                  },
            child: Text('Add'))
      ],
    );
  }
}
