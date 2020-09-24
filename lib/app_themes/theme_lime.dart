import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class LimeTheme extends AppTheme {
  LimeTheme()
      : super(
            name: 'Lime',
            brightness: Brightness.light,
            primarySwatch: Colors.lime,
            primaryColor: Colors.lime,
            accentColor: Colors.yellowAccent.shade700,
            scaffoldBackgroundColor: Colors.lime.shade100,
            cardColor: Colors.white);
}

class DarkLimeTheme extends AppTheme {
  DarkLimeTheme()
      : super(
            name: 'Lime',
            brightness: Brightness.dark,
            primarySwatch: Colors.lime,
            primaryColor: Colors.lime.shade900,
            accentColor: Colors.lightGreenAccent.shade700,
            scaffoldBackgroundColor: Colors.lime.shade800,
            cardColor: Colors.lime.shade700);
}
