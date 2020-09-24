import 'package:ToDo_List/app_state/add_task_state.dart';
import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class PrioritySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddTaskState state = Provider.of<AddTaskState>(context);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(DefaultPaddingValue,
                DefaultPaddingValue, DefaultPaddingValue, 0),
            child: Text(
              'Priority (${state.getPriorityLabel})',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Slider(
            label: state.getPriorityLabel,
            divisions: Priority.values.length - 1,
            min: .0,
            max: Priority.values.length / 10,
            value: state.getPriorityValue,
            onChanged: (value) {
              state.setPriority = value;
            },
          ).allSidePadding(),
        ],
      ),
    );
  }
}
