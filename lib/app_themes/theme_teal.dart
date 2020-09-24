import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class TealTheme extends AppTheme {
  TealTheme()
      : super(
            name: 'Teal',
            brightness: Brightness.light,
            primarySwatch: Colors.teal,
            primaryColor: Colors.teal,
            accentColor: Colors.tealAccent,
            scaffoldBackgroundColor: Colors.teal.shade100,
            cardColor: Colors.white);
}

class DarkTealTheme extends AppTheme {
  DarkTealTheme()
      : super(
            name: 'Teal',
            brightness: Brightness.dark,
            primarySwatch: Colors.teal,
            primaryColor: Colors.teal.shade900,
            accentColor: Colors.tealAccent.shade700,
            scaffoldBackgroundColor: Colors.teal.shade800,
            cardColor: Colors.teal.shade700);
}
