import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class OrangeTheme extends AppTheme {
  OrangeTheme()
      : super(
            name: 'Orange',
            brightness: Brightness.light,
            primarySwatch: Colors.orange,
            primaryColor: Colors.orange,
            accentColor: Colors.orangeAccent,
            scaffoldBackgroundColor: Colors.orange.shade100,
            cardColor: Colors.white);
}

class DarkOrangeTheme extends AppTheme {
  DarkOrangeTheme()
      : super(
            name: 'Deep orange',
            brightness: Brightness.dark,
            primarySwatch: Colors.deepOrange,
            primaryColor: Colors.deepOrange.shade900,
            accentColor: Colors.deepOrangeAccent.shade700,
            scaffoldBackgroundColor: Colors.deepOrange.shade800,
            cardColor: Colors.orange.shade700);
}
