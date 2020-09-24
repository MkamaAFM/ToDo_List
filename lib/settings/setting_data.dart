import 'package:ToDo_List/app_state/theme_state.dart';
import 'package:ToDo_List/hive_db/hive_type_id.dart';
import 'package:hive/hive.dart';
part 'setting_data.g.dart';

@HiveType(typeId: SettingTypeID)
class SettingData {
  @HiveField(0)
  String appbarName = 'To-Do List';
  @HiveField(1)
  int lightTheme = 0;
  @HiveField(2)
  int darkTheme = 0;
  @HiveField(3)
  bool useSystemTheme = true;
  @HiveField(4)
  bool lightThemeEnabled = true;
  @HiveField(5)
  String googleFont = DefaultGoogleFont;
}
