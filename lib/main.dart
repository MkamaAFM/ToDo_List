import 'package:ToDo_List/app_state/theme_state.dart';
import 'package:ToDo_List/app_themes/theme_list.dart';
import 'package:ToDo_List/page_router.dart';
import 'package:ToDo_List/settings/setting_data.dart';
import 'package:ToDo_List/todo/sub_task.dart';
import 'package:ToDo_List/todo/task.dart';
import 'package:ToDo_List/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'hive_db/task_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await Hive.initFlutter();
  Hive.registerAdapter(SettingDataAdapter());
  Hive.registerAdapter(PriorityAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(SubTaskAdapter());
  Hive.registerAdapter(ToDoAdapter());
  //
  await Hive.openBox<Task>(TaskHiveBox);
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeState>(
        create: (context) => ThemeState()..getSettings(),
        child: Consumer<ThemeState>(
          builder: (context, theme, child) => MaterialApp(
            title: 'ToDo List',
            theme: lightThemes[theme.lightTheme].getTheme(),
            darkTheme: darkThemes[theme.darkTheme].getTheme(),
            themeMode: theme.themeMode,
            initialRoute: HomeRoute,
            onGenerateRoute: pageRoute,
          ),
        ));
  }
}

//
//
const double IconSize = 40;
const double DefaultPaddingValue = 16;
const Duration AnimationDuration = Duration(milliseconds: 500);

//
extension CommonPadding on Widget {
  Widget allSidePadding([double value = DefaultPaddingValue]) =>
      Padding(child: this, padding: EdgeInsets.all(value));
  Widget bottomPadding([double value = DefaultPaddingValue]) =>
      Padding(child: this, padding: EdgeInsets.only(bottom: value));
  Widget topPadding([double value = DefaultPaddingValue]) =>
      Padding(child: this, padding: EdgeInsets.only(top: value));
}

const Map<String, String> DeveloperContacts = {
  'E-mail': 'afmkama@gmail.com',
  'GitHub': 'Mkama Anthony Makoko (MkamaAFM)',
  'Twitter': 'Anthony Makoko\n\nhttps://twitter.com/MkamaMakoko?s=09',
  'Phone number/WhatsApp': '+255689420168',
  'Telegram': 'https://t.me/MkamaAFM'
};
