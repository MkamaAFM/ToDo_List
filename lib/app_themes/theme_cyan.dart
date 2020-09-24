import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class CyanTheme extends AppTheme {
  CyanTheme()
      : super(
            name: 'Cyan',
            brightness: Brightness.light,
            primarySwatch: Colors.cyan,
            primaryColor: Colors.cyan,
            accentColor: Colors.cyanAccent,
            scaffoldBackgroundColor: Colors.cyan.shade100,
            cardColor: Colors.white);
}

class DarkCyanTheme extends AppTheme {
  DarkCyanTheme()
      : super(
            name: 'Cyan',
            brightness: Brightness.dark,
            primarySwatch: Colors.cyan,
            primaryColor: Colors.cyan.shade900,
            accentColor: Colors.cyanAccent.shade700,
            scaffoldBackgroundColor: Colors.cyan.shade800,
            cardColor: Colors.cyan.shade700);
}
