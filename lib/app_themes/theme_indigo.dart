import 'package:ToDo_List/app_themes/theme_abstract.dart';
import 'package:flutter/material.dart';

class IndigoTheme extends AppTheme {
  IndigoTheme()
      : super(
            name: 'Indigo',
            brightness: Brightness.light,
            primarySwatch: Colors.indigo,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent,
            scaffoldBackgroundColor: Colors.indigo.shade100,
            cardColor: Colors.white);
}

class DarkIndigoTheme extends AppTheme {
  DarkIndigoTheme()
      : super(
            name: 'Indigo',
            brightness: Brightness.dark,
            primarySwatch: Colors.indigo,
            primaryColor: Colors.indigo.shade900,
            accentColor: Colors.indigoAccent.shade700,
            scaffoldBackgroundColor: Colors.indigo.shade800,
            cardColor: Colors.indigo.shade700);
}
