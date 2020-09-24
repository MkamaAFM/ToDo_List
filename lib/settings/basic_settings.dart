import 'package:ToDo_List/app_state/theme_state.dart';
import 'package:ToDo_List/app_themes/theme_list.dart';
import 'package:ToDo_List/settings/setting_dialogs/appbar_name_dialog.dart';
import 'package:ToDo_List/settings/setting_dialogs/fonts_dialog.dart';
import 'package:ToDo_List/settings/setting_dialogs/themes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class BasicSettings extends StatefulWidget {
  @override
  _BasicSettingsState createState() => _BasicSettingsState();
}

class _BasicSettingsState extends State<BasicSettings>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ThemeState state = Provider.of<ThemeState>(context);
    return AnimatedSize(
      vsync: this,
      duration: AnimationDuration,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Settings', style: Theme.of(context).textTheme.headline6)
                .allSidePadding(),
            if (!state.useSystemTheme)
              SwitchListTile(
                  title: Text('Switch theme light'),
                  subtitle: Text(
                      '${state.themeMode.toString().split('.').last} theme'),
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    state.switchThemeLight();
                  }),
            CheckboxListTile(
                title: Text('Auto-change theme based on system'),
                subtitle: Text('Currently using '
                    '${state.useSystemTheme ? 'system theme' : 'manual theme'}'),
                value: state.useSystemTheme,
                onChanged: (value) {
                  state.systemThemeEnabled(value);
                }),
            ListTile(
              title: Text('Change theme color'),
              subtitle: Text('Current theme: '
                  '${lightThemes[state.lightTheme].themeName}'
                  ' and ${darkThemes[state.darkTheme].themeName}'),
              onTap: () async {
                ///NOTE: index 0 for light theme, 1 for dark theme
                final List<int> themes = await showDialog(
                  context: context,
                  builder: (context) =>
                      ThemesDialog(state.lightTheme, state.darkTheme),
                );
                if (themes != null)
                  state.changeTheme(
                      lightTheme: themes[0], darkTheme: themes[1]);
              },
            ),
            ListTile(
              title: Text('Change font'),
              subtitle: Text('Current font: ${state.googleFont}'),
              onTap: () async {
                state.changeTheme(
                    googleFont: await showDialog(
                        context: context, builder: (context) => FontsDialog()));
              },
            ),
            ListTile(
              title: Text('Change homepage appbar name'),
              subtitle: Text('Current name: ${state.appbarName}'),
              onTap: () async {
                state.changeAppbarName(await showDialog(
                  context: context,
                  builder: (context) => AppbarNameDialog(state.appbarName),
                ));
              },
            ),
            AboutListTile(
              applicationVersion: '1.0.0',
              aboutBoxChildren: [
                Text('Application by\nMkama Anthony Makoko'),
                ListView(
                  shrinkWrap: true,
                  children: List.generate(
                    DeveloperContacts.length,
                    (index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(DeveloperContacts.keys.elementAt(index)),
                      subtitle: SelectableText(
                          DeveloperContacts.values.elementAt(index)),
                    ),
                  ),
                )
              ],
            )
          ],
        ).allSidePadding(),
      ),
    );
  }
}
