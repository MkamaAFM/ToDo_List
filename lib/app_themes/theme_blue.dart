import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class BlueTheme extends AppTheme {
  BlueTheme()
      : super(
            name: 'Blue',
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue,
            accentColor: Colors.blueAccent,
            scaffoldBackgroundColor: Colors.blue.shade100,
            cardColor: Colors.white);
}

class DarkBlueTheme extends AppTheme {
  DarkBlueTheme()
      : super(
            name: 'Blue',
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue.shade900,
            accentColor: Colors.blueAccent.shade700,
            scaffoldBackgroundColor: Colors.blue.shade800,
            cardColor: Colors.lightBlue.shade700);
}
