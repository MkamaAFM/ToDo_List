import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class LightGreenTheme extends AppTheme {
  LightGreenTheme()
      : super(
            name: 'Light green',
            brightness: Brightness.light,
            primarySwatch: Colors.lightGreen,
            primaryColor: Colors.lightGreen,
            accentColor: Colors.yellowAccent.shade700,
            scaffoldBackgroundColor: Colors.lightGreen.shade100,
            cardColor: Colors.white);
}

class DarkLightGreenTheme extends AppTheme {
  DarkLightGreenTheme()
      : super(
            name: 'Light green',
            brightness: Brightness.dark,
            primarySwatch: Colors.lightGreen,
            primaryColor: Colors.lightGreen.shade900,
            accentColor: Colors.yellowAccent.shade700,
            scaffoldBackgroundColor: Colors.lightGreen.shade800,
            cardColor: Colors.green.shade800);
}
