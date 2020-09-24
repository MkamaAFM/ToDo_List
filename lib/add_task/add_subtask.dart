import 'package:ToDo_List/app_state/add_task_state.dart';
import 'package:ToDo_List/todo/sub_task.dart';
import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class AddSubTask extends StatefulWidget {
  @override
  _AddSubTaskState createState() => _AddSubTaskState();
}

class _AddSubTaskState extends State<AddSubTask> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AddTaskState state = Provider.of<AddTaskState>(context);
    final Widget button = RaisedButton.icon(
        icon: Icon(Icons.add),
        label: Text('Add subtask'),
        onPressed: () async {
          state.addSubtask(await showDialog(
              context: context, builder: (context) => CreateSubTask()));
        }).allSidePadding();
    //
    //
    if (state.subtask.isEmpty) return button;
    return AnimatedSize(
      vsync: this,
      duration: AnimationDuration,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subtask${state.subtask.length > 1 ? 's' : ''}',
              style: Theme.of(context).textTheme.headline6,
            ).allSidePadding(),
            ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.subtask.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                      trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            state.deleteSubtask(index);
                          }),
                      subtitle: Text(
                          '${state.subtask[index].priority.toString().split('.').last}'
                          ' priority'),
                      title: Text(state.subtask[index].name),
                    )),
            button
          ],
        ),
      ),
    );
  }
}

class CreateSubTask extends StatefulWidget {
  @override
  _CreateSubTaskState createState() => _CreateSubTaskState();
}

class _CreateSubTaskState extends State<CreateSubTask> {
  SubTask subTask;
  @override
  void initState() {
    subTask = SubTask();
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
              autofocus: true,
              minLines: 1,
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  subTask.name = value;
                });
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
                              selected:
                                  subTask.priority == Priority.values[index],
                              onSelected: (value) {
                                setState(() {
                                  subTask.priority = Priority.values[index];
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
            onPressed: subTask.name.isEmpty
                ? null
                : () {
                    Navigator.pop(context, subTask);
                  },
            child: Text('Add'))
      ],
    );
  }
}
