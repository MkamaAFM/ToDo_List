import 'package:ToDo_List/app_themes/theme_list.dart';
import 'package:ToDo_List/main.dart';
import 'package:flutter/material.dart';

class ThemesDialog extends StatefulWidget {
  final int _lightTheme, _darkTheme;
  ThemesDialog(this._lightTheme, this._darkTheme);
  @override
  _ThemesDialogState createState() =>
      _ThemesDialogState(_lightTheme, _darkTheme);
}

class _ThemesDialogState extends State<ThemesDialog> {
  _ThemesDialogState(this.selectedLightTheme, this.selectedDarkTheme);
  int selectedLightTheme, selectedDarkTheme;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Choose themes'),
      content: SingleChildScrollView(
          child: Column(
        children: [
          ExpansionTile(
            title: Text('Light theme'),
            subtitle:
                Text('Current: ${lightThemes[selectedLightTheme].themeName}'),
            children: List.generate(
              lightThemes.length,
              (index) => ListTile(
                selected: lightThemes[selectedLightTheme].themeName ==
                    lightThemes[index].themeName,
                onTap: () {
                  setState(() {
                    selectedLightTheme = index;
                  });
                },
                title: Text(lightThemes[index].themeName),
                trailing: Container(
                  width: IconSize,
                  height: IconSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightThemes[index].primaryColor),
                ),
              ),
            ),
          ),
          SizedBox(height: DefaultPaddingValue),
          ExpansionTile(
            title: Text('Dark theme'),
            subtitle:
                Text('Current: ${darkThemes[selectedDarkTheme].themeName}'),
            children: List.generate(
              darkThemes.length,
              (index) => ListTile(
                selected: darkThemes[selectedDarkTheme].themeName ==
                    darkThemes[index].themeName,
                onTap: () {
                  setState(() {
                    selectedDarkTheme = index;
                  });
                },
                title: Text(darkThemes[index].themeName),
                trailing: Container(
                  width: IconSize,
                  height: IconSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightThemes[index].primaryColor),
                ),
              ),
            ),
          )
        ],
      )),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.pop(context, [selectedLightTheme, selectedDarkTheme]);
            },
            child: Text('Apply')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context, [10, 0]);
            },
            child: Text('Default themes')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
  }
}
