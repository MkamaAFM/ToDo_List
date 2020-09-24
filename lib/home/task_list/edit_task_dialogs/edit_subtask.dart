import 'package:ToDo_List/hive_db/task_storage.dart';
import 'package:ToDo_List/main.dart';
import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/material.dart';

class EditSubtask extends StatefulWidget {
  final int taskIndex, subtaskIndex;
  final String name;
  final Priority priority;
  const EditSubtask(
      {@required this.taskIndex,
      @required this.subtaskIndex,
      @required this.name,
      @required this.priority});

  @override
  _EditSubtaskState createState() => _EditSubtaskState();
}

class _EditSubtaskState extends State<EditSubtask> {
  Priority priority;
  bool newChanges = false;
  TextEditingController controller;
  @override
  void initState() {
    priority = widget.priority;
    controller = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    newChanges = priority == widget.priority && controller.text == widget.name
        ? false
        : true;
    return AlertDialog(
      title: Text('Edit subtask'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Change priority').allSidePadding(DefaultPaddingValue / 4),
            Wrap(
              spacing: DefaultPaddingValue,
              children: List.generate(
                  Priority.values.length,
                  (index) => ChoiceChip(
                        selected: priority == Priority.values[index],
                        label: Text(
                            Priority.values[index].toString().split('.').last),
                        onSelected: (value) {
                          setState(() {
                            priority = Priority.values[index];
                          });
                        },
                      )),
            ),
            TextField(
              controller: controller,
              minLines: 1,
              maxLines: 3,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  labelText: 'Edit subtask text',
                  hintText: 'Write subtask text here'),
            ).topPadding()
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: newChanges && controller.text.isNotEmpty
                ? () async {
                    await editSubtask(
                        taskIndex: widget.taskIndex,
                        subtaskIndex: widget.subtaskIndex,
                        name: controller.text,
                        priority: priority);
                    Navigator.pop(context);
                  }
                : null,
            child: Text('Save changes')),
        FlatButton(
            onPressed: () async {
              await deleteSubtask(
                  taskIndex: widget.taskIndex,
                  subtaskIndex: widget.subtaskIndex);
              Navigator.pop(context);
            },
            child: Text('Delete')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
  }
}
