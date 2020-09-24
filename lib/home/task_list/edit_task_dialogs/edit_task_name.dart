import 'package:ToDo_List/hive_db/task_storage.dart';
import 'package:flutter/material.dart';

class EditTaskName extends StatefulWidget {
  final int index;
  final String name;
  const EditTaskName(this.index, this.name);
  @override
  _EditTaskNameState createState() => _EditTaskNameState();
}

class _EditTaskNameState extends State<EditTaskName> {
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit task text'),
      content: TextField(
        controller: controller,
        minLines: 1,
        maxLines: 5,
        autofocus: true,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
            labelText: 'Task text', hintText: 'Write task text here'),
      ),
      actions: [
        FlatButton(
            onPressed: controller.text.isNotEmpty &&
                    controller.text != widget.name
                ? () async {
                    await editTask(index: widget.index, name: controller.text);
                    Navigator.pop(context);
                  }
                : null,
            child: Text('Save changes')),
        FlatButton(
            onPressed: () async {
              await deleteTask(widget.index);
              Navigator.pop(context);
            },
            child: Text('Delete task')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
  }
}
