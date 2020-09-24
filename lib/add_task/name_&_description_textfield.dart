import 'package:ToDo_List/app_state/add_task_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class NameTextfield extends StatefulWidget {
  @override
  _NameTextfieldState createState() => _NameTextfieldState();
}

class _NameTextfieldState extends State<NameTextfield>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final AddTaskState state = Provider.of<AddTaskState>(context);
    return AnimatedSize(
      vsync: this,
      duration: AnimationDuration,
      child: Card(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                state.setName = value;
              },
              decoration: InputDecoration(
                  labelText: 'Task name',
                  hintText: 'Write the name of to-do task here'),
            ).allSidePadding(),
            TextField(
              minLines: 1,
              maxLines: 5,
              onChanged: (value) {
                state.setDescription = value;
              },
              decoration: InputDecoration(
                  labelText: 'Task description',
                  hintText: 'Write the description of to-do task here'),
            ).allSidePadding(),
          ],
        ),
      ).bottomPadding(),
    );
  }
}
