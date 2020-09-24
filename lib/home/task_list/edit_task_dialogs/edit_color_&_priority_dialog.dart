import 'package:ToDo_List/hive_db/task_storage.dart';
import 'package:ToDo_List/main.dart';
import 'package:ToDo_List/task_colors.dart';
import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/material.dart';

class EditColorAndPriority extends StatefulWidget {
  final int index, color;
  final Priority priority;
  const EditColorAndPriority(
      {@required this.index, this.color, @required this.priority});

  @override
  _EditColorAndPriorityState createState() => _EditColorAndPriorityState();
}

class _EditColorAndPriorityState extends State<EditColorAndPriority> {
  int color;
  Priority priority;
  bool newChanges = false;
  @override
  void initState() {
    color = widget.color;
    priority = widget.priority;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    newChanges =
        widget.color == color && widget.priority == priority ? false : true;
    return AlertDialog(
      title: Text('Edit task'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Change priority',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Wrap(
              spacing: DefaultPaddingValue,
              children: List.generate(
                  Priority.values.length,
                  (index) => ChoiceChip(
                        label: Text(
                            Priority.values[index].toString().split('.').last),
                        selected: Priority.values[index] == priority,
                        onSelected: (value) {
                          setState(() {
                            priority = Priority.values[index];
                          });
                        },
                      )),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change color',
                  style: Theme.of(context).textTheme.subtitle1,
                ).allSidePadding(DefaultPaddingValue / 4),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: taskColors.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        color = index;
                      });
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(DefaultPaddingValue / 4),
                      duration: AnimationDuration,
                      width: IconSize,
                      height: IconSize,
                      decoration: BoxDecoration(
                          border: color == index
                              ? Border.all(
                                  width: DefaultPaddingValue / 2,
                                  color: index == 1
                                      ? Theme.of(context).primaryColor
                                      : Colors.black)
                              : null,
                          borderRadius: BorderRadius.circular(7.5),
                          color: taskColors[index]),
                    ),
                  ),
                ),
              ],
            ).topPadding()
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: newChanges
                ? () async {
                    await editTask(
                        index: widget.index, color: color, priority: priority);
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
