import 'package:flutter/material.dart';
import 'todo/todo.dart';

TextStyle tasknameTextstyle(Priority priority, BuildContext context) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  switch (priority) {
    case Priority.High:
      return textTheme.headline4;
    case Priority.Normal:
      return textTheme.headline5;
    case Priority.Low:
      return textTheme.headline6;
    default:
      return textTheme.bodyText1;
  }
}