import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PurpleTheme extends AppTheme {
  PurpleTheme()
      : super(
            name: 'Purple',
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
            primaryColor: Colors.purple,
            accentColor: Colors.purpleAccent,
            scaffoldBackgroundColor: Colors.purple.shade100,
            cardColor: Colors.white);
}

class DarkPurpleTheme extends AppTheme {
  DarkPurpleTheme()
      : super(
            name: 'Deep Purple',
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            primaryColor: Colors.deepPurple.shade900,
            accentColor: Colors.deepPurpleAccent.shade700,
            scaffoldBackgroundColor: Colors.deepPurple.shade800,
            cardColor: Colors.deepPurple.shade300);
}
