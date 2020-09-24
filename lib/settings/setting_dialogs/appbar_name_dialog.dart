import 'package:ToDo_List/app_state/theme_state.dart';
import 'package:flutter/material.dart';

class AppbarNameDialog extends StatefulWidget {
  final String _appbarName;
  AppbarNameDialog(this._appbarName);
  @override
  _AppbarNameDialogState createState() =>
      _AppbarNameDialogState(this._appbarName);
}

class _AppbarNameDialogState extends State<AppbarNameDialog> {
  _AppbarNameDialogState(this.name);
  final String name;
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Appbar name'),
      content: TextField(
        autofocus: true,
        controller: controller,
        onChanged: (value) {
          if (value.length == 0 || value.length == 1) setState(() {});
        },
        maxLength: 20,
        decoration: InputDecoration(
            labelText: 'Name', hintText: 'Write appbar name here'),
      ),
      actions: [
        FlatButton(
            onPressed: controller.text.length == 0
                ? null
                : () {
                    Navigator.pop(context, controller.text);
                  },
            child: Text('Apply')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context, DefaultAppbarName);
            },
            child: Text('Default name')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
  }
}
