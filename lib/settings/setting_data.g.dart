// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingDataAdapter extends TypeAdapter<SettingData> {
  @override
  final int typeId = 0;

  @override
  SettingData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingData()
      ..appbarName = fields[0] as String
      ..lightTheme = fields[1] as int
      ..darkTheme = fields[2] as int
      ..useSystemTheme = fields[3] as bool
      ..lightThemeEnabled = fields[4] as bool
      ..googleFont = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, SettingData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.appbarName)
      ..writeByte(1)
      ..write(obj.lightTheme)
      ..writeByte(2)
      ..write(obj.darkTheme)
      ..writeByte(3)
      ..write(obj.useSystemTheme)
      ..writeByte(4)
      ..write(obj.lightThemeEnabled)
      ..writeByte(5)
      ..write(obj.googleFont);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
