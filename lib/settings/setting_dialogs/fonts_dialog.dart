import 'package:ToDo_List/app_state/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> allFonts = GoogleFonts.asMap().keys.toList();
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose font',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            'Fonts by Google Fonts (fonts.google.com)',
            style: Theme.of(context).textTheme.overline,
          )
        ],
      ),
      content: ListView.builder(
        itemCount: allFonts.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pop(context, allFonts[index]);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              allFonts[index],
              style: GoogleFonts.getTextTheme(
                      allFonts[index], Theme.of(context).textTheme)
                  .subtitle1,
            ),
          ),
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.pop(context, DefaultGoogleFont);
            },
            child: Text('Default font')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
  }
}
