import 'package:ToDo_List/app_themes/theme_list.dart';
import 'package:ToDo_List/hive_db/settings_storage.dart';
import 'package:ToDo_List/settings/setting_data.dart';
import 'package:flutter/material.dart';

const String DefaultGoogleFont = 'Varela Round';
const String DefaultAppbarName = 'To-Do List';

class ThemeState extends ChangeNotifier {
  ThemeState() {
    useSystemTheme = themeMode == ThemeMode.system;
  }
  String appbarName = DefaultAppbarName;
  String googleFont = DefaultGoogleFont;
  int lightTheme = 10;
  int darkTheme = 0;
  ThemeMode themeMode = ThemeMode.system;
  bool useSystemTheme;
  //
  //
  Future getSettings() async {
    SettingData settingData = await retrieveSettings();
    if (settingData == null) return;

    googleFont = settingData.googleFont;
    appbarName = settingData.appbarName;
    //
    lightTheme = settingData.lightTheme;
    darkTheme = settingData.darkTheme;
    lightThemes[lightTheme].googleFont = googleFont;
    darkThemes[darkTheme].googleFont = googleFont;
    //
    useSystemTheme = settingData.useSystemTheme;
    themeMode = settingData.useSystemTheme
        ? ThemeMode.system
        : settingData.lightThemeEnabled ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  //
  //
  void changeAppbarName(String name) async {
    if (name != null) {
      this.appbarName = name;
      notifyListeners();
      await saveSettings(await retrieveSettings()
        ..appbarName = name);
    }
  }

  void systemThemeEnabled(bool enabled) {
    this.useSystemTheme = enabled;
    switchThemeLight(theme: enabled ? ThemeMode.system : ThemeMode.light);
  }

  void switchThemeLight({ThemeMode theme}) async {
    if (theme != null)
      this.themeMode = theme;
    else {
      switch (this.themeMode) {
        case ThemeMode.system:
          themeMode = ThemeMode.light;
          break;
        case ThemeMode.light:
          themeMode = ThemeMode.dark;
          break;
        case ThemeMode.dark:
          themeMode = ThemeMode.light;
          break;
      }
    }
    notifyListeners();

    await saveSettings(await retrieveSettings()
      ..useSystemTheme = theme != null && theme == ThemeMode.system
      ..lightThemeEnabled = theme != null && theme == ThemeMode.light);
  }

  void changeTheme({int lightTheme, int darkTheme, String googleFont}) async {
    if (lightTheme != null) this.lightTheme = lightTheme;
    if (darkTheme != null) this.darkTheme = darkTheme;
    if (googleFont != null) {
      this.googleFont = googleFont;
      lightThemes[this.lightTheme].googleFont = googleFont;
      darkThemes[this.darkTheme].googleFont = googleFont;
    }
    notifyListeners();
    await saveSettings(await retrieveSettings()
      ..lightTheme = lightTheme ?? this.lightTheme
      ..darkTheme = darkTheme ?? this.darkTheme
      ..googleFont = googleFont ?? this.googleFont);
  }
}
