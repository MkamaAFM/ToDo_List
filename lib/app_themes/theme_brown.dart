import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class BrownTheme extends AppTheme {
  BrownTheme()
      : super(
            name: 'Brown',
            brightness: Brightness.light,
            primarySwatch: Colors.brown,
            primaryColor: Colors.brown,
            accentColor: Colors.amberAccent.shade700,
            scaffoldBackgroundColor: Colors.brown.shade100,
            cardColor: Colors.white);
}

class DarkBrownTheme extends AppTheme {
  DarkBrownTheme()
      : super(
            name: 'Brown',
            brightness: Brightness.dark,
            primarySwatch: Colors.brown,
            primaryColor: Colors.brown.shade900,
            accentColor: Colors.amberAccent.shade700,
            scaffoldBackgroundColor: Colors.brown.shade800,
            cardColor: Colors.brown.shade700);
}
