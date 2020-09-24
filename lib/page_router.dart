import 'package:ToDo_List/home/home_page.dart';
import 'package:ToDo_List/main.dart';
import 'package:flutter/cupertino.dart';
import 'add_task/add_task_page.dart';

const String HomeRoute = 'home_page';
const String AddTaskRoute = 'add_to-do_task';
//
Route<dynamic> pageRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return PageRouteBuilder(
          transitionDuration: AnimationDuration,
          pageBuilder: (context, animation, secondaryAnimation) =>
              HomePage(animation));
    case AddTaskRoute:
      return PageRouteBuilder(
          transitionDuration: AnimationDuration,
          pageBuilder: (context, animation, secondaryAnimation) =>
              AddTaskPage(animation));
    default:
      return PageRouteBuilder(
          transitionDuration: AnimationDuration,
          pageBuilder: (context, animation, secondaryAnimation) =>
              HomePage(animation));
  }
}
