import 'package:ToDo_List/app_state/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  AppTheme(
      {@required String name,
      this.brightness = Brightness.light,
      @required this.primarySwatch,
      @required this.primaryColor,
      @required this.accentColor,
      @required this.scaffoldBackgroundColor,
      @required this.cardColor}) {
    themeName =
        brightness == Brightness.light ? '$name (light)' : '$name (dark)';
  }
  String themeName;
  String googleFont = DefaultGoogleFont;
  final Brightness brightness;
  final MaterialColor primarySwatch;
  final Color primaryColor;
  final Color accentColor;
  final Color scaffoldBackgroundColor;
  final Color cardColor;
  final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
  final ShapeBorder cardShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
  //
  //
  //
  //
  ThemeData getTheme() {
    return ThemeData(
        textTheme: GoogleFonts.getTextTheme(googleFont),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: cardColor,
          modalBackgroundColor: cardColor,
          elevation: 6,
          modalElevation: 6,
          shape: cardShape,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 6, backgroundColor: accentColor),
        appBarTheme: AppBarTheme(elevation: 6, shadowColor: primaryColor),
        dialogTheme: DialogTheme(backgroundColor: cardColor, shape: cardShape),
        buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        visualDensity: visualDensity,
        cardTheme: CardTheme(
            elevation: 4,
            color: cardColor,
            shape: cardShape,
            shadowColor: primaryColor),
        brightness: brightness,
        primarySwatch: primarySwatch,
        primaryColor: primaryColor,
        accentColor: accentColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor);
  }
}
