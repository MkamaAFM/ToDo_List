import 'package:ToDo_List/hive_db/task_storage.dart';
import 'package:flutter/material.dart';

class EditTaskDescription extends StatefulWidget {
  final int index;
  final String description;
  const EditTaskDescription(this.index, this.description);
  @override
  _EditTaskDescriptionState createState() => _EditTaskDescriptionState();
}

class _EditTaskDescriptionState extends State<EditTaskDescription> {
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit description'),
      content: TextField(
        controller: controller,
        maxLines: 5,
        minLines: 1,
        autofocus: true,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
            labelText: 'Task description',
            hintText: 'Write task description here'),
      ),
      actions: [
        FlatButton(
            onPressed: controller.text.isNotEmpty &&
                    controller.text != widget.description
                ? () async {
                    await editTask(
                        index: widget.index, description: controller.text);
                    Navigator.pop(context);
                  }
                : null,
            child: Text('Save changes')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
  }
}
