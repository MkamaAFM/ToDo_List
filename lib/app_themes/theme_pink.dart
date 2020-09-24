import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class PinkTheme extends AppTheme {
  PinkTheme()
      : super(
            name: 'Pink',
            brightness: Brightness.light,
            primarySwatch: Colors.pink,
            primaryColor: Colors.pink,
            accentColor: Colors.pinkAccent,
            scaffoldBackgroundColor: Colors.pink.shade100,
            cardColor: Colors.white);
}

class DarkPinkTheme extends AppTheme {
  DarkPinkTheme()
      : super(
            name: 'Pink',
            brightness: Brightness.dark,
            primarySwatch: Colors.pink,
            primaryColor: Colors.pink.shade900,
            accentColor: Colors.pinkAccent.shade700,
            scaffoldBackgroundColor: Colors.pink.shade800,
            cardColor: Colors.pink.shade300);
}
