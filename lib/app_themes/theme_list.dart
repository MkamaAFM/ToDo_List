import 'package:ToDo_List/app_themes/theme_blue.dart';
import 'package:ToDo_List/app_themes/theme_brown.dart';
import 'package:ToDo_List/app_themes/theme_cyan.dart';
import 'package:ToDo_List/app_themes/theme_green.dart';
import 'package:ToDo_List/app_themes/theme_indigo.dart';
import 'package:ToDo_List/app_themes/theme_light_green.dart';
import 'package:ToDo_List/app_themes/theme_lime.dart';
import 'package:ToDo_List/app_themes/theme_orange.dart';
import 'package:ToDo_List/app_themes/theme_pink.dart';
import 'package:ToDo_List/app_themes/theme_purple.dart';
import 'package:ToDo_List/app_themes/theme_red.dart';
import 'package:ToDo_List/app_themes/theme_teal.dart';
import 'theme_abstract.dart';

final List<AppTheme> lightThemes = <AppTheme>[
  BlueTheme(),
  PurpleTheme(),
  GreenTheme(),
  RedTheme(),
  PinkTheme(),
  OrangeTheme(),
  TealTheme(),
  LightGreenTheme(),
  CyanTheme(),
  BrownTheme(),
  IndigoTheme(),
  LimeTheme()
];
final List<AppTheme> darkThemes = <AppTheme>[
  DarkBlueTheme(),
  DarkPurpleTheme(),
  DarkGreenTheme(),
  DarkRedTheme(),
  DarkPinkTheme(),
  DarkOrangeTheme(),
  DarkTealTheme(),
  DarkLightGreenTheme(),
  DarkCyanTheme(),
  DarkBrownTheme(),
  DarkIndigoTheme(),
  DarkLimeTheme()
];
