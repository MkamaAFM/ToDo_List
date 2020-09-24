import 'package:ToDo_List/app_state/add_task_state.dart';
import 'package:ToDo_List/task_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class ChooseColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddTaskState state = Provider.of<AddTaskState>(context);
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RaisedButton(
              child: Text('Choose color'),
              onPressed: () async {
                state.setColor = await showDialog(
                    context: context, builder: (context) => ChangeColor());
              }),
          Container(
            width: IconSize * 2,
            height: IconSize,
            decoration: BoxDecoration(
                color: state.getColor, borderRadius: BorderRadius.circular(30)),
          )
        ],
      ).allSidePadding(),
    );
  }
}

class ChangeColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Choose task color'),
      content: GridView.builder(
        shrinkWrap: true,
        itemCount: taskColors.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pop(context, index);
          },
          child: Container(
            margin: EdgeInsets.all(DefaultPaddingValue / 4),
            width: IconSize,
            height: IconSize,
            decoration: BoxDecoration(
                color: taskColors[index],
                borderRadius: BorderRadius.circular(7.5)),
          ),
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
  }
}
