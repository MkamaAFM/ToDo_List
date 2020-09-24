import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class RedTheme extends AppTheme {
  RedTheme()
      : super(
            name: 'Red',
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            primaryColor: Colors.red,
            accentColor: Colors.redAccent,
            scaffoldBackgroundColor: Colors.red.shade100,
            cardColor: Colors.white);
}

class DarkRedTheme extends AppTheme {
  DarkRedTheme()
      : super(
            name: 'Red black',
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            primaryColor: Colors.red.shade900,
            accentColor: Colors.redAccent.shade700,
            scaffoldBackgroundColor: Colors.black,
            cardColor: Colors.red.shade300);
}
