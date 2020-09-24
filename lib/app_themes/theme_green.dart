import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreenTheme extends AppTheme {
  GreenTheme()
      : super(
            name: 'Green',
            brightness: Brightness.light,
            primarySwatch: Colors.green,
            primaryColor: Colors.green,
            accentColor: Colors.yellowAccent.shade700,
            scaffoldBackgroundColor: Colors.green.shade100,
            cardColor: Colors.white);
}

class DarkGreenTheme extends AppTheme {
  DarkGreenTheme()
      : super(
            name: 'Green',
            brightness: Brightness.dark,
            primarySwatch: Colors.green,
            primaryColor: Colors.green.shade900,
            accentColor: Colors.yellowAccent.shade700,
            scaffoldBackgroundColor: Colors.green.shade800,
            cardColor: Colors.lightGreen.shade800);
}
