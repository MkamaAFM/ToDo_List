import 'package:ToDo_List/settings/setting_data.dart';
import 'package:hive/hive.dart';

const String SettingHiveBox = 'setting_hive_box';

Future<SettingData> retrieveSettings() async {
  Box<SettingData> settingBox = await Hive.openBox(SettingHiveBox);
  if (settingBox.isEmpty) return SettingData();

  final SettingData settingData = settingBox.getAt(0);
  await settingBox.close();
  return settingData;
}

Future saveSettings(SettingData settingData) async {
  Box<SettingData> settingBox = await Hive.openBox(SettingHiveBox);
  if (settingBox.isNotEmpty)
    await settingBox.putAt(0, settingData);
  else
    await settingBox.add(settingData);
  await settingBox.close();
}
