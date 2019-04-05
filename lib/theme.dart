import 'package:flutter/material.dart';

class DynamicTheme extends InheritedWidget{

  static List<ThemeData> themes = [
    // Light主题
    ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.grey[100],
    ),
    // Dark主题
    ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[100],
    ),
  ];
  final int theme;
  final Function() changeTheme;

  DynamicTheme({
    @required this.theme,
    @required this.changeTheme,
    @required Widget child,
  }) : super(child: child);

  static DynamicTheme of(BuildContext context){
    return context.inheritFromWidgetOfExactType(DynamicTheme);
  }

  @override
  bool updateShouldNotify(DynamicTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}